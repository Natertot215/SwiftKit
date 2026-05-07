# Sort Decisions — AppKit Heading

## Page-List Adjustments

- **PlanningTree leaves confirmed:** All 5 original leaves (NSOutlineView, NSBrowser, NSPathControl, NSTokenField, NSDatePicker) have type-doc support. No leaf is missing.
- **Proposed addition:** `NSGlassEffectView` page — macOS 26-exclusive Liquid Glass primitive with full type-doc (`nsglasseffectview.md`, `nsglasseffectcontainerview.md`, `style-swift.enum.md`). No SwiftUI equivalent. Proposed; requires Nathan approval at Phase 1 checkpoint.
- **No removals from PlanningTree.** All 5 leaves are well-supported.

## Classifier-Gate Compliance

All 101 docs with `kind: method`, `kind: property`, `kind: init`, `kind: func`, `kind: var`, or `kind: case` are classified as tiles-only or deferred. None were promoted to page candidates. Details:

- `kind: method` (16 docs) — accessibility helper functions, layout methods; all deferred as internal helpers.
- `kind: func` (28 docs) — global convenience drawing functions (NSDrawButton, NSDrawGroove, etc.), accessibility traversal helpers; all deferred.
- `kind: var` (36 docs) — global constants (NSCancelButton, NSGlyph*, pasteboard error codes, var-scoped markers); all deferred.
- `kind: case` (14 docs) — enum cases (most live inside their parent enum doc); all deferred.
- `kind: property` (6 docs) — ObservedObject, ObservedKeyPath, Options, Description, observedKeyPath from Cocoa Bindings; all deferred.
- `kind: init` (1 doc) — `init(type:)` from app-structure; deferred.

## Per-Page Tile Counts

- NSOutlineView: 3 tiles (NSOutlineView, NSOutlineViewDataSource, NSOutlineViewDelegate) + 1 sampleCode reference (not a tile)
- NSBrowser: 5 tiles (NSBrowser, NSBrowserDelegate, NSBrowserCell, NSBrowser.ColumnResizingType, NSBrowser.DropOperation)
- NSPathControl: 7 tiles (NSPathControl, NSPathControl.Style, NSPathControlDelegate, NSPathCell, NSPathCellDelegate, NSPathComponentCell, NSPathControlItem)
- NSTokenField: 5 tiles (NSTokenField, NSTokenField.TokenStyle, NSTokenFieldDelegate, NSTokenFieldCell, NSTokenFieldCellDelegate)
- NSDatePicker: 6 tiles (NSDatePicker, NSDatePicker.Style, NSDatePicker.Mode, NSDatePicker.ElementFlags, NSDatePickerCell, NSDatePickerCellDelegate)
- NSGlassEffectView (PROPOSED): 3 tiles (NSGlassEffectView, NSGlassEffectView.Style, NSGlassEffectContainerView)

**Confirmed-leaves total: 26 tiles. With proposed NSGlassEffectView page: 29 tiles.**

## Orphan-Candidate Routing

All 9 AppKit orphan candidates from `guide-orphan-components.md` were checked for type-doc presence in `Documentation/AppKit/`. None have standalone type-docs.

- `NSAccessibilityElement` — No type-doc at `Documentation/AppKit/`. A class `nsaccessibilityelement-swift.class.md` exists in `accessibility-for-appkit/` — this is a different Swift overlay class used for programmatic accessibility element creation, not a visible UI component. **Decision: Deferred.** Not a user-recognizable gallery component; belongs to the accessibility implementation layer, not the component surface.
- `NSAttributedString` — No type-doc in `Documentation/AppKit/`. NSAttributedString is a Foundation type; AppKit adds drawing extensions but the core type lives in Foundation. **Decision: Out of scope.** Foundation type, not an AppKit UI primitive.
- `NSCoder` — No type-doc in `Documentation/AppKit/`. NSCoder is Foundation; AppKit uses it for state restoration but it has no UI surface. **Decision: Out of scope.** Infrastructure type, not a gallery component.
- `NSHostingMenu` — No type-doc in `Documentation/AppKit/`. This is a new macOS 26 type that hosts a SwiftUI view inside an NSMenu. **Decision: Deferred — flag for Nathan.** If Nathan adds an NSMenu page (see Open Questions), `NSHostingMenu` would tile there. Cannot be tiled yet because no NSMenu page exists in PlanningTree.
- `NSMenuItemImportFromDeviceIdentifier` — No type-doc in `Documentation/AppKit/`. References a Continuity Camera menu item identifier type. **Decision: Deferred.** Internal identifier type; no gallery surface.
- `NSRestorableState` — No type-doc in `Documentation/AppKit/`. This is a protocol for state restoration, not a visible UI component. **Decision: Out of scope.** Infrastructure protocol.
- `NSSplitViewItemAccessoryViewController` — No type-doc in `Documentation/AppKit/`. NSSplitViewItem is a view controller concept; this is a subclassing convenience for split view accessories. **Decision: Deferred.** Subcomponent of NSSplitView/NSSplitViewItem which themselves are not in PlanningTree; if an NSSplitView page is ever added, this would tile there.
- `NSViewContentSelectionInfo` — No type-doc in `Documentation/AppKit/`. Writing Tools support protocol; no standalone UI surface. **Decision: Out of scope.** Framework infrastructure, not a user-visible component.
- `NSWindows` — No type-doc in `Documentation/AppKit/`. The guide-orphan file notes this is likely a typo for `NSWindow`. A type-doc for `NSWindow` exists at `windows-panels-and-screens/nswindow.md`. **Decision: Deferred as-is.** NSWindow is not in PlanningTree; if Nathan adds an NSWindow page, confirm the typo and use `NSWindow` as the canonical name.

## SwiftUI-Equivalent Deferrals

