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
TARGETS=(
  "https://developer.apple.com/documentation/appkit/nsslideraccessory|AppKit/views-and-controls/nsslideraccessory.md|AppKit|Views and controls"
  "https://developer.apple.com/documentation/appkit/nsseguePerforming|AppKit/resource-management/nsseguePerforming.md|AppKit|Resource management"
  "https://developer.apple.com/documentation/swiftui/manipulablerespondermodifier|SwiftUI/view-fundamentals/manipulablerespondermodifier.md|SwiftUI|View fundamentals"
  "https://developer.apple.com/design/human-interface-guidelines|HIG/root/human-interface-guidelines.md|HIG|Root"
  "https://developer.apple.com/design/human-interface-guidelines/typography|HIG/foundations/typography.md|HIG|Foundations"
  "https://developer.apple.com/design/human-interface-guidelines/layout|HIG/foundations/layout.md|HIG|Foundations"
  "https://developer.apple.com/design/human-interface-guidelines/color|HIG/foundations/color.md|HIG|Foundations"
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
