---
url: https://developer.apple.com/documentation/appkit/nsformcell
framework: AppKit
category: Deprecated symbols
title: NSFormCell
kind: class
captured: 2026-05-02
---

# NSFormCell

The `NSFormCell` class is used to implement text entry fields in a form. The left part of an `NSFormCell` object contains a title. The right part contains an editable text entry field.

## Declaration

```swift
class NSFormCell
```

### Overview

An `NSFormCell` object implements the user interface of an `NSForm` object.





## Relationships

**Inherits From**: `NSActionCell`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Initializers

- `init(coder:)`

### Initializing an NSFormCell

- `init(textCell:)`

### Asking About a Cell’s Appearance

- `isOpaque`

### Accessing a Cell’s Title

- `attributedTitle`
- `title`
- `titleAlignment`
- `titleBaseWritingDirection`
- `titleFont`
- `titleWidth`

### Asking About Placeholder Values

- `placeholderAttributedString`
- `placeholderString`

### Sizing for Auto Layout

- `preferredTextFieldWidth`

### Instance Methods

- `titleWidth(_:)`

## See Also

- `NSOpenGLView`
- `NSOpenGLContext`
- `NSOpenGLLayer`
- `NSOpenGLPixelFormat`
- `NSDrawer`
- `NSForm`
- `NSMenuItemCell`
