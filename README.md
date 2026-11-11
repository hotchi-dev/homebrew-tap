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
`.github/workflows/upstream-watch.yml`), which runs daily. When it first
sees a newer upstream version it opens an issue in Quill immediately; once that
issue is 72h old it adds the `upstream-update` label (Quill
`internal/upstream/upstream.go`, `Run`). The watcher only creates issues and
labels in Quill: it never changes pins or this repository. The issue asks for a
tested pin-bump PR; the watcher does not open one.

Trust: the tap is public and `brew tap hotchi-dev/tap` needs no credentials.
Quill does not trust the tap's moving `main`: its signed manifest pins
`brew_tap.commit`, and Quill checks out exactly that commit (detached) and
runs brew with `HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_NO_INSTALL_FROM_API=1`.
For Quill-managed installs, a tap change therefore only takes effect through a
manifest PR that moves the pin. Someone running `brew tap hotchi-dev/tap`
directly follows `main`.

Platforms: macOS arm64 only. Intel Macs are unsupported; no source builds.

## Landing

- **How a change lands.** Open a PR into `main` (`gh pr create -R hotchi-dev/homebrew-tap -B main`).
  Merge methods allowed by the repository: squash, rebase, merge commit.
- **What reaches users, and how.** Quill-managed installs use the commit pinned
  in `brew_tap.commit` (`manifest/testing.json` in Quill), so merging here does not
  reach them until a Quill manifest PR moves the pin (see Trust above). Anyone who
  taps this repository directly gets `main` as soon as it merges. Landing here and
  moving the pin are separate steps, and the pin is Quill's.
- **Enforced vs convention.** Nothing is enforced on `main`: it has no ruleset and
  no branch protection, so nothing blocks a direct push or a force-push. The only
  automation is the CI workflow (`.github/workflows/ci.yml`), an automatic check
  on PRs and pushes to `main` (offline regeneration must leave no diff; `brew
  style` and `brew audit` on macOS). It is not a required check and does not
  block a merge. Using PRs, and never force-pushing, is by discipline.
  A change touching only root-level `*.md` files skips CI.
- **Bump a package by hand.** From a Quill checkout (the script reads
  `manifest/testing.json` relative to the current directory), run
  `python3 <tap>/scripts/generate-tap.py <tap> --refresh`; it needs network and an
  authenticated `gh`. Then run it again without `--refresh`, check that
  `git diff` shows only the packages you meant, and open the PR. Moving the pin
  is a separate Quill PR.

Not verified here: that Quill's signed manifest is the only consumer of this
tap; Quill's own checkout and `HOMEBREW_*` behaviour and manifest signing
(taken from the earlier README); the arm64-only policy (the formulae pin
non-arm64 bottle tags such as `sonoma` too, but `install` refuses source builds
regardless); and how Quill's `upstream/sources.json` is kept in step with
`watch-sources.json`.
