---
url: https://developer.apple.com/documentation/swiftui/spatialeventcollection
framework: SwiftUI
category: Gestures
title: SpatialEventCollection
kind: struct
captured: 2026-05-02
---

# SpatialEventCollection

A collection of spatial input events that target a specific view.

## Declaration

```swift
struct SpatialEventCollection
```

### Overview

You receive a structure of this type as an input to the `Gesture/onChanged(_:)` or `Gesture/onEnded(_:)` method of a `SpatialEventGesture`. The structure contains a collection of `SpatialEventCollection/Event` values that correspond to ongoing input events. You can look up a specific event in the collection by its `SpatialEventCollection/Event/id-swift.property` value or iterate over all events in the collection to apply logic depending on the event’s state.





## Relationships

**Conforms To**: `Collection`, `Copyable`, `Equatable`, `Escapable`, `Sequence`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- visionOS 1.0
- watchOS 11.0

## Topics

### Accessing the collection’s events

- `SpatialEventCollection.Event`
- `subscript(_:)`

### Iterating over events in the collection

- `makeIterator()`
- `SpatialEventCollection.Iterator`

## See Also

- `SpatialEventGesture`
- `Chirality`
