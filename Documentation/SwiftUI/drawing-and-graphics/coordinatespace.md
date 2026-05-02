---
url: https://developer.apple.com/documentation/swiftui/coordinatespace
framework: SwiftUI
category: Drawing and graphics
title: CoordinateSpace
kind: enum
captured: 2026-05-02
---

# CoordinateSpace

A resolved coordinate space created by the coordinate space protocol.

## Declaration

```swift
enum CoordinateSpace
```

### Overview

You don’t typically use `CoordinateSpace` directly. Instead, use the static properties and functions of `CoordinateSpaceProtocol` such as `.global`, `.local`, and `.named(_:)`.





## Relationships

**Conforms To**: `Copyable`, `Equatable`, `Escapable`, `Hashable`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting coordinate spaces

- `CoordinateSpace.global`
- `CoordinateSpace.local`
- `CoordinateSpace.named(_:)`

### Testing a space

- `isGlobal`
- `isLocal`

## See Also

- `GeometryReader`
- `GeometryReader3D`
- `GeometryProxy`
- `GeometryProxy3D`
- `coordinateSpace(_:)`
- `CoordinateSpaceProtocol`
- `PhysicalMetric`
- `PhysicalMetricsConverter`
