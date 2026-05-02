---
url: https://developer.apple.com/documentation/swiftui/gesturestategesture
framework: SwiftUI
category: Gestures
title: GestureStateGesture
kind: struct
captured: 2026-05-02
---

# GestureStateGesture

A gesture that updates the state provided by a gesture’s updating callback.

## Declaration

```swift
@frozen struct GestureStateGesture<Base, State> where Base : Gesture
```

### Overview

A gesture’s `Gesture/updating(_:body:)` callback returns a `GestureStateGesture` instance for updating a transient state property that’s annotated with the `GestureState` property wrapper.





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

### Creating an in-progress gesture

- `init(base:state:body:)`
- `base`
- `state`

### Supporting types

- `body`

## See Also

- `GestureState`
