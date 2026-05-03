# HIG Capture Log

## 2026-05-01 — Components section

Captured all 60 Components URLs (plus 1 Components root + 8 sub-section index pages = 69 unique pages, plus 3 idempotent re-captures during test = 72 writes).

- Source: `Documentation/_links/hig-urls.md`
- Method: JSON variant `developer.apple.com/tutorials/data/design/human-interface-guidelines/<slug>.json`
- Result: 60/60 succeeded, 0 failed
- Sub-sections processed: Content, Layout and organization, Menus and actions, Navigation and search, Presentation, Selection and input, Status, System experiences

No rate-limit errors. No fallback to firecrawl needed. WebFetch failed up-front (returned a "cannot browse" refusal); JSON variant succeeded for every URL.

## Capture run 2026-05-02T11:37:33

11:37:33 INVALID_JSON https://developer.apple.com/design/human-interface-guidelines

## Capture run 2026-05-02T11:38:23

11:38:23 INVALID_JSON https://developer.apple.com/design/human-interface-guidelines
11:45:59 FAILED https://developer.apple.com/documentation/swiftui/manipulableresponermodifier (HTTP 404)
12:01:32 FAILED https://developer.apple.com/documentation/appkit/nsseguperforming (HTTP 404)
12:03:08 FAILED https://developer.apple.com/documentation/appkit/nssliderccessory (HTTP 404)
Run summary: total=2528 ok=2286 skipped=238 failed=4

## Capture run 2026-05-02T12:12:27
Run summary: total=2528 ok=2243 skipped=281 failed=4 tiny=405

## Capture run 2026-05-02T12:56:57

## Capture run 2026-05-02T13:01:16
Run summary: total=0 ok=0 skipped=0 failed=0 tiny=0

## Capture run 2026-05-02T18:15:37
Run summary: total=0 ok=0 skipped=0 failed=0 tiny=0
