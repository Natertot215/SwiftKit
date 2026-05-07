# SwiftKit — History

Chronological log of features implemented, decisions made, and constraints established. Add a concise entry after every successful implementation. Check for retired features and reversed decisions before planning new work.

---

## 2026-05-01

**SwiftKit created as a sibling to Pommora**
Pommora's UI shell rebuild kept failing because no one had a confirmed visual reference for what Apple's primitives render as on macOS 26 — selection styling iterated 8+ times, materials behaved differently than expected, custom components silently re-introduced. SwiftKit exists to be that reference. Once SwiftKit's gallery covers a primitive, Pommora work for that primitive is unblocked.

**Gallery catalog is a static Swift tree, not data-driven from the doc mirror**
The doc mirror under `Documentation/` is the source of truth for *variants*; the catalog tree is the source of truth for *what gallery pages exist*. Keeping them separate means catalog node ordering, custom titles, and "promote this primitive to a top-level entry" decisions can be made without re-deriving from Apple's taxonomy every time.

**Light/dark toggle scoped to detail pane only**
The sidebar always looks like a native macOS sidebar (system colorScheme); only the rendered primitive in the detail pane needs the toggle so Nathan can compare appearance. Toggle drives `.preferredColorScheme(.dark)` or `.light` on the detail container, defaulting to dark.

**AppKit URL list intentionally captured at the framework-topic level (636 URLs)**
Not deep-recursed to per-method (~10K URLs). Per-method pages exist as sub-symbols of larger types; gallery entries operate at the type level (NSView, NSTableView, NSWindow). If a future need surfaces (e.g., a gallery page enumerating every NSColor system property), the deeper recursion can be triggered for that subtree.

---

## 2026-05-02

**Two-column NavigationSplitView with a 3-tier disclosure sidebar**
Sidebar shape (locked 2026-05-02): **toggle heading > label/folder > item**. The top tier is a `DisclosureGroup` whose label is tagged for selection — Mail.app's "All Inboxes" pattern; the middle tier is the folder; the leaves are the items. Single-folder collapse: when a top-level group has only one folder, items hang directly off the heading. HIG-compliant. Implementation in `SwiftKit/App/SidebarView.swift`. Uses `.navigationSplitViewStyle(.prominentDetail)` and `.navigationSplitViewColumnWidth(min: 240, ideal: 280, max: 360)`.

**Catalog data ≠ sidebar depth**
The catalog tree (Section → Folder → optional Sub-heading → Leaf) is a data model. Sidebar maps these tiers to UI rows: catalog Section → toggle heading; catalog Folder → label/folder; catalog Leaf → item. Sub-headings flatten into the parent Folder's item list when present. If future iteration wants Sub-headings to surface, options are: (a) split each Folder into multiple Folders by Sub-heading, or (b) introduce a content list (3-column NavigationSplitView) with Sub-headings as Section dividers there.

**Implementation-agent skill kit established for Phase 5 page work**
When dispatching future implementation agents to write Phase 5 gallery pages, agents must be equipped with: `swiftui-expert-skill` (code review, SwiftUI best practices), `find-docs` (Context7 doc lookup), `superpowers:subagent-driven-development` (independent sub-tasks), `superpowers:executing-plans` (written plans with checkpoints). Each Page-author dispatch loads these explicitly in the agent's prompt.

**Single-folder collapse rule established for the sidebar**
A top-level group with only one folder collapses the folder tier and renders items directly under the heading. Multi-folder groups render full 3-tier (heading → folder → item). Both shapes coexist via the same `SidebarView` logic — no special-casing per group.

**`.safeAreaInset(edge: .bottom)` is the documented Apple pattern for bottom-anchored sidebar actions**
Apple's SwiftUI tutorial sidebar uses `List { Sections } .safeAreaInset(edge: .bottom) { Button(...) .buttonStyle(.borderless) .foregroundColor(.accentColor) }` for any persistent action below the sidebar list. The inset hooks into the source-list material correctly. SwiftKit's sidebar does NOT currently have a bottom action (an earlier "About SwiftKit" placeholder was removed 2026-05-02). Empty `.safeAreaInset(edge: .bottom) { }` reserves dead space and interferes with row hit testing — only apply when there's actual content.

