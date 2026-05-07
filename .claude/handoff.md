# SwiftKit — Handoff

> Rewrite at the end of every session. Always reflects current state.

**Last session:** 2026-05-06 (Phase A + B1 + sidebar sweep B2/B3/B4/B5 + catalog dead-code purge + 8 family consolidations + app icon flatten/zoom)
**Git:** `main` ahead of `origin/main`. **All work since `8ef5c40` was uncommitted at session end** — committing first thing this session.
**HEAD:** `8ef5c40` (Phase 6 D1-D6 — last commit prior to today's commit pass)
**Build:** ✅ `** BUILD SUCCEEDED **` end-of-2026-05-06.

## What landed yesterday

### Sidebar + shell — done

- Gallery sidebar is the only sidebar. `useGallerySidebar` toggle removed; legacy `Catalog+*.swift` data path deleted.
- Sidebar single-folder collapse: when a framework has only one folder, items hang directly off the framework heading (Reference works this way).
- Selection persisted via `@SceneStorage("selectedNodeID")`, default `"item:reference.color.color"`.
- `VariantTile` static drop shadow only — hover elevation removed.
- App icon: custom Swift logo, dark-flattened corners, +11% cumulative zoom.

### Catalog dead-code purge — done

Deleted: `Catalog+SwiftUI.swift`, `Catalog+AppKit.swift`, `Catalog+Reference.swift`, `CatalogNode.swift`, `Folder`/`SectionNode`/`Leaf`, `GalleryCatalog.swift`, `PageRegistry.swift`, `CatalogFilters.swift`, `Detail/PlaceholderPage.swift`. `Framework` enum relocated to `GalleryItem.swift`. `GalleryRegistry` trimmed to live entry points only (`byFramework`, `item(forID:)`).

### Family consolidations — 8 done

| Family | Master | Symbols absorbed | Files deleted |
|---|---|---|---|
| Tables | `TableGalleryPage` | 8 | 6 |
| Drag and drop | `DraggableGalleryPage` | 11 | 9 |
| TabView | `TabViewGalleryPage` | 25 | 6 |
| Commands | `CommandsGalleryPage` | 16 | 9 |
| List | `ListGalleryPage` | 23 | 5 |
| File dialogs | `FileImporterGalleryPage` | 22 | 3 |
| Searchable | `SearchableGalleryPage` | 30 | 3 |
| Liquid Glass | `GlassEffectGalleryPage` | 18 | 6 |
| **Total** | | **153** | **47** |

### Orientation headers — done

`GalleryItem.swift`, `GalleryRegistry.swift`, `RootView.swift`, `Detail/PageScaffold/GalleryItemPage.swift` now carry full authoring contracts.

### Housekeeping — done

- `.claude/Planning/` purged of stale docs; only `2026-05-07-finish-line-handoff.md` remains.
- `.claude/Transcripts/` renamed DD-MM → MM-DD format.
- `save-script-studio.md` command redeployed from Nexus master to fix DD-MM/MM-DD conflict.

## Current numbers

- `GalleryRegistry.allItems`: **415 entries**
- Authored pages: ~26 (Reference + Phase A Shapes + a handful of older SwiftUI pages)
- Stub pages: ~389 (`ContentUnavailableView "In progress"`)

## Today's plan (2026-05-07)

Defined in `.claude/Planning/2026-05-07-finish-line-handoff.md`. In order:

1. **Commit working tree** ← starting here
2. **Mechanical cleanup sweep** (parallel agents):
   - 11 medium-confidence family consolidations (skip Immersive Spaces — visionOS-only)
   - 12 AppKit page registrations (NSOutlineView/NSBrowser/NSComboBox/NSDatePicker/NSTokenField/NSSlider/NSPathControl/NSGridView/NSStepper/NSSegmentedControl/NSProgressIndicator/NSLevelIndicator)
   - Orphan cleanup (non-`GalleryPage` files in Tables/, DragAndDrop/, others)
3. **Commit again**
4. **Plan tile-content sweep** (don't start authoring — write a fresh handoff doc with phase split + agent contract)

## Standing constraints

- macOS 26 only. Dark mode first. Apple primitives only.
- `PBXFileSystemSynchronizedRootGroup`: drop files into `SwiftKit/<subdir>/`, Xcode auto-syncs. Never put dev artifacts inside `SwiftKit/SwiftKit/` (gets bundled).
- SourceKit "Cannot find X in scope" diagnostics are stale — clear after `xcodebuild`. Trust build, not IDE.
- Cross-folder gallery page name collisions are real. New page names should be checked against existing structs.
- Documentation lives at `Documentation/` (project-root sibling), not inside `SwiftKit/`.

## Permanent gotchas

- **Commit before any sweep that deletes files.** Yesterday's enrichment pass failed because deleted siblings were uncommitted; `git show HEAD:<path>` couldn't recover their content. Lesson: stage at session boundaries.
- **Text-folder gallery items use catalog-leaf-id strings as symbols** instead of canonical Apple API symbols. Cosmetic; defer to tile-content phase.
- **Documentation/ completeness is unverified.** `GalleryItem.docPath` references may not all resolve to files. Audit before tile authoring.
