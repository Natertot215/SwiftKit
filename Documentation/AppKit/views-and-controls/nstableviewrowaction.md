---
url: https://developer.apple.com/documentation/appkit/nstableviewrowaction
framework: AppKit
category: Views and controls
title: NSTableViewRowAction
kind: class
captured: 2026-05-02
---

# NSTableViewRowAction

A single action to present when the user swipes horizontally on a table row.

## Declaration

```swift
class NSTableViewRowAction
```

### Overview

In an editable table, performing a horizontal swipe on a row reveals a button to delete the row by default. This class lets you define one or more custom actions to display for a given row in your table. Each instance of this class represents a single action to perform and includes the text, formatting information, and behavior for the corresponding button.

To add custom actions to your table view’s rows, implement the `NSTableViewDelegate/tableView(_:rowActionsForRow:edge:)` method in your table view’s delegate object. In that method, create and return an array of actions for the specified row. The table handles the remaining work of displaying the action buttons and executing the appropriate handler block when the user clicks the button.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSObjectProtocol`

## Availability

- macOS 10.11

## Topics

### Creating a Table Row Action

- `init(style:title:handler:)`

### Configuring the Action’s Appearance

- `style`
- `title`
- `backgroundColor`

### Constants

- `NSTableViewRowAction.Style`

### Instance Properties

- `image`

## See Also

- `NSTableHeaderView`
- `NSTableHeaderCell`
- `NSTableRowView`
- `NSTableColumn`
- `NSTableColumn.ResizingOptions`
