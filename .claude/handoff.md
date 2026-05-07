# SwiftKit — Handoff

> Rewrite at the end of every session. Always reflects current state.

**Last session:** 2026-05-07 (commit pass + 11 medium-confidence consolidations + 12 AppKit registrations + orphan audit)
**Git:** `main` ahead of `origin/main`. Last commit `cd496cd` is the unified Phase B + 6 + cleanup commit. Day-2 cleanup work pending its own commit.
**HEAD:** `cd496cd` (Phase B + 6 + cleanup — gallery sidebar shipped, family consolidation, dead code purged)
**Build:** ✅ `** BUILD SUCCEEDED **` after this session's cleanup pass.

## What landed this session (2026-05-07)

### Initial commit (cd496cd)

Unified the prior session's 485 uncommitted file changes into one commit: gallery sidebar replacing legacy catalog, Phase B2/B3/B4/B5 stub sweep (462 GalleryItems), Phase 6 D-batch, catalog dead-code purge, 8 family consolidations, app icon, orientation headers, planning purge, transcript renames.

### 11 medium-confidence family consolidations — done

Same parallel-agent pattern as Day 1's seven. Each fold absorbs siblings' `absorbedSymbols` into a master, deletes the siblings.

| Family | Master | Siblings deleted |
|---|---|---|
| Toolbar | `ToolbarGalleryPage` | 3 |
| Alert | `AlertGalleryPage` | 3 |
| Transition | `TransitionGalleryPage` | 3 |
| Gesture composition | `GestureGalleryPage` | 4 |
| Menu | `MenuGalleryPage` | 3 |
| Alignment | `AlignmentGalleryPage` | 1 |
| Text decorations | `TextGalleryPage` | 4 |
| Matched-geometry | `MatchedGeometryEffectGalleryPage` | 2 |
| Animatable | `AnimatableGalleryPage` | 1 |
| Scene lifecycle | `WindowGroupGalleryPage` | 2 |
| NSHosting options | `NSHostingControllerGalleryPage` | 2 |
| **Total** | | **28** |

### 12 AppKit page registrations — done

Added `static let item: GalleryItem` extensions to: `NSOutlineView`, `NSBrowser`, `NSComboBox`, `NSDatePicker`, `NSTokenField`, `NSSlider`, `NSPathControl`, `NSGridView`, `NSStepper`, `NSSegmentedControl`, `NSProgressIndicator`, `NSLevelIndicator`. They're now in `GalleryRegistry.allItems` under "AppKit · Views and controls".

### Orphan audit — done (with a major finding)

**Critical finding:** the 562 unregistered `*Page.swift` files in `Pages/SwiftUI/` are NOT stale leftovers — they hold **the original authored gallery content** from the pre-gallery era. The registered `*GalleryPage.swift` files are mostly 40-50 line placeholder stubs.

Concrete examples:
- `Tables/TablePage.swift` (**953 lines** of real Table/TableColumn/TableStyle gallery content) vs `Tables/TableGalleryPage.swift` (48 lines, `ContentUnavailableView` placeholder)
- `ControlsAndIndicators/ButtonPage.swift` (**1380 lines**) vs `ButtonGalleryPage.swift` (42 lines, placeholder)
- `InputEvents/KeyboardInputPage.swift` (**1385 lines**) vs `KeyboardInputGalleryPage.swift` (placeholder)

**Implication for the project:** the tile-content sweep is **migration, not greenfield authoring**. Move existing content into the gallery shell, update `absorbedSymbols`, delete the orphan. Estimate drops from "multi-week authoring" to "focused multi-session migration sweep."

Action taken: deleted 1 trivial orphan (`ViewGroupings/SubviewCollectionPage.swift`, 11 lines, just a comment). 562 files retained as the migration corpus.

Full sorted line-count manifest at `/tmp/orphan_linecounts.txt`.

## Current numbers

- `GalleryRegistry.allItems`: **399 entries** (was 415; -28 consolidations, +12 AppKit registrations)
- Authored pages: ~26 (Reference + Phase A Shapes + a handful of older SwiftUI pages)
- Stub `*GalleryPage.swift` pages: ~373 (await migration from orphan source content)
- Orphan source pages (unregistered `*Page.swift`): 562 — the migration corpus

## Day 1 recap (2026-05-06, all in commit cd496cd)

Catalog dead-code purge, 8 family consolidations (Tables/Drag-and-drop/TabView/Commands/List/File-dialogs/Searchable/Liquid Glass), Reference framework populated, sidebar single-folder collapse, hover elevation removed, app icon flatten + zoom, orientation headers, planning purge, transcript renames, save-script-studio command redeployed.

## Today's plan (continued from finish-line handoff)

Was: see `.claude/Planning/2026-05-07-finish-line-handoff.md`. Today's queued cleanup is now **complete**.

**Next:** plan and execute the tile-content migration sweep. New handoff doc to be written: `.claude/Planning/2026-05-07-tile-migration-handoff.md`.

## Standing constraints

- macOS 26 only. Dark mode first. Apple primitives only.
- `PBXFileSystemSynchronizedRootGroup`: drop files into `SwiftKit/<subdir>/`, Xcode auto-syncs.
- SourceKit "Cannot find X in scope" diagnostics are stale — clear after `xcodebuild`. Trust build.
- Cross-folder gallery page name collisions are real.
- Documentation lives at `Documentation/` (project-root sibling).

## Permanent gotchas

- **Commit before any sweep that deletes files.** Day 1's enrichment pass failed because deleted siblings were uncommitted; `git show HEAD:<path>` couldn't recover their content.
- **Orphan `*Page.swift` files are the migration corpus, not stale leftovers.** Treat them as authoring source, not dead code.
- **Documentation/ completeness is unverified.** `GalleryItem.docPath` references may not all resolve to files. Audit before tile authoring.

## Open follow-ups

- Tile-content migration sweep (the long pole, now reframed as migration)
- Documentation/ folder audit
- Visual QA pass through every page in the running app
- Search bar (deleted with `CatalogFilters`; would need fresh design if wanted)
- Project root README (currently absent)
