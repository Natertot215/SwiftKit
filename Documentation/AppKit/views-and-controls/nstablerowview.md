---
url: https://developer.apple.com/documentation/appkit/nstablerowview
framework: AppKit
category: Views and controls
title: NSTableRowView
kind: class
captured: 2026-05-02
---

# NSTableRowView

The view shown for a row in a table view.

## Declaration

```swift
class NSTableRowView
```

### Overview

`NSTableRowView` is responsible for displaying attributes associated with the row, including the selection highlight, and group row look.





## Relationships

**Inherits From**: `NSView`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityGroup`, `NSAccessibilityProtocol`, `NSAccessibilityRow`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.7

## Topics

### Display Style

- `isEmphasized`
- `interiorBackgroundStyle`
- `isFloating`

### Row Selection

- `isSelected`
- `selectionHighlightStyle`

### Drag and Drop

- `draggingDestinationFeedbackStyle`
- `indentationForDropOperation`
- `isTargetForDropOperation`

### Row Grouping

- `isGroupRowStyle`
- `numberOfColumns`

### Overriding Row View Display Characteristics

- `backgroundColor`
- `drawBackground(in:)`
- `drawDraggingDestinationFeedback(in:)`
- `drawSelection(in:)`
- `drawSeparator(in:)`

### Accessing A Row Column View

- `view(atColumn:)`

### Instance Properties

- `isNextRowSelected`
- `isPreviousRowSelected`

## See Also

- `NSTableHeaderView`
- `NSTableHeaderCell`
- `NSTableColumn`
- `NSTableViewRowAction`
- `NSTableColumn.ResizingOptions`