**Sidebar selection chrome reality on macOS 26 — framework default shipped**
Verified empirically: SwiftUI's `List(selection:).listStyle(.sidebar)` on a focused window draws the emphasized state (solid `Color.accentColor` fill + white text/icon); on unfocused, the unemphasized state (translucent `NSColor.unemphasizedSelectedContentBackgroundColor` + accent text/icon). Mail.app, Finder, and Notes deliberately render selection as if always unemphasized — that's a custom AppKit-level behavior on `NSOutlineView`, NOT SwiftUI default. SwiftUI exposes no public knob to suppress emphasized state on macOS 26. SwiftKit currently ships framework default. Three confirmed anti-patterns: `.environment(\.appearsActive, false)` (no-op), custom `.listRowBackground(...)` (triggers source-list grouping chrome), explicit `Label { Text } icon: { Image }` builder + per-element `.foregroundStyle` (breaks click-to-select hit testing). Mail-style override deferred — see `Planning/sidebar-plan.md`.

**UI terminology rule established**
UI labels used in planning/description are descriptive hints, not canonical API names. Claude must identify the Apple primitive being described rather than treating the label as the spec.

**Doc mirror verified clean — 4 URL typos fixed**
Initial Phase 3 capture left 4 `status: failed` stubs caused by URL-list typos in the original manifest gather, not capture failures. Fixes: `nssliderccessory` → `nsslideraccessory`; `nsseguperforming` → `nsseguePerforming` (camelCase); `manipulableresponermodifier` → `manipulablerespondermodifier`; HIG root reached via `tutorials/data/design/human-interface-guidelines.json`. Mirror total: 2,540 markdown files. Canonical "is this complete" check: `grep -r -l "status: failed\|status: stub" Documentation/` excluding the script source.

**`Documentation/` placement confirmed: project root, not Xcode target**
Originally nested at `SwiftKit/SwiftKit/Documentation/`, all 2,540 markdown files were swept into the .app bundle's flat `Resources/` folder by `PBXFileSystemSynchronizedRootGroup`, causing duplicate-filename collisions (Apple cross-references mean `width.md`, `windowgroup.md`, `tabviewstyle(_:).md` etc. exist in multiple framework subfolders) → BUILD FAILED. Resolved by `git mv SwiftKit/Documentation Documentation` — `Documentation/` is now a peer of `SwiftKit/`, not a child. Bundle size dropped from 6+ MB to 332 KB. Path canonical going forward: `/SwiftKit/Documentation/...`. See `Guidelines/build-and-process.md` L-010.

**Capture scripts moved into `Documentation/_index/`**
Original capture script was at `/tmp/swiftkit_capture.sh` — non-portable and untrusted by some sandboxes. Moved into project at `Documentation/_index/capture.sh` (full-mirror, idempotent, MIN_BYTES=2500 skip) and `Documentation/_index/recapture-targets.sh` (small TARGETS array for surgical re-fetches that bypasses size-skip). For one-off URL fixes, edit `recapture-targets.sh`'s TARGETS array. For full re-walk after manifest changes, run `./capture.sh all`.

---

## 2026-05-07

**Strip-and-restart executed**
After a complete project retrospective *(filed at `// The Nexus // Claude // SwiftKit — Where The Mess Came From.md`)* surfaced that the project had drifted from "one page per primitive" to "one page per Apple URL" — producing 836 page files / 141,656 lines / 43 sidebar folders — Nathan authorized a strip-and-restart. Procedure:

1. Pre-strip snapshot committed as `62db021`, tagged `pre-restart` so the full corpus stays recoverable via `git show pre-restart:<path>`.
2. Stripped: `SwiftKit/Pages/SwiftUI/` (678 files), `SwiftKit/Pages/AppKit/` (140 files), `SwiftKit/Pages/Documentation/` (11 mis-placed Describe pages), `SwiftKit/Pages/Reference/TypographyPage.swift` (legacy duplicate of TypographyGalleryPage).
3. `GalleryRegistry.allItems` reset to the 5 Reference pages (Materials, Motion, Color, SF Symbols, Typography) — the canonical "right shape" pages.
4. Clean build verified green.
5. Strip commit landed as `ee95864`: 831 files changed, 5 insertions, 141,056 deletions.

**Root cause of the mess (decided permanently)**
The Phase 5 triage on 2026-05-03 took Apple's 1,722 SwiftUI URLs, classified 990 of them as "leaves," and treated each leaf as a sidebar page. That conflated *variant enumeration* (the role `Documentation/` was supposed to play) with *page list* (the role it should not have played). One modifier per page produced 358 SwiftUI pages where ~60 belonged. Family consolidation arrived May 6 — 3 days late — and was applied to only 8 of ~60 families. The lesson is now codified: **Apple's URL count is not the page count. Modifiers belong as variant tiles inside their primitive's page, not as their own pages.**

