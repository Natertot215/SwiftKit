---
url: https://developer.apple.com/documentation/appkit/nstableviewdatasource
framework: AppKit
category: Views and controls
title: NSTableViewDataSource
kind: protocol
captured: 2026-05-02
---

# NSTableViewDataSource

A set of methods that a table view uses to provide data to a table view and to allow the editing of the table view’s data source object.

## Declaration

```swift
protocol NSTableViewDataSource : NSObjectProtocol
```

### Overview

Some of the methods in this protocol, such as `NSTableViewDataSource/tableView(_:objectValueFor:row:)` and `NSTableViewDataSource/numberOfRows(in:)` along with other methods that return data, are called frequently, so they must be efficient.

> **NOTE:**  View-based table views must not use the `NSTableViewDataSource/tableView(_:setObjectValue:for:row:)` method for setting values. Instead the views must explicitly set the values for the fields, or use Cocoa bindings. Likewise, use target/action for editing. For more information, see `NSTableView`.

If you’re not using Cocoa bindings to provide data to the table view, the following methods are required:

- `NSTableViewDataSource/numberOfRows(in:)`
- `NSTableViewDataSource/tableView(_:objectValueFor:row:)`
- `NSTableViewDataSource/tableView(_:setObjectValue:for:row:)` (cell-based tables only)

For more information, see `cocoa-bindings`.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSTableViewDiffableDataSource`, `NSTableViewDiffableDataSourceReference`

## Availability

- macOS ?

## Topics

### Getting Values

- `numberOfRows(in:)`
- `tableView(_:objectValueFor:row:)`

### Setting Values

- `tableView(_:setObjectValue:for:row:)`

### Implementing Pasteboard Support

- `tableView(_:pasteboardWriterForRow:)`

### Drag and Drop

- `Supporting Table View Drag and Drop Through File Promises`
- `tableView(_:acceptDrop:row:dropOperation:)`
- `tableView(_:namesOfPromisedFilesDroppedAtDestination:forDraggedRowsWith:)`
- `tableView(_:validateDrop:proposedRow:proposedDropOperation:)`
- `tableView(_:writeRowsWith:to:)`
- `tableView(_:draggingSession:willBeginAt:forRowIndexes:)`
- `tableView(_:updateDraggingItemsForDrag:)`
- `tableView(_:draggingSession:endedAt:operation:)`

### Sorting

- `tableView(_:sortDescriptorsDidChange:)`

## See Also

- `NSTableViewDelegate`
- `NSTableViewDiffableDataSource`
