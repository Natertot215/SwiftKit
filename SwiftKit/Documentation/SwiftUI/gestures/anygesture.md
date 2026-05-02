---
url: https://developer.apple.com/documentation/swiftui/anygesture
framework: SwiftUI
category: Gestures
title: AnyGesture
kind: struct
captured: 2026-05-02
---

# AnyGesture

A type-erased gesture.

## Declaration

```swift
@frozen struct AnyGesture<Value>
```







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

### Implementing a custom gesture

- `init(_:)`

## See Also

- `highPriorityGesture(_:including:)`
- `highPriorityGesture(_:isEnabled:)`
- `highPriorityGesture(_:name:isEnabled:)`
- `handGestureShortcut(_:isEnabled:)`
- `defersSystemGestures(on:)`
- `Gesture`
- `HandActivationBehavior`
- `HandGestureShortcut`
