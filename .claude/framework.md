# SwiftKit — Framework

## Vision and Purpose

A personal Apple-component reference library, native to macOS. Two outputs:

1. **`SwiftKit.app`** — a macOS gallery app. Sidebar navigates *Reference / SwiftUI / AppKit*; each page documents one user-recognizable component with every documented variant rendered as a tile alongside its exact API call. Light/dark toggle on the detail pane (default dark).
2. **`Documentation/`** (project-root sibling of the Xcode app target) — a complete local mirror of Apple's HIG, SwiftUI, and AppKit documentation as flat markdown files. The authoring source for every gallery page.

The motivation is concrete: Pommora's UI shell rebuild stalled because there was no confirmed visual reference for what Apple's primitives actually render as on macOS 26. Every "build the sidebar" task became a guessing game off after-the-fact screenshots. SwiftKit is the reference. When Pommora needs a component, Nathan points at SwiftKit and says "that one." No invention. No interpretation.

## Current State *(2026-05-07, post-strip)*

The project was stripped on 2026-05-07 after drifting into 836 page files / 43 folders. Restart is from a clean foundation with 5 canonical Reference pages.

```
Total Swift files:       20
  Shell + scaffolds:     14
  Reference pages:       5
  Shared:                1 (DescribePage.swift)

GalleryRegistry entries: 5 (all Reference)
Sidebar folders:         1 (Reference, single-tier-collapsed)
Build state:             ✅ green
Documentation mirror:    2,535 markdown files (intact)
```

**What survived the strip and works:**
- Shell: `SwiftKitApp`, `RootView`, `SidebarView`, `ContentView`, `AppearanceController`
- Catalog: `GalleryItem` descriptor, `GalleryRegistry` (allItems/byFramework/item(forID:))
- Detail pane: `DetailPane`
- Page scaffolds: `GalleryItemPage`, `VariantTile`, `PageSection`, `APICallout`, `DemoTiles`
- 5 Reference pages: Materials, Motion, Color, SF Symbols, Typography — the canonical "right shape" model
- App icon, asset catalog
- 2,535-file `Documentation/` mirror

**Pre-strip corpus** preserved at git tag `pre-restart` (SHA `62db021`). Recoverable via `git show pre-restart:<path>` if any single file becomes useful as reference.

## Future Plans *(post-strip restart)*

Target shape: **~70 pages across 14 folders.** Folders are reserved for large groupings; pages are reserved for user-recognizable primitives; modifiers fold in as variant tiles, not as their own pages.

### Sidebar shape *(target)*

**Reference** — 5 pages, single-tier-collapsed under the framework heading. *(Already complete.)*

**SwiftUI** — 13 folders, ~60 pages:
- App Structure *(~3)* — App & Scenes, WindowGroup, Document
- Navigation *(~6)* — NavigationStack, NavigationSplitView, TabView, Sidebar, Searchable, Inspector
- Layout *(~8)* — Stacks, Grid, LazyGrid, ScrollView, GeometryReader, Frame & Padding, Alignment, SafeArea
- Containers *(~6)* — List, Table, Form, GroupBox, Section, DisclosureGroup
- Controls *(~10)* — Button, Toggle, Picker, DatePicker, ColorPicker, Slider, Stepper, ProgressView, Gauge, Menu
- Text and Input *(~5)* — Text, TextField, TextEditor, Label, AttributedString
- Images and Shapes *(~4)* — Image, AsyncImage, Shapes, Gradient
- Presentation *(~5)* — Sheet, Popover, Alert, ConfirmationDialog, FullScreenCover
- Toolbars and Menus *(~3)* — Toolbar, ContextMenu, Commands
- Animation and Effects *(~4)* — Animation, Transition, MatchedGeometry, Canvas
- Accessibility *(~3)* — Labels & Descriptions, Actions & Behavior, Custom Content
- Gestures and Input *(~3)* — Gestures, FocusState, Keyboard

**AppKit** — 1 folder, ~5 pages, single-tier-collapsed:
- Views and Controls *(~5)* — NSOutlineView, NSBrowser, NSPathControl, NSTokenField, NSDatePicker (only AppKit primitives that fill SwiftUI gaps)

### Authoring rules

- **One page per user-recognizable component.** Modifiers go inside that component's page as variant tiles.
- **One folder per macro-grouping.** A folder with fewer than ~4 pages does not earn its disclosure.
- **Title-case folder names** — *"Drawing and Graphics"*, not *"Drawing and graphics"* (per ClaudeOS global rule).
- **Source content from `Documentation/`** — read the relevant markdown(s) for each page before authoring. No re-derivation from training memory.
- **Apple-only doctrine still binding** — see `Guidelines/feedback.md`. Strip didn't change that.

### Cadence

- **Pilot first.** Author `ButtonGalleryPage` solo. Validate page shape, tile vocabulary, semantic-token discipline, build cleanliness. Adjust scaffold if needed.
- **One folder per session after that.** With Documentation markdown in hand, author each page directly.
- **No parallel agents authoring pages without explicit per-page approval.** The May-3-through-May-7 sweep proved agents amplify the wrong thing.
- **Build green between every page.** Each new file = one Edit + Append-to-`GalleryRegistry.allItems` + clean build.

### First three sessions *(target)*

1. Pilot: `ButtonGalleryPage`. End: 6 working pages.
2. First folder: Controls (Button-shaped pattern × 10 pages). End: 1 SwiftUI folder, ~15 working pages.
3. Second folder: Containers. End: 2 SwiftUI folders, ~21 working pages.

After 3 sessions: a usable reference library spanning Reference + 2 SwiftUI folders. Remaining 11 folders fill in over subsequent sessions.

### Open decisions before pilot

- Verify whether `GalleryPageScaffold.swift` has any post-strip consumers (delete if not).
- Confirm `DescribePage.swift` is wanted under the new model (or delete).
- Lock in the 13 SwiftUI folder names verbatim.
- Confirm Button as the pilot.

## Hard Constraints

- **Apple-only.** Every view, modifier, type, and style must come from Apple's documented SwiftUI or AppKit. No third-party UI libraries. No Claude-authored wrapper views — see `Guidelines/feedback.md`.
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
| 5 Reference pages: `Typography`, `Color`, `Materials`, `Motion`, `SF Symbols` | 2026-05-06 |
| **Strip-and-restart** — 836 pre-strip page files removed; corpus reset to 5 Reference pages | **2026-05-07** |

## Planning checklist

- [ ] Is this work for the post-strip restart, or pre-strip cleanup? *(Restart only — pre-strip Planning docs are historical record.)*
- [ ] If a new gallery page: does the corresponding markdown exist under `Documentation/<framework>/<topic>/`?
- [ ] Is the page name a user-recognizable component, not a modifier? Modifiers belong as tiles inside their primitive's page.
- [ ] Is the folder a macro-grouping with at least ~4 pages? Single-page folders are not allowed.
- [ ] Does this introduce a Claude-authored helper view? **Stop.** Compose Apple primitives directly.
- [ ] Are dark + light renderings both planned for the change?
