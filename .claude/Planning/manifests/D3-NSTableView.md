# D3 — NSTableViewPage Coverage Manifest

**Parent page:** SwiftKit/Pages/AppKit/ViewsAndControls/ContentViews/NSTableViewPage.swift (rewrite in place)
**Parent leaf location:** Catalog+AppKit.swift, `appkit.views-and-controls.content-views` subsection, line 97 (NSTableView) — absorbs lines 98 (NSTableCellView), 99 (NSTableViewDataSource), 100 (NSTableViewDelegate), 101 (NSTableViewDiffableDataSource), 104 (NSTableRowView), 105 (NSTableColumn), 106 (NSTableViewRowAction)
**Status:** pending

## Absorbed Leaves

| # | Leaf displayName | Catalog line | apiSignature | Doc path | Subsection target |
|---|---|---|---|---|---|
| 1 | NSTableViewDataSource | 99 | protocol NSTableViewDataSource | Documentation/AppKit/views-and-controls/nstableviewdatasource.md | Reference — NSTableViewDataSource protocol |
| 2 | NSTableViewDelegate | 100 | protocol NSTableViewDelegate | Documentation/AppKit/views-and-controls/nstableviewdelegate.md | Reference — NSTableViewDelegate protocol |
| 3 | NSTableViewDiffableDataSource | 101 | class NSTableViewDiffableDataSource | Documentation/AppKit/views-and-controls/nstableviewdiffabledatasource.md | Reference — NSTableViewDiffableDataSource class |
| 4 | NSTableCellView | 98 | class NSTableCellView : NSView | Documentation/AppKit/views-and-controls/nstablecellview.md | NSTableCellView + NSTableRowView |
| 5 | NSTableRowView | 104 | class NSTableRowView : NSView | Documentation/AppKit/views-and-controls/nstablerowview.md | NSTableCellView + NSTableRowView |
| 6 | NSTableColumn | 105 | class NSTableColumn : NSObject | Documentation/AppKit/views-and-controls/nstablecolumn.md | Reference — NSTableColumn type |
| 7 | NSTableViewRowAction | 106 | class NSTableViewRowAction : NSObject | Documentation/AppKit/views-and-controls/nstableviewrowaction.md | Reference — NSTableViewRowAction |

## Existing Describe Pages to Delete

- NSTableViewDataSourceDescribePage.swift
- NSTableViewDelegateDescribePage.swift
- NSTableViewDiffableDataSourceDescribePage.swift
- NSTableCellViewDescribePage.swift
- NSTableRowViewDescribePage.swift
- NSTableColumnDescribePage.swift
- NSTableViewRowActionDescribePage.swift

## Parent Page Section Plan

1. **Header** — Title: "NSTableView"; class : NSControl; doc path; brief summary
2. **Reference — NSTableColumn type** — Class definition, key properties (identifier, title, width, minWidth, maxWidth, resizingMask, sortDescriptorPrototype, headerCell, dataCell)
3. **Reference — NSTableViewRowAction** — Class definition (macOS 10.11+); properties (title, style: .regular/.destructive, backgroundColor, image); how to return from delegate
4. **Reference — NSTableViewDataSource protocol** — Required methods (numberOfRows, objectValueFor:row:), optional methods (sortDescriptorsDidChange, writeRowsWith, validateDrop, acceptDrop)
5. **Reference — NSTableViewDelegate protocol** — Key methods (viewFor:row:, heightOfRow:, shouldSelectRow:, willDisplayCell:); selectionDidChange notification
6. **Reference — NSTableViewDiffableDataSource class** — macOS 11+; NSDiffableDataSourceSnapshot; apply(_:animatingDifferences:); no manual reloadData needed
7. **Default NSTableView** — Live NSViewRepresentable bridge; three-column five-row demo; controls for alternatesRows, gridStyleMask, style
8. **NSTableCellView + NSTableRowView** — Code snippet showing view-based cell creation (makeView(withIdentifier:owner:)); NSTableCellView subviews (textField, imageView); NSTableRowView drawing hooks (drawBackground, drawSelection)
9. **Data Source Pattern** — Snippet: DataSource (objectValue:for:row:) vs DiffableDataSource (snapshot apply); comparison table
10. **Delegate Hooks** — Snippet: viewFor:row: (view-based), heightOfRow: (variable heights), willDisplayCell: (cell-based legacy), shouldSelectRow:
11. **Sort Descriptors** — Snippet: column.sortDescriptorPrototype; sortDescriptorsDidChange; re-sort + reloadData pattern
12. **Selection** — Snippet: allowsMultipleSelection, selectRowIndexes(_:byExtendingSelection:), selectedRowIndexes; selectionDidChangeNotification
13. **Notes** — NSScrollView wrapper requirement; NSOutlineView inheritance; view-based vs cell-based tables; DiffableDataSource macOS 11+ gate

## Catalog Edits

**Delete 7 leaf entries:**
- `appkit.views-and-controls.content-views.nstablecellview` (line 98)
- `appkit.views-and-controls.content-views.nstableviewdatasource` (line 99)
- `appkit.views-and-controls.content-views.nstableviewdelegate` (line 100)
- `appkit.views-and-controls.content-views.nstableviewdiffabledatasource` (line 101)
- `appkit.views-and-controls.content-views.nstablerowview` (line 104)
- `appkit.views-and-controls.content-views.nstablecolumn` (line 105)
- `appkit.views-and-controls.content-views.nstableviewrowaction` (line 106)

**Keep:** `appkit.views-and-controls.content-views.nstableview` (line 97) — `.real(symbol: "NSTableView")`

## Registry Edits

**Remove 7 entries:**
- `"NSTableCellView"` → NSTableCellViewDescribePage()
- `"NSTableViewDataSource"` → NSTableViewDataSourceDescribePage()
- `"NSTableViewDelegate"` → NSTableViewDelegateDescribePage()
- `"NSTableViewDiffableDataSource"` → NSTableViewDiffableDataSourceDescribePage()
- `"NSTableRowView"` → NSTableRowViewDescribePage()
- `"NSTableColumn"` → NSTableColumnDescribePage()
- `"NSTableViewRowAction"` → NSTableViewRowActionDescribePage()

**Keep:** `"NSTableView"` → NSTableViewPage()

## Manifest Metadata

- **Task ID:** D3
- **Parent type:** NSTableView
- **Framework:** AppKit
- **Section:** views-and-controls / content-views
- **Absorbed leaf count:** 7
- **Pages to delete:** 7 Describe page files listed above
- **Created:** 2026-05-05
