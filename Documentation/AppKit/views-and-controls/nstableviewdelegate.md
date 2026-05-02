---
url: https://developer.apple.com/documentation/appkit/nstableviewdelegate
framework: AppKit
category: Views and controls
title: NSTableViewDelegate
kind: protocol
captured: 2026-05-02
---

# NSTableViewDelegate

A set of optional methods you implement in a table view delegate to customize the behavior of the table view.

## Declaration

```swift
protocol NSTableViewDelegate : NSControlTextEditingDelegate
```

### Overview

Using a table view delegate allows you to customize a table view’s behavior without creating a table view subclass. A table view delegate provides views for table rows and columns, and supports functionality such as column reordering and resizing and row selection. To learn more about table views, see `NSTableView`.





## Relationships

**Inherits From**: `NSControlTextEditingDelegate`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Providing views for rows and columns

- `tableView(_:viewFor:row:)`
- `tableView(_:rowViewForRow:)`

### Notification of row views being added or removed

- `tableView(_:didAdd:forRow:)`
- `tableView(_:didRemove:forRow:)`

### Grouping rows

- `tableView(_:isGroupRow:)`

### Providing cells for rows and columns

- `tableView(_:willDisplayCell:for:row:)`
- `tableView(_:dataCellFor:row:)`
- `tableView(_:shouldShowCellExpansionFor:row:)`
- `tableView(_:toolTipFor:rect:tableColumn:row:mouseLocation:)`

### Editing cells

- `tableView(_:shouldEdit:row:)`

### Setting row and column size

- `tableView(_:heightOfRow:)`
- `tableView(_:sizeToFitWidthOfColumn:)`

### Selecting rows

- `selectionShouldChange(in:)`
- `tableView(_:shouldSelectRow:)`
- `tableView(_:selectionIndexesForProposedSelection:)`
- `tableView(_:shouldSelect:)`
- `tableViewSelectionIsChanging(_:)`
- `tableViewSelectionDidChange(_:)`
- `tableView(_:shouldTypeSelectFor:withCurrentSearch:)`
- `tableView(_:typeSelectStringFor:row:)`
- `tableView(_:nextTypeSelectMatchFromRow:toRow:for:)`

### Moving and resizing columns

- `tableView(_:shouldReorderColumn:toColumn:)`
- `tableView(_:didDrag:)`
- `tableViewColumnDidMove(_:)`
- `tableViewColumnDidResize(_:)`

### Responding to mouse events

- `tableView(_:didClick:)`
- `tableView(_:mouseDownInHeaderOf:)`
- `tableView(_:shouldTrackCell:for:row:)`

### Enabling table row actions

- `tableView(_:rowActionsForRow:edge:)`

### Showing and hiding columns

- `tableView(_:userCanChangeVisibilityOf:)`
- `tableView(_:userDidChangeVisibilityOf:)`

## See Also

- `NSTableViewDataSource`
- `NSTableViewDiffableDataSource`
