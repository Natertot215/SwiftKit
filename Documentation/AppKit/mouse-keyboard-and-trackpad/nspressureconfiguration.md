---
url: https://developer.apple.com/documentation/appkit/nspressureconfiguration
framework: AppKit
category: Mouse, keyboard, and trackpad
title: NSPressureConfiguration
kind: class
captured: 2026-05-02
---

# NSPressureConfiguration

An encapsulation of the behavior and progression of a Force Touch trackpad as it responds to specific events.

## Declaration

```swift
class NSPressureConfiguration
```

### Overview

Use an `NSPressureConfiguration` object to configure the behavior and progression of a Force Touch trackpad when it responds to a mouse drag or pressure event sequence. Pressure configurations are assigned to views (`NSView`) and gesture recognizers (`NSGestureRecognizer`).





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 10.10.3

## Topics

### Creating a Pressure Configuration Object

- `init(pressureBehavior:)`
- `set()`

### Accessing Pressure Configuration Object Properties

- `pressureBehavior`

## See Also

- `NSHapticFeedbackManager`
