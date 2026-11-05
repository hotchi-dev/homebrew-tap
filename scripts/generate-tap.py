#!/usr/bin/env python3
"""Refresh a reviewable snapshot, then reproduce a bottle-only tap offline.
Usage: generate-tap.py TAP_DIR [--refresh]
No credentials are read; gh uses the operator's existing keychain session.
"""
import base64
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys
import urllib.request

out = Path(sys.argv[1])
out.mkdir(parents=True, exist_ok=True)
lock = out / 'upstream-lock.json'

def fetch(kind, name):
    with urllib.request.urlopen(f'https://formulae.brew.sh/api/{kind}/{name}.json', timeout=60) as r:
        return json.load(r)

def ruby(repo, path):
    response = subprocess.check_output(['gh', 'api', f'repos/{repo}/contents/{path}'])
    return base64.b64decode(json.loads(response)['content']).decode()

if '--refresh' in sys.argv:
    manifest = json.loads(Path('manifest/testing.json').read_text())
    snapshot = {'formulae': {}, 'casks': {}}
    def formula(name):
        if name in snapshot['formulae']:
            return
        d = fetch('formula', name)
        snapshot['formulae'][name] = d
        for dep in d['dependencies'] + d.get('recommended_dependencies', []):
            formula(dep)
    for app in manifest['apps'].values():
        s = app['sources'].get('darwin', {})
        if 'brew' in s:
            formula(s['brew'])
        if 'brew_cask' in s:
            name = s['brew_cask'].split('/')[-1]
            if name == 'netbird-ui':
                raw = ruby('netbirdio/homebrew-tap', 'Casks/netbird-ui.rb')
                version = re.search(r'version "([^"]+)"', raw).group(1)
                snapshot['casks'][name] = {'version': version, 'ruby': raw, 'upstream': 'netbirdio/homebrew-tap'}
                for dep in re.findall(r'depends_on formula: "([^"]+)"', raw):
                    formula(dep)
            else:
                d = fetch('cask', name)
                d['ruby'] = ruby('Homebrew/homebrew-cask', d['ruby_source_path'])
                snapshot['casks'][name] = d
                for dep in (d.get('depends_on') or {}).get('formula', []):
                    formula(dep)
    lock.write_text(json.dumps(snapshot, sort_keys=True, indent=2) + '\n')

snapshot = json.loads(lock.read_text())
(out / 'Formula').mkdir(exist_ok=True)
(out / 'Casks').mkdir(exist_ok=True)
coverage = []
for name, d in sorted(snapshot['formulae'].items()):
    cls = ''.join(x[:1].upper()+x[1:] for x in re.split('[-_ .]', name)).replace('@', 'AT').replace('+', 'x')
    stable = d['bottle']['stable']
    files = {k:v for k,v in stable['files'].items() if 'linux' not in k}
    if not files:
        raise SystemExit(f'{name}: no macOS bottles; refusing source build')
    lines = [f'class {cls} < Formula', f'  desc {json.dumps(d["desc"])}', f'  homepage {json.dumps(d["homepage"])}', f'  url {json.dumps(d["urls"]["stable"]["url"])}', f'  version {json.dumps(d["versions"]["stable"])}', f'  sha256 {json.dumps(d["urls"]["stable"]["checksum"])}']
    if d.get('revision'): lines.append(f'  revision {d["revision"]}')
    lines += ['', '  bottle do', f'    root_url {json.dumps(stable["root_url"])}']
    if stable.get('rebuild'): lines.append(f'    rebuild {stable["rebuild"]}')
    prefixes = []
    for tag, f in sorted(files.items()):
        cellar = ':' + f['cellar'][1:] if f['cellar'].startswith(':') else json.dumps(f['cellar'])
        prefixes.append((f'    sha256 cellar: {cellar}, {tag}:', f['sha256']))
    width = max(len(p) for p, _ in prefixes)
    lines += [f'{p.ljust(width)} {json.dumps(digest)}' for p, digest in prefixes]
    lines += ['  end']
    deps = sorted(set(d['dependencies'] + d.get('recommended_dependencies', [])))
    if deps:
        lines.append('')
        lines += [f'  depends_on "hotchi-dev/tap/{dep}"' for dep in deps]
    lines += ['', '  def install', '    odie "Quill tap is bottle-only; this macOS/architecture has no pinned bottle"', '  end',
              '', '  test do', '    assert_path_exists prefix', '  end', 'end', '']
    (out / 'Formula' / f'{name}.rb').write_text('\n'.join(lines))
    coverage.append({'id': name, 'kind': 'homebrew', 'package': name, 'version': d['versions']['stable'], 'paths': [f'hotchi-dev/homebrew-tap/Formula/{name}.rb'], 'bottles': sorted(files)})
for name,d in sorted(snapshot['casks'].items()):
    raw = d['ruby']
    for dep in snapshot['formulae']:
        raw = raw.replace(f'formula: "{dep}"', f'formula: "hotchi-dev/tap/{dep}"')
    (out / 'Casks' / f'{name}.rb').write_text(raw)
    coverage.append({'id': name, 'kind': 'homebrew-cask' if name != 'netbird-ui' else 'github', 'package': name if name != 'netbird-ui' else 'netbirdio/netbird', 'version': d['version'], 'paths': [f'hotchi-dev/homebrew-tap/Casks/{name}.rb']})
(out / 'watch-sources.json').write_text(json.dumps(coverage, indent=2) + '\n')
print(f'Generated {len(snapshot["formulae"])} formulae and {len(snapshot["casks"])} casks')
