---
url: https://developer.apple.com/documentation/appkit/nsevent/modifierflags-swift.struct
framework: AppKit
category: Mouse, keyboard, and trackpad
title: NSEvent.ModifierFlags
kind: struct
captured: 2026-05-02
---

# NSEvent.ModifierFlags

Flags that represent key states in an event object.

## Declaration

```swift
struct ModifierFlags
```







## Relationships

**Conforms To**: `BitwiseCopyable`, `Equatable`, `ExpressibleByArrayLiteral`, `OptionSet`, `RawRepresentable`, `Sendable`, `SendableMetatype`, `SetAlgebra`

## Availability

- macOS ?

## Topics

### Event Modifier Flags

- `capsLock`
- `shift`
- `control`
- `option`
- `command`
- `numericPad`
- `help`
- `function`
- `deviceIndependentFlagsMask`

### Deprecated

- `init(rawValue:)`

## See Also

- `NSEvent.EventTypeMask`
- `NSEvent.ButtonMask`
- `NSEvent.Phase`
- `NSEvent.SwipeTrackingOptions`
- `init(type:)`
