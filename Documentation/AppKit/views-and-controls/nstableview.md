---
url: https://developer.apple.com/documentation/appkit/nstableview
framework: AppKit
category: Views and controls
title: NSTableView
kind: class
captured: 2026-05-02
---

# NSTableView

A set of related records, displayed in rows that represent individual records and columns that represent the attributes of those records.

## Declaration

```swift
class NSTableView
```

### Overview

Table views are displayed in scroll views. Beginning with macOS v10.7, you can use `NSView` objects (most commonly customized `NSTableCellView` objects) instead of cells for specifying rows and columns. You can still use `NSCell` objects for each row and column item if you prefer.

A table view does not store its own data; it retrieves data values as needed from a data source to which it has a weak reference. You should not, therefore, directly set data values programmatically in the table view; instead, modify the values in the data source and allow the changes to be reflected in the table view. To learn about the methods that an `NSTableView` object uses to provide and access the contents of its data source object, see `NSTableViewDataSource`.

To customize a table view’s behavior without subclassing `NSTableView`, use the methods defined by the `NSTableViewDelegate` protocol. For example, the delegate supports table column management, type-to-select functionality, row selection and editing, custom tracking, and custom views for individual columns and rows. To learn more about the table view delegate, see `NSTableViewDelegate`.

> **IMPORTANT:**  It’s possible that your data source methods for populating the table view may be called before `NSObject-swift.class/awakeFromNib()` is called if the data source is specified in Interface Builder. You should defend against this by having the data source’s `NSTableViewDataSource/numberOfRows(in:)` method return `0` for the number of rows when the data source has not yet been configured. In `NSObject-swift.class/awakeFromNib()`, when the data source is initialized you should always call `reloadData` on the table view.

#### Subclassing

Subclassing `NSTableView` is usually not necessary. Instead, you customize the table view using a delegate object (an object conforming to the `NSTableViewDelegate` protocol) and a data source object (conforming to the `NSTableViewDataSource` protocol), or by subclassing one of the following subcomponents: cells (when using `NSCell`-based table views), the row cell view or the row view (when using `NSView`-based table views), the table column class, or table column header classes.

#### Enabling the Table View

Use the `NSControl/isEnabled` property to enable or disable the table view, which the view inherits from `NSControl`. This property affects the visual appearance of the table view differently depending on whether you use a view- or a cell-based table view. When you change the property’s value for a cell-based table view, the system manages the visual appearance of that table view’s rows, and updates them to a state that reflects the value. Because view-based table views permit complex items in their cells, it’s the developer’s responsibility to update each cell’s appearance as appropriate.





## Relationships

**Inherits From**: `NSControl`

