---
url: https://developer.apple.com/documentation/appkit/nstableheaderview
framework: AppKit
category: Views and controls
title: NSTableHeaderView
kind: class
captured: 2026-05-02
---

# NSTableHeaderView

An object that draws headers over a table view’s columns and handles mouse events in those headers.

## Declaration

```swift
class NSTableHeaderView
```

### Overview

`NSTableHeaderView` uses `NSTableHeaderCell` to implement its user interface.





## Relationships

**Inherits From**: `NSView`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `NSViewToolTipOwner`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Setting the table view

- `tableView`

### Checking altered columns

- `draggedColumn`
- `draggedDistance`
- `resizedColumn`

### Utility methods

- `column(at:)`
- `headerRect(ofColumn:)`

## See Also

- `NSTableHeaderCell`
- `NSTableRowView`
- `NSTableColumn`
- `NSTableViewRowAction`
- `NSTableColumn.ResizingOptions`
