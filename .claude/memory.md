# SwiftKit — Memory

Non-obvious project state and architectural decisions. Things that aren't visible in the code itself — why something was done a particular way, what was tried and rejected, what constraints to respect.

## Format

`YYYY-MM-DD — decision or constraint — reason`

---

## 2026-05-01 — Created as a sibling to Pommora to unblock UI work

**Reason:** Pommora's UI shell rebuild kept failing because no one had a confirmed visual reference for what Apple's primitives render as on macOS 26 — selection styling iterated 8+ times, materials behaved differently than expected, custom components silently re-introduced. SwiftKit exists to be that reference. Once SwiftKit's gallery covers a primitive, Pommora work for that primitive is unblocked.

## 2026-05-01 — Two-column `NavigationSplitView`, not three

**Reason:** A middle column would imply a list of sub-items between sidebar selection and content — but each primitive *is* a single detail page. Three columns add no value here. Two-column shape: sidebar (categorized list) + detail (the gallery page).

## 2026-05-01 — Gallery catalog is a static Swift tree, not data-driven from the doc mirror

**Reason:** The doc mirror under `Documentation/` is the source of truth for *variants*; the catalog tree is the source of truth for *what gallery pages exist*. Keeping them separate means catalog node ordering, custom titles, and "promote this primitive to a top-level entry" decisions can be made without re-deriving from Apple's taxonomy every time.

## 2026-05-01 — Light/dark toggle scoped to detail pane only

**Reason:** The sidebar should always look like a native macOS sidebar (system colorScheme); only the rendered primitive in the detail pane needs the toggle so Nathan can compare appearance. Toggle drives `.preferredColorScheme(.dark)` or `.light` on the detail container, defaulting to dark.

## 2026-05-01 — AppKit URL list intentionally captured at the framework-topic level (636 URLs), not deep-recursed to per-method (~10K URLs)

**Reason:** Per-method/per-property pages exist in Apple docs but are sub-symbols of larger types. Gallery entries operate at the type level (NSView, NSTableView, NSWindow). The 636-URL list captures every type/protocol/article that has standalone meaning. If a future need surfaces (e.g., a gallery page wanting to enumerate every NSColor system property), the deeper recursion can be triggered for that subtree. **Listed here so a future agent doesn't re-crawl thinking it was incomplete.**

---

*(no further entries yet)*
