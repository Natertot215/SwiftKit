# D3 — NSTableView Family Consolidation Manifest

**Parent page:** SwiftKit/Pages/AppKit/ViewsAndControls/ContentViews/NSTableViewPage.swift
**Status:** merged

## Absorbed leaves

| # | Type | Kind | Absorbed Into |
|---|------|------|---------------|
| 1 | NSTableColumn | class : NSObject | Reference — Variants tab |
| 2 | NSTableViewRowAction | class (macOS 10.11+) | Reference — Variants tab |
| 3 | NSTableViewDataSource | protocol | Reference — Variants tab |
| 4 | NSTableViewDelegate | protocol | Reference — Variants tab |
| 5 | NSTableViewDiffableDataSource | class (macOS 11+) | Reference — Variants tab |
| 6 | NSTableCellView | class : NSView (macOS 10.7+) | Patterns — States tab |
| 7 | NSTableRowView | class : NSView (macOS 10.7+) | Patterns — States tab |

**Total absorbed:** 7 leaves (1 parent kept, 7 siblings documented inline)

## Per-leaf coverage checklist

### Leaf 1: NSTableColumn
- [x] Header info captured (class : NSObject)
- [x] Signatures transcribed (identifier, title, width, minWidth, maxWidth, resizingMask, sortDescriptorPrototype, headerCell)
- [x] addTableColumn, tableColumns, column(withIdentifier:), moveColumn documented
- [x] Catalog leaf removed from Catalog+AppKit.swift (line 105)
- [x] Registry entry "NSTableColumn" removed from PageRegistry.swift
- [x] Lands in: Reference — Variants tab

### Leaf 2: NSTableViewRowAction
- [x] Header info captured (class : NSObject, macOS 10.11+)
- [x] Signatures transcribed (style: .destructive/.regular, title, action closure, backgroundColor, image)
- [x] Delegate return signature documented (tableView(_:rowActionsForRow:edge:))
- [x] backgroundColor set to semantic token (.systemRed) in snippet
- [x] Catalog leaf removed from Catalog+AppKit.swift (line 106)
- [x] Registry entry "NSTableViewRowAction" removed from PageRegistry.swift
- [x] Lands in: Reference — Variants tab

### Leaf 3: NSTableViewDataSource
- [x] Header info captured (protocol : NSObjectProtocol)
- [x] Required method documented (numberOfRows(in:))
- [x] Optional cell-based method documented (objectValueFor:row:)
- [x] Optional drag-and-drop methods documented (writeRowsWith, validateDrop, acceptDrop)
- [x] Optional sorting method documented (sortDescriptorsDidChange)
- [x] Catalog leaf removed from Catalog+AppKit.swift (line 99)
- [x] Registry entry "NSTableViewDataSource" removed from PageRegistry.swift
- [x] Lands in: Reference — Variants tab

### Leaf 4: NSTableViewDelegate
- [x] Header info captured (protocol : NSControlTextEditingDelegate)
- [x] View-based methods documented (viewFor:row:, rowViewForRow:)
- [x] Row sizing documented (heightOfRow:)
- [x] Selection policy methods documented (shouldSelectRow:, selectionIndexesForProposedSelection:, selectionDidChange)
- [x] Appearance methods documented (willDisplayCell:, isGroupRow:)
- [x] Catalog leaf removed from Catalog+AppKit.swift (line 100)
- [x] Registry entry "NSTableViewDelegate" removed from PageRegistry.swift
- [x] Lands in: Reference — Variants tab

### Leaf 5: NSTableViewDiffableDataSource
- [x] Header info captured (class : NSObject, NSTableViewDataSource; macOS 11+)
- [x] Generic init documented (closure returning NSView?)
- [x] Snapshot apply pattern documented (apply(_:animatingDifferences:))
- [x] Incremental update pattern documented (snapshot() → mutate → apply)
- [x] Catalog leaf removed from Catalog+AppKit.swift (line 101)
- [x] Registry entry "NSTableViewDiffableDataSource" removed from PageRegistry.swift
- [x] Lands in: Reference — Variants tab

