---
url: https://developer.apple.com/documentation/appkit/nstableheadercell
framework: AppKit
category: Views and controls
title: NSTableHeaderCell
kind: class
captured: 2026-05-02
---

# NSTableHeaderCell

An object that a table header view uses to draw the content of the column headers.

## Declaration

```swift
class NSTableHeaderCell
```

### Overview

Subclasses of the `NSTableHeaderCell` class can override the `NSCell/drawInterior(withFrame:in:)`, `NSCell/edit(withFrame:in:editor:delegate:event:)`, and `NSCell/highlight(_:withFrame:in:)` methods to change the way headers appear. This specific subclass is responsible for drawing the sort indicators. See the `NSCell` class specification for information on overriding these methods.

See the `NSTableView` and `NSTableHeaderCell` for more information.





## Relationships

**Inherits From**: `NSTextFieldCell`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Drawing Sorting Indicators

- `drawSortIndicator(withFrame:in:ascending:priority:)`
- `sortIndicatorRect(forBounds:)`

## See Also

- `NSTableHeaderView`
- `NSTableRowView`
- `NSTableColumn`
- `NSTableViewRowAction`
- `NSTableColumn.ResizingOptions`
