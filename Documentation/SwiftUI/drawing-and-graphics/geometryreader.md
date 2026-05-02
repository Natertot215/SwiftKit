---
url: https://developer.apple.com/documentation/swiftui/geometryreader
framework: SwiftUI
category: Drawing and graphics
title: GeometryReader
kind: struct
captured: 2026-05-02
---

# GeometryReader

A container view that defines its content as a function of its own size and coordinate space.

## Declaration

```swift
@frozen struct GeometryReader<Content> where Content : View
```

### Overview

This view returns a flexible preferred size to its parent layout.





## Relationships

**Conforms To**: `View`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a geometry reader

- `init(content:)`
- `content`

## See Also

- `GeometryReader3D`
- `GeometryProxy`
- `GeometryProxy3D`
- `coordinateSpace(_:)`
- `CoordinateSpace`
- `CoordinateSpaceProtocol`
- `PhysicalMetric`
- `PhysicalMetricsConverter`
