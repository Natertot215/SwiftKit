---
url: https://developer.apple.com/documentation/appkit/nstouch
framework: AppKit
category: Mouse, keyboard, and trackpad
title: NSTouch
kind: class
captured: 2026-05-02
---

# NSTouch

A snapshot of a particular touch at an instant in time.

## Declaration

```swift
class NSTouch
```

### Overview

A touch event is not persistent throughout the touch. A touch creates new instances as it progresses. Use the identity property to follow a specific touch across its lifetime.

Touches do not have a corresponding screen location. The first touch of a touch collection latches to the view underlying the cursor using the same hit detection as mouse events. Additional touches on the same device latch to the same view. Latches remain on views until the user ends a touch or an event cancels it.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.6

## Topics

### Getting the Touch Type

- `type`
- `NSTouch.TouchType`
- `NSTouch.TouchTypeMask`

### Using Touch Properties

- `identity`
- `phase`
- `NSTouch.Phase`
- `normalizedPosition`
- `isResting`

### Using Touch Device Properties

- `device`
- `deviceSize`

### Getting the Touch Location

- `location(in:)`
- `previousLocation(in:)`

## See Also

- `NSEvent`
