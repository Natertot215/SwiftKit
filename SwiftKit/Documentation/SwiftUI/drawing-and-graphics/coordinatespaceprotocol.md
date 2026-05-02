---
url: https://developer.apple.com/documentation/swiftui/coordinatespaceprotocol
framework: SwiftUI
category: Drawing and graphics
title: CoordinateSpaceProtocol
kind: protocol
captured: 2026-05-02
---

# CoordinateSpaceProtocol

A frame of reference within the layout system.

## Declaration

```swift
protocol CoordinateSpaceProtocol
```

### Overview

All geometric properties of a view, including size, position, and transform, are defined within the local coordinate space of the view’s parent. These values can be converted into other coordinate spaces by passing types conforming to this protocol into functions such as `GeometryProxy.frame(in:)`.

For example, a named coordinate space allows you to convert the frame of a view into the local coordinate space of an ancestor view by defining a named coordinate space using the `coordinateSpace(_:)` modifier, then passing that same named coordinate space into the `frame(in:)` function.

```swift
VStack {
    GeometryReader { geometryProxy in
        let distanceFromTop = geometryProxy.frame(in: "container").origin.y
        Text("This view is \(distanceFromTop) points from the top of the VStack")
    }
    .padding()
}
.coordinateSpace(.named("container"))
```

You don’t typically create types conforming to this protocol yourself. Instead, use the system-provided `.global`, `.local`, and `.named(_:)` implementations.





## Relationships

**Conforming Types**: `GlobalCoordinateSpace`, `LocalCoordinateSpace`, `NamedCoordinateSpace`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Getting built-in coordinate spaces

- `immersiveSpace`
- `global`
- `local`
- `named(_:)`
- `scrollView`
- `scrollView(axis:)`

### Getting the resolved coordinate space

- `coordinateSpace`

### Supporting types

- `GlobalCoordinateSpace`
- `LocalCoordinateSpace`
- `NamedCoordinateSpace`

## See Also

- `GeometryReader`
- `GeometryReader3D`
- `GeometryProxy`
- `GeometryProxy3D`
- `coordinateSpace(_:)`
- `CoordinateSpace`
- `PhysicalMetric`
- `PhysicalMetricsConverter`
