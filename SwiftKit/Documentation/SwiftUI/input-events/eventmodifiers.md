---
url: https://developer.apple.com/documentation/swiftui/eventmodifiers
framework: SwiftUI
category: Input events
title: EventModifiers
kind: struct
captured: 2026-05-02
---

# EventModifiers

A set of key modifiers that you can add to a gesture.

## Declaration

```swift
@frozen struct EventModifiers
```







## Relationships

**Conforms To**: `BitwiseCopyable`, `Copyable`, `Equatable`, `ExpressibleByArrayLiteral`, `OptionSet`, `RawRepresentable`, `Sendable`, `SendableMetatype`, `SetAlgebra`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting modifier keys

- `all`
- `capsLock`
- `command`
- `control`
- `numericPad`
- `option`
- `shift`

### Creating a set of options

- `init(rawValue:)`
- `rawValue`

### Deprecated modifiers

- `function`

## See Also

- `keyboardShortcut(_:)`
- `keyboardShortcut(_:modifiers:)`
- `keyboardShortcut(_:modifiers:localization:)`
- `keyboardShortcut`
- `KeyboardShortcut`
- `KeyEquivalent`
