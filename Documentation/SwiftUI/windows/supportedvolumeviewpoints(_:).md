---
url: https://developer.apple.com/documentation/swiftui/view/supportedvolumeviewpoints(_:)
framework: SwiftUI
category: Windows
title: supportedVolumeViewpoints(_:)
kind: method
captured: 2026-05-02
---

# supportedVolumeViewpoints(_:)

Specifies which viewpoints are supported for the window bar and ornaments in a volume.

## Declaration

```swift
nonisolated func supportedVolumeViewpoints(_ viewpoints: SquareAzimuth.Set) -> some View

```

### Discussion

This defaults to all viewpoints and determines which viewpoints the window bar and ornaments will ‘follow’ the user to as they move around the volume.







## Availability

- visionOS 2.0



## See Also

- `onVolumeViewpointChange(updateStrategy:initial:_:)`
- `VolumeViewpointUpdateStrategy`
- `Viewpoint3D`
- `SquareAzimuth`
- `WorldAlignmentBehavior`
- `volumeWorldAlignment(_:)`
- `WorldScalingBehavior`
- `defaultWorldScaling(_:)`
- `WorldScalingCompensation`
- `worldTrackingLimitations`
- `WorldTrackingLimitation`
- `SurfaceSnappingInfo`
