---
url: https://developer.apple.com/documentation/swiftui/sequencegesture
framework: SwiftUI
category: Gestures
title: SequenceGesture
kind: struct
captured: 2026-05-02
---

# SequenceGesture

A gesture that’s a sequence of two gestures.

## Declaration

```swift
@frozen struct SequenceGesture<First, Second> where First : Gesture, Second : Gesture
```

### Overview

Read `Composing-SwiftUI-Gestures` to learn how you can create a sequence of two gestures.





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

- `SequenceGesture.Value`

## See Also

- `Composing SwiftUI gestures`
- `simultaneousGesture(_:including:)`
- `simultaneousGesture(_:isEnabled:)`
- `simultaneousGesture(_:name:isEnabled:)`
- `SimultaneousGesture`
- `ExclusiveGesture`
