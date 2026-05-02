---
url: https://developer.apple.com/documentation/appkit/nsmenuitemcell
framework: AppKit
category: Deprecated symbols
title: NSMenuItemCell
kind: class
captured: 2026-05-02
---

# NSMenuItemCell

An object that handles the measurement and display of a single menu item in its encompassing frame.

## Declaration

```swift
class NSMenuItemCell
```

### Overview

> **NOTE:**  `NSMenuItemCell` is no longer used to draw menus. Using it does not affect the appearance of your menus.





## Relationships

**Inherits From**: `NSButtonCell`

**Inherited By**: `NSPopUpButtonCell`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Initializers

- `init(coder:)`
- `init(textCell:)`

### Configuring Menu-Item Attributes

- `menuItem`

### Calculating the Size of a Menu Item

- `calcSize()`
- `needsSizing`
- `imageWidth`
- `titleWidth`
- `keyEquivalentWidth`
- `stateImageWidth`

### Getting the Menu Item’s Drawing Rectangle

- `keyEquivalentRect(forBounds:)`
- `stateImageRect(forBounds:)`
- `titleRect(forBounds:)`

### Drawing the Menu Item

- `drawBorderAndBackground(withFrame:in:)`
- `drawImage(withFrame:in:)`
- `drawKeyEquivalent(withFrame:in:)`
- `drawSeparatorItem(withFrame:in:)`
- `drawStateImage(withFrame:in:)`
- `drawTitle(withFrame:in:)`
- `needsDisplay`

### Assigning a Tag

- `tag`

## See Also

- `NSOpenGLView`
- `NSOpenGLContext`
- `NSOpenGLLayer`
- `NSOpenGLPixelFormat`
- `NSDrawer`
- `NSForm`
- `NSFormCell`
