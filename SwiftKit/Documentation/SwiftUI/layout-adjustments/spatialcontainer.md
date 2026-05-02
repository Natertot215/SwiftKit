---
url: https://developer.apple.com/documentation/swiftui/spatialcontainer
framework: SwiftUI
category: Layout adjustments
title: SpatialContainer
kind: struct
captured: 2026-05-02
---

# SpatialContainer

A layout container that aligns overlapping content in 3D space.

## Declaration

```swift
@frozen struct SpatialContainer
```

### Overview

The container will take the max size of each dimension of each of its children, aligning its children based on the `alignment`.





## Relationships

**Conforms To**: `Animatable`, `Copyable`, `Escapable`, `Layout`, `Sendable`, `SendableMetatype`

## Availability

- visionOS 26.0

## Topics

### Initializers

- `init(alignment:)`

## See Also

- `Aligning views within a stack`
- `Aligning views across stacks`
- `alignmentGuide(_:computeValue:)`
- `Alignment`
- `HorizontalAlignment`
- `VerticalAlignment`
- `DepthAlignment`
- `AlignmentID`
- `ViewDimensions`
- `ViewDimensions3D`
