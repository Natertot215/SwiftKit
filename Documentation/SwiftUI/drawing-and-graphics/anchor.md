---
url: https://developer.apple.com/documentation/swiftui/anchor
framework: SwiftUI
category: Drawing and graphics
title: Anchor
kind: struct
captured: 2026-05-02
---

# Anchor

An opaque value derived from an anchor source and a particular view.

## Declaration

```swift
@frozen struct Anchor<Value>
```

### Overview

You can convert the anchor to a `Value` in the coordinate space of a target view by using a `GeometryProxy` to specify the target view.





## Relationships

**Conforms To**: `CoordinateSpaceValue3D`, `Copyable`, `Equatable`, `Escapable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting the anchor’s source

- `Anchor.Source`

## See Also

- `Axis`
- `Angle`
- `UnitPoint`
- `UnitPoint3D`
- `DepthAlignmentID`
- `Alignment3D`
- `GeometryProxyCoordinateSpace3D`
