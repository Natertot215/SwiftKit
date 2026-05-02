---
url: https://developer.apple.com/documentation/swiftui/squareazimuth
framework: SwiftUI
category: Windows
title: SquareAzimuth
kind: enum
captured: 2026-05-02
---

# SquareAzimuth

A type describing what direction something is being viewed from along the horizontal plane and snapped to 4 directions.

## Declaration

```swift
@frozen enum SquareAzimuth
```







## Relationships

**Conforms To**: `BitwiseCopyable`, `CaseIterable`, `Copyable`, `Equatable`, `Escapable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- visionOS 2.0

## Topics

### Structures

- `SquareAzimuth.Set`

### Enumeration Cases

- `SquareAzimuth.back`
- `SquareAzimuth.front`
- `SquareAzimuth.left`
- `SquareAzimuth.right`

### Initializers

- `init(closestToAzimuth:)`

### Instance Properties

- `orientation`

## See Also

- `onVolumeViewpointChange(updateStrategy:initial:_:)`
- `supportedVolumeViewpoints(_:)`
- `VolumeViewpointUpdateStrategy`
- `Viewpoint3D`
- `WorldAlignmentBehavior`
- `volumeWorldAlignment(_:)`
- `WorldScalingBehavior`
- `defaultWorldScaling(_:)`
- `WorldScalingCompensation`
- `worldTrackingLimitations`
- `WorldTrackingLimitation`
- `SurfaceSnappingInfo`