The AppKit heading is intentionally narrow — only components without clean SwiftUI equivalents are included. The following classes in the corpus are deferred because SwiftUI covers their user-visible behavior:

- `NSButton` — deferred (SwiftUI `Button`, `Toggle`, and `Link` cover the common cases)
- `NSTextField` — deferred (SwiftUI `TextField` and `Text` cover this)
- `NSTextView` — deferred (SwiftUI `TextEditor` covers this)
- `NSSlider` — deferred (SwiftUI `Slider` covers this)
- `NSStepper` — deferred (SwiftUI `Stepper` covers this)
- `NSProgressIndicator` — deferred (SwiftUI `ProgressView` covers this)
- `NSPopUpButton` — deferred (SwiftUI `Picker` with `.menu` style covers this)
- `NSSearchField` — deferred (SwiftUI `.searchable` modifier covers this)
- `NSSegmentedControl` — deferred (SwiftUI `Picker` with `.segmented` style covers this)
- `NSSwitch` — deferred (SwiftUI `Toggle` covers this)
- `NSImageView` — deferred (SwiftUI `Image` covers this)
- `NSColorWell` — deferred (SwiftUI `ColorPicker` covers this)
- `NSComboBox` — deferred (SwiftUI `Picker` or custom overlay covers this in most cases; borderline, but SwiftUI Picker is sufficient for MVP)
- `NSComboButton` — deferred (SwiftUI `.menuStyle` button covers this)
- `NSScrollView` — deferred (SwiftUI `ScrollView` covers this)
- `NSVisualEffectView` — deferred (SwiftUI material modifiers cover common use; notable that AppKit version has more blending modes — flagged in Unmapped section)
- `NSStackView` — deferred (SwiftUI `HStack`/`VStack`/`ZStack` cover this)
- `NSGridView` — deferred (SwiftUI `Grid` covers this)
- `NSCollectionView` (+ all NSCollectionLayout* types) — deferred (SwiftUI `LazyVGrid`/`LazyHGrid` cover this; NSCollectionView's 30+ supporting types would overwhelm a single page and have no SwiftUI-gap justification)
- `NSTableView` (+ supporting types) — deferred (SwiftUI `Table` covers this for macOS; NSTableView's raw AppKit surface is a lower-level implementation detail)
- `NSTabView` — deferred (SwiftUI `TabView` covers this)
- `NSToolbar` (+ NSToolbarItem, NSToolbarItemGroup, etc.) — deferred (SwiftUI `.toolbar` modifier and `ToolbarItem` cover this)
- `NSMatrix` — deferred (deprecated layout grid; superseded by NSGridView/NSCollectionView)
- `NSLevelIndicator` — deferred (no direct SwiftUI equivalent, but niche enough to exclude from MVP)
- `NSBox` — deferred (SwiftUI `GroupBox` covers the common case)

## Full Corpus Routing Summary

| Bucket | Count |
|---|---|
| Tiled under a named page (5 confirmed + 1 proposed) | 26 + 3 = 29 |
| Deferred — SwiftUI equivalent | ~50 |
| Deferred — infrastructure / non-UI | ~200 |
| Deferred — classifier-gated (method/func/var/case/property/init) | 101 |
| Deferred — sampleCode | 9 |
| Deferred — collectionGroup navigation docs | 36 |
| Deferred — deprecated-symbols folder | 61 |
| Unmapped / needs Nathan decision | 3 |
| **Total** | **631** |

*Note: The classifier-gate (101), sampleCode (9), and collectionGroup (36) bucket counts are exact; the remaining ~485 class/struct/enum/protocol/macro/typealias docs are distributed across SwiftUI-equivalent, infrastructure/non-UI, tiled, and unmapped buckets — those category counts are approximate.*

## Open Questions / For Nathan Checkpoint

1. **Approve or reject NSGlassEffectView page.** If approved, this adds a 6th AppKit leaf: NSGlassEffectView / NSGlassEffectView.Style / NSGlassEffectContainerView (3 tiles). macOS 26-exclusive; no SwiftUI equivalent at time of writing. Directly relevant to Pommora's visual shell.

2. **NSBackgroundExtensionView.** macOS 26 layout helper that extends content under safe areas (sidebar, titlebar). No SwiftUI equivalent. Too narrow for its own page, but would be a natural tile on an NSGlassEffectView page if that page is approved.

3. **NSHostingMenu.** macOS 26 type that hosts a SwiftUI view inside NSMenu. If Nathan ever wants an NSMenu page (menus are a significant AppKit-specific surface), NSHostingMenu would tile there. No action needed now unless Nathan wants to expand AppKit scope.

4. **NSVisualEffectView.** SwiftUI materials cover most use cases, but NSVisualEffectView exposes full blending mode control not available in SwiftUI. This is a legitimate AppKit-only surface. If Nathan wants it documented, it could either join the NSGlassEffectView page as a "predecessor" tile or get its own page. Currently deferred.

5. **PlanningTree single-folder requirement.** The current PlanningTree has AppKit as a single folder (no sub-folders) with 5 leaves. If NSGlassEffectView is approved (6 leaves), the folder still satisfies the minimum-4-pages rule. If Nathan wants additional AppKit pages beyond that, a sub-folder structure becomes possible but is not required for MVP.

6. **Nested type docs without standalone files.** `NSBrowser.ColumnResizingType` and `NSBrowser.DropOperation` are referenced in the `nsbrowser.md` Topics section but do not have separate markdown files in the corpus — they're documented inline. Tiles for these types should draw descriptions from the parent `nsbrowser.md` Abstract blocks rather than separate files. Same pattern applies to `NSDatePicker` nested types (`Style`, `Mode`, `ElementFlags`) and `NSTokenField.TokenStyle`. Phase 3 implementation agents should be aware.
