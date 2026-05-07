# SwiftKit — Handoff

> Rewrite at the end of every session. Always reflects current state.

**Status:** Blank-slate. Project is in a new planning phase.
**Git:** `main`, last commit `8816420` *(transcript + handoff refresh after strip-and-template)*.
**Tags:** `pre-restart` → `62db021` *(full pre-strip corpus, recoverable via `git show pre-restart:<path>`)*.
**Build:** ✅ green.

## Current state

The project was stripped on 2026-05-07. What remains:

- **Shell + scaffolds** *(14 Swift files)* — `SwiftKitApp`, `RootView`, `SidebarView`, `ContentView`, `AppearanceController`, `GalleryItem`, `GalleryRegistry`, `DetailPane`, and the page scaffolds *(`GalleryItemPage`, `VariantTile`, `PageSection`, `APICallout`, `DemoTiles`)*. All proven.
- **5 Reference pages on disk** at `Pages/Reference/` — Materials, Motion, Color, SF Symbols, Typography. Currently unregistered.
- **Sidebar placeholder template** — `GalleryRegistry` registers 81 placeholder items via `PlaceholderGalleryPage`, organized as 3 main folders × 3 sub-folders × 9 pages. Used to validate disclosure mechanics.
- **Documentation mirror** at `Documentation/` — 2,535 markdown files, intact, untouched. The eventual authoring source.

## Next

**Planning, not authoring.** The previous session's restart spec was discarded for being too prescriptive. The next session begins a fresh planning phase. No content authoring until the new plan is settled.

## Standing constraints *(unchanged)*

- macOS 26 only. Dark mode first. Apple primitives only. No SwiftData. *(`Guidelines/feedback.md`, L-007.)*
- Drop `.swift` files into `SwiftKit/<subdir>/` — `PBXFileSystemSynchronizedRootGroup` auto-syncs. *(L-010.)*
- `Documentation/` stays a project-root sibling, never inside `SwiftKit/SwiftKit/`. *(L-010.)*
- Keep `GalleryRegistry.allItems` flat. *(L-011.)*
- Semantic tokens only. *(`Guidelines/visual-rules.md`, L-001/L-012.)*
- SourceKit "Cannot find X in scope" diagnostics are stale — clear after `xcodebuild`. Trust build.
