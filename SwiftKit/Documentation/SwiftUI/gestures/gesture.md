---
url: https://developer.apple.com/documentation/swiftui/gesture
framework: SwiftUI
category: Gestures
title: Gesture
kind: protocol
captured: 2026-05-02
---

# Gesture

An instance that matches a sequence of events to a gesture, and returns a stream of values for each of its states.

## Declaration

```swift
@MainActor @preconcurrency protocol Gesture<Value>
```

### Overview

Create custom gestures by declaring types that conform to the `Gesture` protocol.





## Relationships

**Conforming Types**: `AnyGesture`, `DragGesture`, `ExclusiveGesture`, `GestureStateGesture`, `LongPressGesture`, `MagnificationGesture`, `MagnifyGesture`, `RotateGesture`, `RotateGesture3D`, `RotationGesture`, `SequenceGesture`, `SimultaneousGesture`, `SpatialEventGesture`, `SpatialTapGesture`, `TapGesture`, `WindowDragGesture`

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

- `body`
- `Body`

### Performing the gesture

- `updating(_:body:)`
- `onChanged(_:)`
- `onEnded(_:)`
- `Value`

### Composing gestures

- `simultaneously(with:)`
- `sequenced(before:)`
- `exclusively(before:)`

### Adding modifier keys to a gesture

- `modifiers(_:)`

### Transforming a gesture

- `map(_:)`

### Customizing gesture activation

- `handActivationBehavior(_:)`

### Using a gesture with a RealityKit entity

- `targetedToAnyEntity()`
- `targetedToEntity(_:)`
- `targetedToEntity(where:)`

## See Also

- `highPriorityGesture(_:including:)`
- `highPriorityGesture(_:isEnabled:)`
- `highPriorityGesture(_:name:isEnabled:)`
- `handGestureShortcut(_:isEnabled:)`
- `defersSystemGestures(on:)`
- `AnyGesture`
- `HandActivationBehavior`
- `HandGestureShortcut`
