---
url: https://developer.apple.com/documentation/appkit/nsevent/phase-swift.struct
framework: AppKit
category: Mouse, keyboard, and trackpad
title: NSEvent.Phase
kind: struct
captured: 2026-05-02
---

# NSEvent.Phase

Constants that represent the possible phases during an event phase.

## Declaration

```swift
struct Phase
```







## Relationships

**Conforms To**: `BitwiseCopyable`, `Equatable`, `ExpressibleByArrayLiteral`, `OptionSet`, `RawRepresentable`, `Sendable`, `SendableMetatype`, `SetAlgebra`

## Availability

- macOS 10.7

## Topics

### Constants

- `began`
- `stationary`
- `changed`
- `ended`
- `cancelled`
- `mayBegin`

### Initializers

- `init(rawValue:)`

## See Also

- `NSEvent.EventTypeMask`
- `NSEvent.ButtonMask`
- `NSEvent.ModifierFlags`
- `NSEvent.SwipeTrackingOptions`
- `init(type:)`
