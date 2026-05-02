---
url: https://developer.apple.com/documentation/appkit/nsform
framework: AppKit
category: Deprecated symbols
title: NSForm
kind: class
captured: 2026-05-02
---

# NSForm

An `NSForm` object is a vertical matrix of `NSFormCell` objects to implement the fields.

## Declaration

```swift
class NSForm
```







## Relationships

**Inherits From**: `NSMatrix`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `NSUserInterfaceValidations`, `NSViewToolTipOwner`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.0 (deprecated 10.10)

## Topics

### Adding and Removing Entries

- `addEntry(_:)`
- `insertEntry(_:at:)`
- `removeEntry(at:)`

### Changing the Appearance of All the Entries

- `setBezeled(_:)`
- `setBordered(_:)`
- `setEntryWidth(_:)`
- `setFrameSize(_:)`
- `setInterlineSpacing(_:)`
- `setTitleAlignment(_:)`
- `setTitleBaseWritingDirection(_:)`
- `setTextAlignment(_:)`
- `setTextBaseWritingDirection(_:)`
- `setTitleFont(_:)`
- `setTextFont(_:)`

### Getting Cells and Indices

- `indexOfCell(withTag:)`
- `indexOfSelectedItem()`
- `cell(at:)`

### Displaying a Cell

- `drawCell(at:)`

### Auto Layout Sizing

- `preferredTextFieldWidth()`
- `setPreferredTextFieldWidth(_:)`

### Editing Text

- `selectText(at:)`

## See Also

- `NSOpenGLView`
- `NSOpenGLContext`
- `NSOpenGLLayer`
- `NSOpenGLPixelFormat`
- `NSDrawer`
- `NSFormCell`
- `NSMenuItemCell`
