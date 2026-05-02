---
url: https://developer.apple.com/documentation/appkit/nstablecellview
framework: AppKit
category: Views and controls
title: NSTableCellView
kind: class
captured: 2026-05-02
---

# NSTableCellView

A reusable container view shown for a particular cell in a table view that uses rows for content.

## Declaration

```swift
class NSTableCellView
```

### Overview

The `NSTableCellView/imageView` and `NSTableCellView/textField` properties are connected in Interface Builder. Additional properties can be added by subclassing `NSTableCellView` and adding the required properties and connecting them programmatically or in Interface Builder.

The `objectValue` is used when setting the value of the view cell by the `NSTableViewDataSource/tableView(_:objectValueFor:row:)` method in the `NSTableViewDataSource`. If you use your own custom view cells that are not based on `NSTableCellView` you should implement this property in order to be able to receive changes to cell values.





## Relationships

**Inherits From**: `NSView`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.7

## Topics

### Represented Object

- `objectValue`

### Displayed Items

- `imageView`
- `textField`

### Getting and Setting the Background Style

- `backgroundStyle`

### Getting and Setting the Row Size Style

- `rowSizeStyle`

### Dragging Images

- `draggingImageComponents`

## See Also

- `NSTableView`
