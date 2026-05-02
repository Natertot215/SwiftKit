---
url: https://developer.apple.com/documentation/appkit/nstablecolumn
framework: AppKit
category: Views and controls
title: NSTableColumn
kind: class
captured: 2026-05-02
---

# NSTableColumn

The display characteristics and identifier for a column in a table view.

## Declaration

```swift
@MainActor class NSTableColumn
```

### Overview

A table column object determines the width (including the maximum and minimum widths) of its column in the table view and specifies the column’s  resizing and editing behavior. A table column stores two cell objects: the header cell, which is used to draw the column header, and the data cell, which is used to draw the values for each row. In a cell-based table, you can control the display of the column by specifying subclasses of `NSCell` to use and by setting the font and other display characteristics for these cells. For example, you can use an `NSTextFieldCell` to display string values or substitute an `NSImageCell` to display pictures.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `NSUserInterfaceItemIdentification`, `Sendable`

## Availability

- macOS ?

## Topics

### Creating a Table Column

- `init(identifier:)`

### Setting the Table View

- `tableView`

### Controlling Size

- `width`
- `minWidth`
- `maxWidth`
- `resizingMask`
- `sizeToFit()`

### Setting the Header

- `title`
- `headerCell`

### Setting the Identifier

- `identifier`

### Controlling Editability in a Cell-Based Table

- `isEditable`

### Sorting

- `sortDescriptorPrototype`

### Setting Column Visibility

- `isHidden`

### Setting Tooltips

- `headerToolTip`

### Deprecated Methods

- `dataCell`
- `dataCell(forRow:)`

### Constants

- `Resizing Modes`

### Initializers

- `init(coder:)`

### Structures

- `NSTableColumn.ResizingOptions`

## See Also

- `NSTableHeaderView`
- `NSTableHeaderCell`
- `NSTableRowView`
- `NSTableViewRowAction`
- `NSTableColumn.ResizingOptions`
