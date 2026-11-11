# hotchi-dev/homebrew-tap

Quill's pinned macOS packages. Every formula pins an exact version and source
sha256, and its `bottle` block points at Homebrew's own GHCR bottles by sha256,
so nothing is rebuilt. `install` refuses source builds: a platform with no pinned
bottle is unsupported, not compiled. Dependencies are qualified to this tap.

`Formula/`, `Casks/` and `watch-sources.json` are generated, and
`upstream-lock.json` is their input snapshot: do not edit them by hand.
This README is hand-written.

```
python3 scripts/generate-tap.py . --refresh   # re-snapshot upstream (run from a Quill checkout's cwd: reads manifest/testing.json)
python3 scripts/generate-tap.py .             # offline, deterministic, from upstream-lock.json
```

Bumps are discovered by Quill's upstream watcher (`hotchi-dev/quill`,
`.github/workflows/upstream-watch.yml`), which opens an issue in Quill once a
new upstream version has been quarantined for 72h. The watcher never changes
pins or this repository; a person or agent proposes the bump PR.

Trust: the tap is public and `brew tap hotchi-dev/tap` needs no credentials.
Quill does not trust the tap's moving `main`: its signed manifest pins
`brew_tap.commit`, and Quill checks out exactly that commit (detached) and
runs brew with `HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_NO_INSTALL_FROM_API=1`.
A tap change only reaches users through a manifest PR that moves the pin.

Platforms: macOS arm64 only. Intel Macs are unsupported; no source builds.

## Landing

- **How a change lands.** Open a PR into `main` (`gh pr create -R hotchi-dev/homebrew-tap -B main`).
  Merge methods allowed by the repository: squash, rebase, merge commit.
- **What reaches users, and how.** Merging here reaches no one on its own. A user
  gets a tap change only after a Quill manifest PR moves `brew_tap.commit` in
  `manifest/testing.json` (see Trust above). Landing here and moving the pin are
  separate steps, and the pin is Quill's.
- **Enforced.** Only the CI workflow in `.github/workflows/ci.yml`. It runs on
  PRs and pushes to `main` (offline regeneration must leave no diff; `brew style`
  and `brew audit` on macOS). It is **not required**: `main` has no ruleset and no
  branch protection, and nothing blocks a direct push or a force-push.
  Everything else here is by discipline: PRs rather than pushes, no force-push.
  A change touching only root-level `*.md` files skips CI.
- **Bump a package by hand.** From a Quill checkout (the script reads
  `manifest/testing.json` relative to the current directory), run
  `python3 <tap>/scripts/generate-tap.py <tap> --refresh`; it needs network and an
  authenticated `gh`. Then run it again without `--refresh`, check that
  `git diff` shows only the packages you meant, and open the PR. Moving the pin
  is a separate Quill PR.

Not verified here: that Quill's signed manifest is the only consumer of this
tap, and how Quill's `upstream/sources.json` is kept in step with
`watch-sources.json`.
