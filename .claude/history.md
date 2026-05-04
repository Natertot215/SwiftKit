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
Sidebar shape (locked 2026-05-02): **toggle heading > label/folder > item**. "Reference" / "SwiftUI" / "AppKit" are the toggle headings (each a `DisclosureGroup` whose label is tagged for selection — Mail.app's "All Inboxes" pattern); "Modal presentations" / "Images" / "Controls" / etc. are the label/folders; the leaves are the items. AppKit's `Subheading` catalog tier flattens into the parent Folder's item list. Reference's shape is `heading → item` (no Folder layer). HIG-compliant. Implementation in `SwiftKit/App/SidebarView.swift`. Uses `.navigationSplitViewStyle(.prominentDetail)` and `.navigationSplitViewColumnWidth(min: 240, ideal: 280, max: 360)`.

**Catalog data ≠ sidebar depth**
The catalog tree (Section → Folder → optional Sub-heading → Leaf) is a data model. Sidebar maps these tiers to UI rows: catalog Section → toggle heading; catalog Folder → label/folder; catalog Leaf → item. Catalog Sub-headings (AppKit only) flatten into the parent Folder's item list. If future iteration wants Sub-headings to surface, options are: (a) split each AppKit Folder into multiple Folders by Sub-heading, or (b) introduce a content list (3-column NavigationSplitView) with Sub-headings as Section dividers there.

**Implementation-agent skill kit established for Phase 5 page work**
When dispatching future implementation agents to write Phase 5 gallery pages, agents must be equipped with: `swiftui-expert-skill` (code review, SwiftUI best practices), `find-docs` (Context7 doc lookup), `superpowers:subagent-driven-development` (independent sub-tasks), `superpowers:executing-plans` (written plans with checkpoints). Each Page-author dispatch loads these explicitly in the agent's prompt.

**Reference toggle heading sits at the top of the sidebar**
Curated cross-cutting reference pages (Typography first; future Color, Iconography) live above the framework-specific catalog. Reference is `heading → item` (two tiers, no Folder layer); SwiftUI and AppKit are `heading → folder → item` (three tiers). Both shapes coexist. Order: Reference → SwiftUI → AppKit, putting cross-cutting docs above framework-specific content (matches HIG's hierarchy where Foundations precede framework references). At 4+ Reference leaves, restructure into named Folders to match the 3-tier shape.

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

## Architectural Constraints (standing)

- **PBXFileSystemSynchronizedRootGroup** — Drop `.swift` files into `SwiftKit/<subdir>/`; Xcode auto-syncs. Never put dev-only artifacts (docs, design refs, screenshots) inside `SwiftKit/SwiftKit/` — they get bundled into the app.
- **DerivedData hash** — Capture after first build; use in all subsequent `xcodebuild` commands.
- **Skills location** — `~/.agents/skills/`; invoke via Skill tool.
- **`.safeAreaInset(edge: .bottom)`** — Pattern for bottom sidebar action rows; only apply when there's actual content.
- **Reference toggle heading** — Top of sidebar; order is Reference → SwiftUI → AppKit.
