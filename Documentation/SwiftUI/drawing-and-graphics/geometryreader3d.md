---
url: https://developer.apple.com/documentation/swiftui/geometryreader3d
framework: SwiftUI
category: Drawing and graphics
title: GeometryReader3D
kind: struct
captured: 2026-05-02
---

# GeometryReader3D

A container view that defines its content as a function of its own size and coordinate space.

## Declaration

```swift
@frozen struct GeometryReader3D<Content> where Content : View
```

### Overview

This view returns a flexible preferred size to its own container view.

This container differs from `GeometryReader` in that it also reads available depth, and thus also returns a flexible preferred depth to its parent layout. Use the 3D version only in situations where you need to read depth, because it affects depth layout when used in a container like a `ZStack`.





## Relationships

**Conforms To**: `View`

## Availability

- visionOS 1.0

## Topics

### Creating a geometry reader

- `init(content:)`
- `content`

## See Also

- `GeometryReader`
- `GeometryProxy`
- `GeometryProxy3D`
- `coordinateSpace(_:)`
- `CoordinateSpace`
- `CoordinateSpaceProtocol`
- `PhysicalMetric`
- `PhysicalMetricsConverter`
