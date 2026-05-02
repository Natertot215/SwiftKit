---
url: https://developer.apple.com/documentation/swiftui/exclusivegesture
framework: SwiftUI
category: Gestures
title: ExclusiveGesture
kind: struct
captured: 2026-05-02
---

# ExclusiveGesture

A gesture that consists of two gestures where only one of them can succeed.

## Declaration

```swift
@frozen struct ExclusiveGesture<First, Second> where First : Gesture, Second : Gesture
```

### Overview

The `ExclusiveGesture` gives precedence to its first gesture.





## Relationships

**Conforms To**: `Gesture`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating the gesture

- `init(_:_:)`
- `first`
- `second`

### Supporting types

- `ExclusiveGesture.Value`

## See Also

- `Composing SwiftUI gestures`
- `simultaneousGesture(_:including:)`
- `simultaneousGesture(_:isEnabled:)`
- `simultaneousGesture(_:name:isEnabled:)`
- `SequenceGesture`
- `SimultaneousGesture`
