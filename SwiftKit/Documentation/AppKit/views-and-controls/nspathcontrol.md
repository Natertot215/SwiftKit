---
url: https://developer.apple.com/documentation/appkit/nspathcontrol
framework: AppKit
category: Views and controls
title: NSPathControl
kind: class
captured: 2026-05-02
---

# NSPathControl

A display of a file system path or virtual path information.

## Declaration

```swift
class NSPathControl
```

### Overview

The `NSPathControl` class uses `NSPathCell` to implement its user interface. `NSPathControl` provides cover methods for most `NSPathCell` methods—the cover method simply invokes the corresponding cell method. See also `NSPathComponentCell`, which represents individual components of the path, and two associated protocols: `NSPathCellDelegate` and `NSPathControlDelegate`.

`NSPathControl` has three styles represented by the `NSPathControl/Style` enumeration constants `NSPathControl/Style/standard`, `NSPathStyle/NSPathStyleNavigationBar`, and `NSPathControl/Style/popUp`. The represented path can be a file system path or any other type of path leading through a sequence of nodes or components, as defined by the programmer.

`NSPathControl` automatically supports drag and drop, which can be further customized via delegate methods. To accept drag and drop, `NSPathControl` calls `NSView/registerForDraggedTypes(_:)` with `NSFilenamesPboardType` and `NSURLPboardType`. When the URL value in the `NSPathControl` object changes because of an automatic drag and drop operation or the user selecting a new path via the open panel, the action is sent. In OS X v10.5 the value returned by `NSPathControl/clickedPathComponentCell()` is `nil`, in macOS 10.6 and later, `NSPathControl/clickedPathComponentCell()` returns the clicked cell.





## Relationships

**Inherits From**: `NSControl`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.5

## Topics

### Setting the Control Style

- `pathStyle`

### Setting the Background Color

- `backgroundColor`

### Managing Path Components

- `clickedPathComponentCell()`
- `pathComponentCells()`
- `setPathComponentCells(_:)`

### Setting the Double-Click Action

- `doubleAction`

### Setting the Path

- `url`

### Setting the Delegate

- `delegate`

### Setting the Drag Operation Mask

- `setDraggingSourceOperationMask(_:forLocal:)`

### Setting Popup Menu

- `menu`

### Instance Properties

- `allowedTypes`
- `clickedPathItem`
- `isEditable`
- `pathItems`
- `placeholderAttributedString`
- `placeholderString`

### Enumerations

- `NSPathControl.Style`
