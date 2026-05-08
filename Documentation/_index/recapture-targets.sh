#!/bin/bash
# Targeted recapture — fetches a small list of specific URLs, not the whole manifest.
# Reuses fetch_url + JQ_FILTER from capture.sh.
# Usage: ./recapture-targets.sh   (edit TARGETS below to change the list)

set +e
DIR="$(cd "$(dirname "$0")" && pwd)"
DOC_ROOT="$(cd "$DIR/.." && pwd)"

# Source capture.sh in "library mode" — wrap its dispatch so the case block doesn't run.
# capture.sh ends with `case "${1:-all}" in ... esac` — pass an unrecognized arg to skip.
source "$DIR/capture.sh" __library__ 2>/dev/null

# Each target: URL | target file path (relative to DOC_ROOT) | framework | category
# B10 (Phase 1 checkpoint, 2026-05-07): the 3 gradient types are real macOS
# SwiftUI primitives but were absent from the original capture pass — fill the
# gap before Phase 3 dispatches.
TARGETS=(
  "https://developer.apple.com/documentation/swiftui/lineargradient|SwiftUI/drawing-and-graphics/lineargradient.md|SwiftUI|Drawing and graphics"
  "https://developer.apple.com/documentation/swiftui/radialgradient|SwiftUI/drawing-and-graphics/radialgradient.md|SwiftUI|Drawing and graphics"
  "https://developer.apple.com/documentation/swiftui/angulargradient|SwiftUI/drawing-and-graphics/angulargradient.md|SwiftUI|Drawing and graphics"
)

for target in "${TARGETS[@]}"; do
  IFS='|' read -r url rel_path framework category <<< "$target"
  abs_path="$DOC_ROOT/$rel_path"
  echo "Fetching: $url"
  echo "  → $rel_path"
  rm -f "$abs_path"  # force re-fetch even if existing file >MIN_BYTES
  fetch_url "$url" "$abs_path" "$framework" "$category"
  size=$(wc -c < "$abs_path" 2>/dev/null || echo 0)
  echo "  size: $size bytes"
  echo ""
done

echo "=== Recapture complete ==="
echo "Total: $total  OK: $ok  Failed: $failed  Tiny(<800B): $tiny"