**Restart spec direction (initial sketch — un-locked same day)**
A first-pass sketch targeted ~70 pages across ~14 folders, with content sourced from `Documentation/` and a pilot-first cadence (no parallel agents authoring pages without per-page approval). The sketch was un-locked the same day for a fresh planning phase.

**Spec un-locked, planning phase reset (same day).** After the placeholder template landed, Nathan reset the project posture to a blank-slate planning phase — `framework.md` Future Plans and `handoff.md` were trimmed back to broad-idea only. The two dated pre-strip Planning docs (`finish-line-handoff`, `tile-migration-handoff`) were hard-deleted later the same session for the clean-slate. Sidebar mechanics + 81-item placeholder template stay locked at commit `753f4d9` as the structural template; everything else (page count, folder count, naming, cadence) re-opens for design.

**Phase 1 sort rule clarified — only components in the gallery, no topic pages.** Nathan reinforced mid-Phase-1 that "the articles and guides should not be implemented into this project; only components, code, and their descriptions." Cited example: `https://developer.apple.com/documentation/swiftui/menus-and-commands` (a `kind: collectionGroup` topic-group landing page) — explicitly NOT a gallery page. `framework.md` Phase 1 brief updated with a "hard rule" line at the top of the agent inclusions and explicit deferral entries for `kind: collectionGroup` and any `_index.md` navigation files. Phase 0b already archived all `kind: article` docs; this clarification covers the remaining navigation-style content (collection-group landing pages, sample-code wrappers, topic indices). Sort agents already in flight (SwiftUI retry running at this writing) inherit the rule via the manifest review step; AppKit's existing manifest already complies and one informational `sampleCode` line was removed for purity.

**Phase 0a scope corrected.** Initial plan called for "removing the optional sub-heading field from `GalleryItem`" and "removing the sub-heading flatten branch from `SidebarView`." Code reality: post-strip `GalleryItem.swift` is already `Section → Folder → Leaf` (framework + folder string + leaf item) — there is no sub-heading field. `SidebarView.swift`'s two-branch render is the locked single-folder-collapse mechanic, not a sub-heading flatten. The "drop sub-heading tier" language in `history.md` 2026-05-02 described design intent that never landed in code. Phase 0a's actual work is narrower: strip the 81-item placeholder template generator from `GalleryRegistry.swift` (replace `allItems` with `[]`), and restore canonical `Framework.displayName` / `Framework.sidebarSymbolName` ("Reference"/"SwiftUI"/"AppKit" with `book.closed`/`swift`/`square.grid.2x2` symbols). `GalleryItem.swift` struct + `SidebarView.swift` are untouched — both already correct. Plan in `framework.md` updated to reflect actual scope.

**MVP plan settled — Foundation-to-Completion phasing in `framework.md`.** Seven-phase plan (0a → 0b → 1 → 2 → 2.5 → 3 → 4) replaces the prior blank-slate `## Future Plans` section. Methodology codified: fresh subagent per task with two-stage review (spec compliance → code quality), parallel batches when files are disjoint (Phases 0b/1/2-step-2/3), sequential when shared (0a/2-step-1/2.5/4). Three drift-prevention firewalls baked in: (1) Phase 1's `kind:`-frontmatter classifier gate (any `method`/`property`/`init`/`func` doc is a tile candidate, never a page), (2) Phase 1 user-checkpoint on `Planning/page-component-map.md` before any code, (3) Phase 2.5 read-only manifest-vs-scaffold audit before Phase 3 dispatch. Guides handled reversibly — articles + HIG move to `Documentation/_archive/guides/` and `Documentation/_links/guides.md`, deletion only after Phase 1 confirms no component coverage gap. Sub-heading tier dropped from `GalleryItem` (catalog now Section → Folder → Leaf, mirroring the locked UI). Folder/leaf names grammatical; tile headers verbatim Apple type names. Plan sync rule: `framework.md` is canonical home; any change updates it immediately and gets a dated `history.md` entry.

---

## Architectural Constraints (standing)

- **PBXFileSystemSynchronizedRootGroup** — Drop `.swift` files into `SwiftKit/<subdir>/`; Xcode auto-syncs. Never put dev-only artifacts (docs, design refs, screenshots) inside `SwiftKit/SwiftKit/` — they get bundled into the app.
- **DerivedData hash** — Capture after first build; use in all subsequent `xcodebuild` commands.
- **Skills location** — `~/.claude/skills/` (and `~/.agents/skills/` for legacy installs symlinked in); invoke via Skill tool.
- **`.safeAreaInset(edge: .bottom)`** — Pattern for bottom sidebar action rows; only apply when there's actual content.
- **Single-folder collapse rule** — when a top-level group has only one folder, items render directly under the heading (no folder tier).
