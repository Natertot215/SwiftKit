---
url: https://developer.apple.com/documentation/swiftui/worldscalingcompensation
framework: SwiftUI
category: Windows
title: WorldScalingCompensation
kind: struct
captured: 2026-05-02
---

# WorldScalingCompensation

Indicates whether returned metrics will take dynamic scaling into account.

## Declaration

```swift
struct WorldScalingCompensation
```

### Overview

On visionOS, a window scene or a volume scene with the `Scene/defaultWorldScaling(_:)` modifier may scale dynamically when the user repositions it. In those cases, the metrics returned by a `PhysicalMetric` or `PhysicalMetricsConverter` value may or may not correspond to the units of a `RealityView`.

World scale compensation lets you specify if this scaling is taken into account. If the values are `WorldScalingCompensation/unscaled`, they will correspond to the physical metrics of the user’s surroundings, regardless of dynamic scale. If `WorldScalingCompensation/scaled`, they will be scaled appropriately for the scene, which means they will match the default coordinate system of a `RealityView` in that scene.





## Relationships

**Conforms To**: `Equatable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- visionOS 2.0

## Topics

### Type Properties

- `scaled`
- `unscaled`

## See Also

- `onVolumeViewpointChange(updateStrategy:initial:_:)`
- `supportedVolumeViewpoints(_:)`
- `VolumeViewpointUpdateStrategy`
- `Viewpoint3D`
- `SquareAzimuth`
- `WorldAlignmentBehavior`
- `volumeWorldAlignment(_:)`
- `WorldScalingBehavior`
- `defaultWorldScaling(_:)`
- `worldTrackingLimitations`
- `WorldTrackingLimitation`
- `SurfaceSnappingInfo`