**Inherited By**: `NSOutlineView`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityGroup`, `NSAccessibilityProtocol`, `NSAccessibilityTable`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSDraggingSource`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTextDelegate`, `NSTextViewDelegate`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `NSUserInterfaceValidations`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Creating a Table

- `init(coder:)`
- `init(frame:)`

### Managing the Table’s Data

- `dataSource`
- `usesStaticContents`
- `reloadData()`
- `reloadData(forRowIndexes:columnIndexes:)`

### Creating Views to Display

- `makeView(withIdentifier:owner:)`
- `rowView(atRow:makeIfNecessary:)`
- `view(atColumn:row:makeIfNecessary:)`
- `NSUserInterfaceItemIdentifier`

### Updating the Table View Arrangement

- `beginUpdates()`
- `endUpdates()`
- `moveRow(at:to:)`
- `insertRows(at:withAnimation:)`
- `removeRows(at:withAnimation:)`
- `row(for:)`
- `column(for:)`

### NSView-Based Table Nib File Registration

- `register(_:forIdentifier:)`
- `registeredNibsByIdentifier`

### Target-action Behavior

- `doubleAction`
- `clickedColumn`
- `clickedRow`

### Configuring Behavior

- `allowsColumnReordering`
- `allowsColumnResizing`
- `allowsMultipleSelection`
- `allowsEmptySelection`
- `allowsColumnSelection`
- `usesAutomaticRowHeights`

### Setting Display Attributes

- `intercellSpacing`
- `rowHeight`
- `backgroundColor`
- `usesAlternatingRowBackgroundColors`
- `style`
- `effectiveStyle`
- `NSTableView.Style`
- `selectionHighlightStyle`
- `gridColor`
- `gridStyleMask`
- `indicatorImage(in:)`
- `setIndicatorImage(_:in:)`

### Getting and Setting Row Size Styles

- `effectiveRowSizeStyle`
- `rowSizeStyle`

### Column Management

- `addTableColumn(_:)`
- `removeTableColumn(_:)`
- `moveColumn(_:toColumn:)`
- `tableColumns`
- `column(withIdentifier:)`
- `tableColumn(withIdentifier:)`

### Selecting Columns and Rows

- `selectColumnIndexes(_:byExtendingSelection:)`
- `selectedColumn`
- `selectedColumnIndexes`
- `deselectColumn(_:)`
- `numberOfSelectedColumns`
- `isColumnSelected(_:)`
- `selectRowIndexes(_:byExtendingSelection:)`
- `selectedRow`
- `selectedRowIndexes`
- `deselectRow(_:)`
- `numberOfSelectedRows`
- `isRowSelected(_:)`
- `selectAll(_:)`
- `deselectAll(_:)`

### Enumerating Table Rows

- `enumerateAvailableRowViews(_:)`

### Managing Type Select

- `allowsTypeSelect`

### Table Dimensions

- `numberOfColumns`
- `numberOfRows`

### Getting and Setting Floating Rows

- `floatsGroupRows`

### Editing Cells

- `editColumn(_:row:with:select:)`
- `editedColumn`
- `editedRow`

### Adding and Deleting Row Views

- `didAdd(_:forRow:)`
- `didRemove(_:forRow:)`

### Setting Auxiliary Views

- `headerView`
- `cornerView`

### Layout Support

- `userInterfaceLayoutDirection`
- `rect(ofColumn:)`
- `rect(ofRow:)`
- `rows(in:)`
- `columnIndexes(in:)`
- `column(at:)`
- `row(at:)`
- `frameOfCell(atColumn:row:)`
- `columnAutoresizingStyle`
- `sizeLastColumnToFit()`
- `noteNumberOfRowsChanged()`
- `tile()`
- `sizeToFit()`
- `noteHeightOfRows(withIndexesChanged:)`

### Drawing

- `drawRow(_:clipRect:)`
- `drawGrid(inClipRect:)`
- `highlightSelection(inClipRect:)`
- `drawBackground(inClipRect:)`

### Scrolling

- `scrollRowToVisible(_:)`
- `scrollColumnToVisible(_:)`

### Table Column State Persistence

- `autosaveTableColumns`
- `autosaveName`
- `NSTableView.AutosaveName`

### Accessing the Delegate

- `delegate`

### Highlightable Column Headers

- `highlightedTableColumn`

### Dragging

- `dragImageForRows(with:tableColumns:event:offset:)`
- `canDragRows(with:at:)`
- `setDraggingSourceOperationMask(_:forLocal:)`
- `verticalMotionCanBeginDrag`
- `draggingDestinationFeedbackStyle`
- `setDropRow(_:dropOperation:)`

### Sorting

- `sortDescriptors`

### Row Actions

- `rowActionsVisible`

### Hiding and Showing Table Rows

- `hideRows(at:withAnimation:)`
- `unhideRows(at:withAnimation:)`
- `hiddenRowIndexes`

### Deprecated Methods

- `focusedColumn()`
- `setFocusedColumn(_:)`
- `shouldFocusCell(_:atColumn:row:)`
- `performClickOnCell(atColumn:row:)`
- `preparedCell(atColumn:row:)`

### Constants

- `Specifying a Custom Row View in a Nib File`
- `NSTableView.DraggingDestinationFeedbackStyle`
- `NSTableView.DropOperation`
- `NSTableView.GridLineStyle`
- `NSTableView.ColumnAutoresizingStyle`
- `NSTableView.SelectionHighlightStyle`
- `NSTableView.AnimationOptions`
- `NSTableView.RowSizeStyle`
- `NSTableView.RowActionEdge`

### Notifications

- `columnDidMoveNotification`
- `columnDidResizeNotification`
- `selectionDidChangeNotification`
- `selectionIsChangingNotification`

## See Also

- `Table View Programming Guide for Mac`

- `NSTableCellView`
