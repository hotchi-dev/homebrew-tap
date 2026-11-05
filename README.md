# hotchi-dev/homebrew-tap

Quill's pinned macOS packages. Every formula pins an exact version and source
sha256, and its `bottle` block points at Homebrew's own GHCR bottles by sha256,
so nothing is rebuilt. `install` refuses source builds: a platform with no pinned
bottle is unsupported, not compiled. Dependencies are qualified to this tap.

Generated — do not edit by hand.

```
python3 scripts/generate-tap.py . --refresh   # re-snapshot upstream (run from a Quill checkout's cwd: reads manifest/testing.json)
python3 scripts/generate-tap.py .             # offline, deterministic, from upstream-lock.json
```

Bumps arrive through Quill's upstream watcher (`hotchi-dev/quill`,
`.github/workflows/upstream-watch.yml`) after a 72h quarantine.

Trust: the tap is public and `brew tap hotchi-dev/tap` needs no credentials.
Quill does not trust the tap's moving `main`: its signed manifest pins
`brew_tap.commit`, and Quill checks out exactly that commit (detached) and
runs brew with `HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_NO_INSTALL_FROM_API=1`.
A tap change only reaches users through a manifest PR that moves the pin.

Platforms: macOS arm64 only. Intel Macs are unsupported; no source builds.
