# hotchi-dev/homebrew-tap (private)

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

Access: the tap is private, so `brew tap hotchi-dev/tap` needs the user's own
GitHub credentials (`gh auth login && gh auth setup-git`). No shared token.
