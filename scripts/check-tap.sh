#!/bin/bash
# Check every generated package, retaining all failures and their repair paths.
set -euo pipefail
mode="${1:?usage: check-tap.sh style|audit}"
case "$mode" in
  style|audit) ;;
  *) echo "Unknown check: $mode" >&2; exit 2 ;;
esac
tap="$(brew --repository hotchi-dev/tap)"
failed=0
for file in "$tap"/Formula/*.rb "$tap"/Casks/*.rb; do
  name="$(basename "$file" .rb)"
  kind=formula
  if [[ "$file" == */Casks/* ]]; then kind=cask; fi
  # This third-party cask is deliberately copied verbatim.
  if [[ "$mode" == style && "$kind" == cask && "$name" == netbird-ui ]]; then
    echo "Skipping style for Casks/netbird-ui.rb (verbatim third-party snapshot)"
    continue
  fi
  relative="Formula/$name.rb"
  if [[ "$kind" == cask ]]; then relative="Casks/$name.rb"; fi
  echo "::group::$mode $relative"
  status=0
  if [[ "$mode" == style ]]; then
    brew style "$file" || status=$?
  else
    # Source mirrors do not apply to bottle-only installs. Installed checks
    # inspect the runner's core kegs rather than this tap's packages.
    except=urls,installed
    if [[ "$kind" == cask && "$name" == netbird-ui ]]; then
      except="$except,sha256_no_check_if_unversioned"
    fi
    brew audit "--$kind" "hotchi-dev/tap/$name" "--except=$except" || status=$?
  fi
  echo '::endgroup::'
  if [[ "$status" != 0 ]]; then
    failed=1
    if [[ "$kind" == formula ]]; then
      repair="Fix the formula renderer in scripts/generate-tap.py; for upstream metadata, refresh upstream-lock.json from a Quill checkout."
    else
      repair="Refresh this cask's Ruby snapshot in upstream-lock.json from a Quill checkout; fix dependency rewriting in scripts/generate-tap.py if applicable."
    fi
    echo "::error file=$relative,title=$mode failed for $name::$repair Regenerate with python3 -I scripts/generate-tap.py .; never hand-edit $relative. See the $mode $relative log group for the exact Homebrew diagnostic."
  fi
done
exit "$failed"
