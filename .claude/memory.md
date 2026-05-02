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

## 2026-05-02 — Doc mirror has zero failed stubs; 4 URL typos fixed

**Reason:** Initial Phase 3 capture left 4 `status: failed` stubs caused by URL-list typos in the original manifest gather, not capture failures. Cleanup (2026-05-02): confirmed canonical URLs against Apple's JSON variant API, fixed typos in `_links/{hig,swiftui,appkit}-urls.md` + `access-links.md`, deleted old stub files, recaptured. All 4 now hold authentic Apple content. Mirror total still 2,540 markdown files.

| Original (typo) | Corrected |
|---|---|
| `appkit/nssliderccessory` | `appkit/nsslideraccessory` |
| `appkit/nsseguperforming` | `appkit/nsseguePerforming` (camelCase — only working casing) |
| `swiftui/manipulableresponermodifier` | `swiftui/manipulablerespondermodifier` |
| `design/human-interface-guidelines` (404 via default JSON URL) | reached via `tutorials/data/design/human-interface-guidelines.json` |

**How to apply:** When auditing the mirror, the canonical "is this complete" check is `grep -r -l "status: failed\|status: stub" Documentation/` excluding the script source. Many genuine Apple symbol pages are <1500 bytes (single methods, typealiases, struct-only modifiers); small size alone is not a defect signal.

## 2026-05-02 — `Documentation/` lives at project root, NOT inside the Xcode target

**Reason:** The Xcode project uses `PBXFileSystemSynchronizedRootGroup` — anything under `SwiftKit/SwiftKit/` auto-bundles. With `Documentation/` originally nested at `SwiftKit/SwiftKit/Documentation/`, all 2,540 markdown files were swept into the .app bundle's flat `Resources/` folder, causing duplicate-filename collisions (Apple cross-references mean `width.md`, `windowgroup.md`, `tabviewstyle(_:).md` etc. exist in multiple framework subfolders) → BUILD FAILED. Resolved by `git mv SwiftKit/Documentation Documentation` — Documentation/ is now a peer of `SwiftKit/`, not a child. Bundle size dropped from 6+ MB to 332 KB; zero .md leakage; single DerivedData hash. Capture scripts updated. **Path canonical going forward: `/SwiftKit/Documentation/...`, not `/SwiftKit/SwiftKit/Documentation/...`.**

**How to apply:** Never put development-only artifacts (docs, design refs, screenshots) inside `SwiftKit/SwiftKit/`. The synchronized group will bundle them into the app. Project-root peer folders (`Documentation/`, `Screen Recordings/`, etc.) stay out of the app target.

## 2026-05-02 — Capture scripts live in `Documentation/_index/`

**Reason:** Original capture script was at `/tmp/swiftkit_capture.sh` — non-portable, untrusted by some sandboxes (transcript-invisible writes get blocked), and not committed. Moved into project at `Documentation/_index/capture.sh` (full-mirror, idempotent, MIN_BYTES=2500 skip) and `Documentation/_index/recapture-targets.sh` (small TARGETS array for surgical re-fetches that bypasses the size-skip).

**How to apply:** For one-off URL fixes, edit `recapture-targets.sh`'s TARGETS array, run it. For a full re-walk after manifest changes, run `./capture.sh all`. Don't recreate the `/tmp` version — it'll be denied as untrusted.

---

*(no further entries yet)*
