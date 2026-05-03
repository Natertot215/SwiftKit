#!/bin/bash
# SwiftKit doc capture — Bash + curl + jq, no Python.
# Reads URL list files, fetches Apple JSON variant API, converts to markdown.
# Idempotent: skips files >MIN_BYTES. Re-run after fixing URLs in _links/*.

set +e
DOC_ROOT="/Users/nathantaichman/The Studio/Projects/SwiftKit/Documentation"
LOG="$DOC_ROOT/_index/capture-log.md"
DATE="$(date +%Y-%m-%d)"
SLEEP_BETWEEN="0.3"
MIN_BYTES=2500

ok=0; skipped=0; failed=0; total=0; tiny=0

slugify() { echo "$1" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//'; }

to_json_url() {
  local u="$1"
  if [[ "$u" == *"developer.apple.com/design/human-interface-guidelines/"* ]]; then
    echo "${u/developer.apple.com\/design\/human-interface-guidelines\//developer.apple.com/tutorials/data/design/human-interface-guidelines/}.json"
  elif [[ "$u" == "https://developer.apple.com/design/human-interface-guidelines" ]]; then
    echo "https://developer.apple.com/tutorials/data/design/human-interface-guidelines.json"
  elif [[ "$u" == *"developer.apple.com/documentation/"* ]]; then
    echo "${u/developer.apple.com\/documentation\//developer.apple.com/tutorials/data/documentation/}.json"
  else
    echo "$u.json"
  fi
}

JQ_FILTER='
def asArray: if . == null then [] elif type == "array" then . else [.] end;

def inline:
  asArray | map(
    if . == null then ""
    elif type == "string" then .
    elif type == "object" then
      (.text // "") +
      (if .type == "codeVoice" then "`" + (.code // "") + "`" else "" end) +
      (if .type == "emphasis" then "*" + ((.inlineContent // []) | map(.text // "") | join("")) + "*" else "" end) +
      (if .type == "strong" then "**" + ((.inlineContent // []) | map(.text // "") | join("")) + "**" else "" end) +
      (if .type == "reference" then "`" + ((.identifier // "") | sub("^doc://[^/]+/documentation/[^/]+/"; "") | sub("^doc://[^/]+/documentation/"; "")) + "`" else "" end) +
      (if .type == "link" then "[" + (.title // .destination // "") + "](" + (.destination // "") + ")" else "" end) +
      ((.inlineContent // []) | map(if type == "object" then (.text // "") else "" end) | join(""))
    else "" end
  ) | join("");

def block:
  asArray | map(
    if . == null then ""
    elif type == "object" then
      if .type == "heading" then ("#" * ((.level // 2) + 1)) + " " + (.text // "")
      elif .type == "paragraph" then ((.inlineContent // []) | inline)
      elif .type == "codeListing" then "```" + (.syntax // "swift") + "\n" + ((.code // []) | join("\n")) + "\n```"
      elif .type == "unorderedList" then ((.items // []) | map("- " + ((.content // []) | block)) | join("\n"))
      elif .type == "orderedList" then ((.items // []) | to_entries | map((.key+1|tostring) + ". " + ((.value.content // []) | block)) | join("\n"))
      elif .type == "aside" then "> **" + (((.style // .name // "Note") | tostring | ascii_upcase)) + ":** " + ((.content // []) | block)
      elif .type == "termList" then ((.items // []) | map("**" + ((.term.inlineContent // []) | inline) + "**: " + ((.definition.content // []) | block)) | join("\n\n"))
      elif .type == "table" then
        (.rows // []) as $rows |
        if ($rows | length) == 0 then ""
        else
          ($rows | map(map([.. | objects | select(.type == "text") | .text] | join(" ")))) as $r |
          ($r[0] | length) as $cols |
          if (.header // "") == "row" then
            "| " + ($r[0] | join(" | ")) + " |\n" +
            "|" + ([range(0; $cols)] | map("---") | join("|")) + "|\n" +
            ($r[1:] | map("| " + (. | join(" | ")) + " |") | join("\n"))
          else
            ($r | map("| " + (. | join(" | ")) + " |") | join("\n"))
          end
        end
      elif .type == "row" then ""
      elif .type == "step" then "1. " + ((.content // []) | block)
      else
        ((.content // []) | block) + ((.inlineContent // []) | inline)
      end
    else "" end
  ) | map(select(. != "")) | join("\n\n");

def declarations:
  ((.primaryContentSections // []) | map(select(.kind == "declarations"))) as $secs |
  if ($secs | length) > 0 then
    "## Declaration\n\n" +
    ($secs | map(
      ((.declarations // []) | map(
        "```swift\n" + ((.tokens // []) | map(.text // "") | join("")) + "\n```"
      ) | join("\n\n"))
    ) | join("\n\n"))
  else "" end;

def abstractText:
  if ((.abstract // []) | length) > 0 then ((.abstract // []) | inline) + "\n" else "" end;

def contentBlocks:
  ((.primaryContentSections // []) | map(select(.kind == "content"))) as $secs |
  if ($secs | length) > 0 then
    ($secs | map((.content // []) | block) | join("\n\n"))
  else "" end;

def parametersList:
  ((.primaryContentSections // []) | map(select(.kind == "parameters"))) as $secs |
  if ($secs | length) > 0 then
    "## Parameters\n\n" +
    ($secs | map(
      ((.parameters // []) | map(
        "- **" + (.name // "") + "**: " + ((.content // []) | block)
      ) | join("\n"))
    ) | join("\n"))
  else "" end;

def returnValue:
  ((.primaryContentSections // []) | map(select(.kind == "returnValue"))) as $secs |
  if ($secs | length) > 0 then
    "## Return Value\n\n" + ($secs | map((.content // []) | block) | join("\n\n"))
  else "" end;

def refTitle($id; $refs):
  ($refs[$id].title // ($id | tostring | sub("^doc://[^/]+/documentation/[^/]+/"; "") | sub("^doc://[^/]+/documentation/"; "")));

def topicsSection($refs):
  if ((.topicSections // []) | length) > 0 then
    "## Topics\n\n" +
    (.topicSections | map(
      "### " + (.title // "Symbols") + "\n\n" +
      ((.identifiers // []) | map("- `" + refTitle(.; $refs) + "`") | join("\n"))
    ) | join("\n\n"))
  else "" end;

def seeAlsoSection($refs):
  if ((.seeAlsoSections // []) | length) > 0 then
    "## See Also\n\n" +
    (.seeAlsoSections | map(
      ((.identifiers // []) | map("- `" + refTitle(.; $refs) + "`") | join("\n"))
    ) | join("\n\n"))
  else "" end;

def availability:
  ((.metadata // {}).platforms // []) as $plats |
  if ($plats | length) > 0 then
    "## Availability\n\n" +
    ($plats | map(
      "- " + (.name // "") + " " + (.introducedAt // "?") +
      (if .deprecatedAt then " (deprecated " + .deprecatedAt + ")" else "" end) +
      (if .beta then " (beta)" else "" end)
    ) | join("\n"))
  else "" end;

def relationships($refs):
  ((.relationshipsSections // [])) as $secs |
  if ($secs | length) > 0 then
    "## Relationships\n\n" +
    ($secs | map(
      "**" + (.title // "") + "**: " + ((.identifiers // []) | map("`" + refTitle(.; $refs) + "`") | join(", "))
    ) | join("\n\n"))
  else "" end;

. as $doc |
($doc.references // {}) as $refs |
"# " + (($doc.metadata.title // "Untitled") | tostring) + "\n\n" +
($doc | abstractText) +
"\n" + ($doc | declarations) +
"\n\n" + ($doc | contentBlocks) +
"\n\n" + ($doc | parametersList) +
"\n\n" + ($doc | returnValue) +
"\n\n" + ($doc | relationships($refs)) +
"\n\n" + ($doc | availability) +
"\n\n" + ($doc | topicsSection($refs)) +
"\n\n" + ($doc | seeAlsoSection($refs))
'

fetch_url() {
  local url="$1"; local target="$2"; local framework="$3"; local category="$4"
  total=$((total+1))

  if [ -f "$target" ]; then
    local size=$(wc -c < "$target")
    if [ "$size" -gt "$MIN_BYTES" ]; then skipped=$((skipped+1)); return 0; fi
  fi

  local json_url=$(to_json_url "$url")
  local tmp=$(mktemp)
  local http_code

  for attempt in 1 2 3; do
    http_code=$(curl -sL -w "%{http_code}" -o "$tmp" -A "Mozilla/5.0 SwiftKit-doc-mirror/1.0" "$json_url" 2>/dev/null || echo "000")
    if [ "$http_code" = "200" ] && [ -s "$tmp" ]; then break; fi
    if [ "$http_code" = "429" ] || [ "$http_code" = "503" ]; then sleep 30; else sleep 2; fi
  done

  if [ "$http_code" != "200" ] || [ ! -s "$tmp" ]; then
    mkdir -p "$(dirname "$target")"
    {
      echo "---"
      echo "url: $url"
      echo "framework: $framework"
      echo "category: $category"
      echo "title: $(basename "$target" .md)"
      echo "kind: unknown"
      echo "captured: $DATE"
      echo "status: failed"
      echo "fetch_attempts: 3"
      echo "http_code: $http_code"
      echo "---"
      echo ""
      echo "# Fetch failed"
      echo ""
      echo "URL: \`$url\` (JSON: \`$json_url\`). HTTP code: $http_code."
    } > "$target"
    failed=$((failed+1))
    rm -f "$tmp"
    return 1
  fi

  if ! jq -e '.' "$tmp" > /dev/null 2>&1; then
    mkdir -p "$(dirname "$target")"
    {
      echo "---"
      echo "url: $url"
      echo "framework: $framework"
      echo "category: $category"
      echo "title: $(basename "$target" .md)"
      echo "kind: unknown"
      echo "captured: $DATE"
      echo "status: failed"
      echo "reason: invalid_json"
      echo "---"
      echo ""
      echo "# Fetch failed: invalid JSON response"
    } > "$target"
    failed=$((failed+1))
    rm -f "$tmp"
    return 1
  fi

  local title=$(jq -r '.metadata.title // ""' "$tmp" 2>/dev/null)
  local kind=$(jq -r '.metadata.symbolKind // .metadata.role // "article"' "$tmp" 2>/dev/null)

  local body
  body=$(jq -r "$JQ_FILTER" "$tmp" 2>/tmp/jq_err)
  local jq_status=$?

  if [ "$jq_status" -ne 0 ] || [ -z "$body" ]; then
    body=$(jq -r '
      def walkText: if type == "object" then
          (.text // "") + ((.inlineContent // [], .content // [], .declarations // [], .primaryContentSections // [], .topicSections // [], .seeAlsoSections // []) | map(walkText) | join(" "))
        elif type == "array" then map(walkText) | join(" ")
        else (. // "" | tostring) end;
      "# " + (.metadata.title // "Untitled") + "\n\n" + (.abstract // [] | map(.text // "") | join("")) + "\n\n" + (. | walkText)
    ' "$tmp" 2>/dev/null)
    if [ -z "$body" ]; then
      body="# $title\n\n[Conversion error: jq filter failed]"
      echo "$(date +%H:%M:%S) JQ_ERR $url" >> "$LOG"
    fi
  fi

  mkdir -p "$(dirname "$target")"
  {
    echo "---"
    echo "url: $url"
    echo "framework: $framework"
    echo "category: $category"
    echo "title: ${title:-$(basename "$target" .md)}"
    echo "kind: $kind"
    echo "captured: $DATE"
    echo "---"
    echo ""
    echo "$body"
  } > "$target"

  ok=$((ok+1))
  rm -f "$tmp"

  local final_size=$(wc -c < "$target")
  if [ "$final_size" -lt 800 ]; then
    tiny=$((tiny+1))
  fi

  sleep "$SLEEP_BETWEEN"
}

process_urls_file() {
  local urls_file="$1"; local framework="$2"; local target_root="$3"
  local current_h2=""; local current_h3=""

  while IFS= read -r line; do
    if [[ "$line" =~ ^"## "(.*) ]]; then
      current_h2="${BASH_REMATCH[1]}"; current_h3=""
    elif [[ "$line" =~ ^"### "(.*) ]]; then
      current_h3="${BASH_REMATCH[1]}"
    elif [[ "$line" =~ ^"- "\[(.*)\]\((.*)\)$ ]]; then
      local url="${BASH_REMATCH[2]}"
      [[ "$url" != *"developer.apple.com"* ]] && continue

      local symbol_slug=$(echo "$url" | sed 's:/$::; s:.*/::; s:[?#].*::')
      [ -z "$symbol_slug" ] && continue

      local topic_slug=""
      if [ "$framework" = "SwiftUI" ] && [ "$current_h2" = "Modal presentations" ]; then
        if [[ "$url" == *"popover"* ]]; then topic_slug="popovers"
        elif [[ "$url" == *"inspector"* ]]; then topic_slug="inspectors"
        else topic_slug="modal-presentations"; fi
      elif [ "$framework" = "HIG" ] && [ "$current_h2" = "Components" ] && [ -n "$current_h3" ]; then
        topic_slug="components/$(slugify "$current_h3")"
      elif [ "$framework" = "HIG" ] && [ -z "$current_h2" ]; then
        topic_slug="root"
      else
        topic_slug=$(slugify "$current_h2")
      fi
      [ -z "$topic_slug" ] && continue

      fetch_url "$url" "$target_root/$topic_slug/$symbol_slug.md" "$framework" "${current_h2:-Root}"
    fi
  done < "$urls_file"
}

mkdir -p "$DOC_ROOT/_index"
echo "" >> "$LOG"
echo "## Capture run $(date +%Y-%m-%dT%H:%M:%S)" >> "$LOG"

case "${1:-all}" in
  hig) process_urls_file "$DOC_ROOT/_links/hig-urls.md" "HIG" "$DOC_ROOT/HIG" ;;
  swiftui) process_urls_file "$DOC_ROOT/_links/swiftui-urls.md" "SwiftUI" "$DOC_ROOT/SwiftUI" ;;
  appkit) process_urls_file "$DOC_ROOT/_links/appkit-urls.md" "AppKit" "$DOC_ROOT/AppKit" ;;
  all)
    process_urls_file "$DOC_ROOT/_links/hig-urls.md" "HIG" "$DOC_ROOT/HIG"
    process_urls_file "$DOC_ROOT/_links/swiftui-urls.md" "SwiftUI" "$DOC_ROOT/SwiftUI"
    process_urls_file "$DOC_ROOT/_links/appkit-urls.md" "AppKit" "$DOC_ROOT/AppKit" ;;
esac

echo ""
echo "=== Run complete ==="
echo "Total: $total  OK: $ok  Skipped: $skipped  Failed: $failed  Tiny(<800B): $tiny"
echo "Run summary: total=$total ok=$ok skipped=$skipped failed=$failed tiny=$tiny" >> "$LOG"
