---
url: https://developer.apple.com/documentation/swiftui/simultaneousgesture
framework: SwiftUI
category: Gestures
title: SimultaneousGesture
kind: struct
captured: 2026-05-02
---

# SimultaneousGesture

A gesture containing two gestures that can happen at the same time with neither of them preceding the other.

## Declaration

```swift
@frozen struct SimultaneousGesture<First, Second> where First : Gesture, Second : Gesture
```

### Overview

A simultaneous gesture is a container-event handler that evaluates its two child gestures at the same time. Its value is a struct with two optional values, each representing the phases of one of the two gestures.





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

### Getting the gesture’s values

- `SimultaneousGesture.Value`

## See Also

- `Composing SwiftUI gestures`
- `simultaneousGesture(_:including:)`
- `simultaneousGesture(_:isEnabled:)`
- `simultaneousGesture(_:name:isEnabled:)`
- `SequenceGesture`
- `ExclusiveGesture`