### Leaf 6: NSTableCellView
- [x] Header info captured (class : NSView, macOS 10.7+)
- [x] Key outlets documented (textField, imageView)
- [x] makeView(withIdentifier:owner:) reuse pattern documented
- [x] Layout via Auto Layout constraints shown
- [x] Catalog leaf removed from Catalog+AppKit.swift (line 98)
- [x] Registry entry "NSTableCellView" removed from PageRegistry.swift
- [x] Lands in: Patterns — States tab (NSTableCellView + NSTableRowView combined block)

### Leaf 7: NSTableRowView
- [x] Header info captured (class : NSView, macOS 10.7+)
- [x] Role: manages entire row background and selection chrome
- [x] backgroundColor and draw override pattern documented
- [x] drawBackground(in:) and drawSelection(in:) override methods documented
- [x] Catalog leaf removed from Catalog+AppKit.swift (line 104)
- [x] Registry entry "NSTableRowView" removed from PageRegistry.swift
- [x] Lands in: Patterns — States tab (combined block with NSTableCellView)

## Page section plan

Rendered via GalleryPageScaffold (defaultRender / variants / states / notes tabs):

1. **Header** — NSTableView, subtitle (rows = records, columns = attributes), inheritance, doc path
2. **Default render tab** — Three-column five-row live NSTableView via NSViewControllerRepresentable; alternatesRows toggle; gridStyleMask picker (none/horizontal/vertical/both); style picker (automatic/fullWidth/inset/sourceList/plain)
3. **Variants tab (Reference)** — NSTableColumn; NSTableViewRowAction; NSTableViewDataSource protocol; NSTableViewDelegate protocol; NSTableViewDiffableDataSource
4. **States tab (Patterns)** — NSTableCellView + NSTableRowView combined block; classic vs. diffable data source comparison; delegate hooks (variable height, row actions, group rows); sort descriptors; selection API + notifications
5. **Notes** — NSScrollView wrapper, view-based vs. cell-based, diffable preference, NSOutlineView inheritance, sourceList style, trailing edge check for row actions

## Code quality review

- [x] L-001 clean: zero hits for `Color(red:` or `.system(size:`
- [x] Bridge uses NSViewControllerRepresentable (NSTableViewDemo wrapping NSScrollView → NSTableView)
- [x] No custom wrapper structs beyond the bridge
- [x] @State properties are private (alternatesRows, gridChoice, styleChoice)
- [x] Coordinator (TableCoordinator) is NSObject conforming to NSTableViewDataSource + NSTableViewDelegate
- [x] Cell reuse pattern correct: makeView(withIdentifier:owner:) with fallback construction
- [x] updateNSViewController calls reloadData — acceptable for reference demo with static 5-row data
- [x] Semantic colors only in all code snippets and bridge (NSColor.systemRed for row action, NSColor.windowBackgroundColor for row view note)
- [x] GalleryPageScaffold tabs used correctly (default/variants/states/notes)
- [x] Reference sections appear in Variants tab above States tab
- [x] Build: SUCCEEDED

## Sign-off

- Implementer: Claude Sonnet 4.6 — 2026-05-05
- Code-quality reviewer: Claude Sonnet 4.6 — 2026-05-05

## Manifest metadata

- **Task ID:** D3
- **Parent type:** NSTableView
- **Framework:** AppKit
- **Section:** views-and-controls / content-views
- **Absorbed leaves:** 7 (NSTableColumn, NSTableViewRowAction, NSTableViewDataSource, NSTableViewDelegate, NSTableViewDiffableDataSource, NSTableCellView, NSTableRowView)
- **Registry entries removed:** 7
- **Files deleted:** 7 Describe page siblings
- **Created:** 2026-05-05
