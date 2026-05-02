---
url: https://developer.apple.com/documentation/swiftui/worldalignmentbehavior
framework: SwiftUI
category: Windows
title: WorldAlignmentBehavior
kind: struct
captured: 2026-05-02
---

# WorldAlignmentBehavior

A type representing the world alignment behavior for a scene.

## Declaration

```swift
struct WorldAlignmentBehavior
```

### Overview

A value of this type can be provided to the `Scene/volumeWorldAlignment(_:)` scene modifier to control the world alignment volumes should maintain as they are repositioned. The default value is `WorldAlignmentBehavior/automatic`.





## Relationships

**Conforms To**: `Equatable`, `Sendable`, `SendableMetatype`

## Availability

- visionOS 2.0

## Topics

### Type Properties

- `adaptive`
- `automatic`
- `gravityAligned`

## See Also

- `onVolumeViewpointChange(updateStrategy:initial:_:)`
- `supportedVolumeViewpoints(_:)`
- `VolumeViewpointUpdateStrategy`
- `Viewpoint3D`
- `SquareAzimuth`
- `volumeWorldAlignment(_:)`
- `WorldScalingBehavior`
- `defaultWorldScaling(_:)`
- `WorldScalingCompensation`
- `worldTrackingLimitations`
- `WorldTrackingLimitation`
- `SurfaceSnappingInfo`
