#!/usr/bin/env bash
# Full-page screenshots of a page at the three reference widths.
#
#   capture.sh <url-or-html-file> <output-dir> [label]
#
# Writes <output-dir>/<label>-360.png, -768.png, -1440.png (label defaults to "shot").
# Uses the Playwright CLI through npx, and installs its Chromium on first run.
# Set WIDTHS="390 1280" to override the widths, WAIT=2000 to wait longer (ms).
set -euo pipefail

[ $# -ge 2 ] || { sed -n '2,9p' "$0"; exit 2; }
target="$1"; out="$2"; label="${3:-shot}"
widths="${WIDTHS:-360 768 1440}"
wait_ms="${WAIT:-1000}"

command -v npx >/dev/null 2>&1 || { echo "npx (Node.js) is required." >&2; exit 1; }

# A local file becomes a file:// URL, so relative assets still resolve.
if [ -e "$target" ]; then
  target="file://$(readlink -f "$target")"
fi

mkdir -p "$out"

pw() { npx -y playwright "$@"; }

shoot() {
  pw screenshot --full-page --wait-for-timeout="$wait_ms" \
    --viewport-size="$1,900" "$target" "$out/$label-$1.png" >/dev/null 2>&1
}

for w in $widths; do
  if ! shoot "$w"; then
    # First run on this machine: the browser is not downloaded yet.
    pw install chromium >/dev/null 2>&1 || true
    shoot "$w" || { echo "capture failed at ${w}px for $target" >&2; exit 1; }
  fi
  echo "$out/$label-$w.png"
done
