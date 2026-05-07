# SwiftKit — Framework

## Vision and Purpose

A personal Apple-component reference library, native to macOS. Two outputs:

1. **`SwiftKit.app`** — a macOS gallery app. Each page documents one user-recognizable component with every documented variant rendered as a tile alongside its exact API call. Light/dark toggle on the detail pane (default dark).
2. **`Documentation/`** (project-root sibling of the Xcode app target) — a complete local mirror of Apple's documentation as flat markdown files. The authoring source for every gallery page.

The motivation is concrete: Pommora's UI shell rebuild stalled because there was no confirmed visual reference for what Apple's primitives actually render as on macOS 26. Every "build the sidebar" task became a guessing game off after-the-fact screenshots. SwiftKit is the reference. When Pommora needs a component, Nathan points at SwiftKit and says "that one." No invention. No interpretation.

## Current State *(2026-05-07, post-strip)*

The project was stripped on 2026-05-07 after drifting into 836 page files / 43 folders. Restart is from a clean foundation.

```
Total Swift files:       21
  Shell + scaffolds:     14
  Reference pages on disk: 5 (unregistered)
  Shared:                2 (DescribePage, PlaceholderGalleryPage)

GalleryRegistry entries: 81 (placeholder template — 3 main folders × 3 sub-folders × 9 pages)
Build state:             ✅ green
Documentation mirror:    2,535 markdown files (intact)
```

**What survived the strip and works:**
- Shell: `SwiftKitApp`, `RootView`, `SidebarView`, `ContentView`, `AppearanceController`
- Catalog: `GalleryItem` descriptor, `GalleryRegistry` (allItems/byFramework/item(forID:))
- Detail pane: `DetailPane`
- Page scaffolds: `GalleryItemPage`, `VariantTile`, `PageSection`, `APICallout`, `DemoTiles`
- 5 canonical reference pages: Materials, Motion, Color, SF Symbols, Typography — the authoring model
- App icon, asset catalog
- 2,535-file `Documentation/` mirror

**Pre-strip corpus** preserved at git tag `pre-restart` (SHA `62db021`). Recoverable via `git show pre-restart:<path>` if any single file becomes useful as reference.

## Future Plans

Project is in a new planning phase as of 2026-05-07. No specifics are committed beyond the broad idea below; the concrete plan is open for re-design.

**Broad idea.** A focused, lean reference library: each sidebar page documents one user-recognizable component with every variant rendered as a tile. Folders are reserved for large groupings. The `Documentation/` mirror is the authoring source, not the page list. The sidebar mechanics *(3-tier disclosure, single-folder collapse, framework default chrome)* are locked — the placeholder template at `753f4d9` exercises the exact shape future content will take.

Scope, page count, folder count, naming, and authoring cadence are all open. Settle them in a planning session before authoring resumes.

## Hard Constraints

- **Apple-only.** Every view, modifier, type, and style must come from Apple's documented APIs. No third-party UI libraries. No Claude-authored wrapper views — see `Guidelines/feedback.md`.
- **macOS 26 only** — no backward compat.
- **Dark mode first.**
- **No SwiftData.** SwiftKit has no `@Model` types, no `.modelContainer(...)`. (L-007)
- **No re-implementing primitives that SwiftKit is documenting.** SwiftKit must *render* primitives, not *replace* them. Gallery pages are layout containers — `Button(...)` in a `VStack` is fine; `MyCustomSearchBar` is not.
- **`Documentation/` mirror is the authoring input.** Read the markdown for each primitive before writing the page. The mirror's *content* drives variant enumeration; the mirror's *structure* is NOT the page list. (This was the original drift cause — see `history.md` 2026-05-07.)

## Standing constraints

- **`PBXFileSystemSynchronizedRootGroup`.** New `.swift` files in `SwiftKit/SwiftKit/` compile automatically — no `project.pbxproj` edit needed.
- **DerivedData hash to pin.** `SwiftKit-dqolyhtwikfvruchpznkybfwhsmy` (captured 2026-05-02). Use `-derivedDataPath ~/Library/Developer/Xcode/DerivedData/SwiftKit-dqolyhtwikfvruchpznkybfwhsmy` for any debugging session per L-005.
- **Skills location.** All globally-installed skills live at `~/.claude/skills/`. Relevant for SwiftKit: `find-docs` (Context7) and `swiftui-expert-skill`. Invoke via `Skill` tool.
- **L-011 page-size rule.** Keep nested SwiftUI trees under a few hundred symbols per binding; break dense pages into `private let` subviews.
- **SourceKit diagnostics are stale** — clear after `xcodebuild`. Trust build.

## Components log

Chronological record of what's in the app. **No code** — just name + date.

| Component | Date |
|---|---|
| `SwiftKitApp` (stripped) | 2026-05-01 |
| `ContentView` (placeholder) | 2026-05-01 |
| `Documentation/_links/{hig,swiftui,appkit}-urls.md` | 2026-05-01 |
| `Documentation/access-links.md` | 2026-05-01 |
| `Documentation/_index/capture.sh` (full-mirror capture, idempotent) | 2026-05-02 |
| `Documentation/_index/recapture-targets.sh` (targeted recapture) | 2026-05-02 |
| `SidebarView` (3-tier disclosure + single-folder collapse) | 2026-05-02 |
| `GalleryItem`, `GalleryRegistry` (descriptor + flat allItems) | 2026-05-06 |
| `GalleryItemPage`, `VariantTile`, `PageSection`, `APICallout`, `DemoTiles` (page scaffolds) | 2026-05-06 |
| 5 reference pages: `Typography`, `Color`, `Materials`, `Motion`, `SF Symbols` | 2026-05-06 |
| **Strip-and-restart** — 836 pre-strip page files removed; corpus reset to 5 reference pages | **2026-05-07** |
| `PlaceholderGalleryPage` + 81-item placeholder template (sidebar mechanics validation) | 2026-05-07 |

## Planning checklist

- [ ] Is this work for the post-strip restart, or pre-strip cleanup? *(Restart only — pre-strip Planning docs are historical record.)*
- [ ] If a new gallery page: does the corresponding markdown exist under `Documentation/<framework>/<topic>/`?
- [ ] Is the page name a user-recognizable component, not a modifier? Modifiers belong as tiles inside their primitive's page.
- [ ] Is the folder a macro-grouping with at least ~4 pages? Single-page folders are not allowed.
- [ ] Does this introduce a Claude-authored helper view? **Stop.** Compose Apple primitives directly.
- [ ] Are dark + light renderings both planned for the change?
