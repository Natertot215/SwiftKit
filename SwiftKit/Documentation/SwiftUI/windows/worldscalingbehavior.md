---
url: https://developer.apple.com/documentation/swiftui/worldscalingbehavior
framework: SwiftUI
category: Windows
title: WorldScalingBehavior
kind: struct
captured: 2026-05-02
---

# WorldScalingBehavior

Specifies the scaling behavior a window should have within the world.

## Declaration

```swift
struct WorldScalingBehavior
```

### Overview

By default, a regular `WindowGroup` uses a scaling behavior of `WorldScalingBehavior/dynamic`, and a window with `WindowStyle/volumetric` has a fixed scale.

Dynamic scale means the window will scale larger as it moves further away, maintaining the same angular size. Fixed scale means the window will keep its physical size in the world.

For further information, see `doc://com.apple.documentation/design/Human-Interface-Guidelines/spatial-layout#Scale` in the Human Interface Guidelines.





## Relationships

**Conforms To**: `Equatable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- visionOS 2.0

## Topics

### Type Properties

- `automatic`
- `dynamic`

## See Also

- `onVolumeViewpointChange(updateStrategy:initial:_:)`
- `supportedVolumeViewpoints(_:)`
- `VolumeViewpointUpdateStrategy`
- `Viewpoint3D`
- `SquareAzimuth`
- `WorldAlignmentBehavior`
- `volumeWorldAlignment(_:)`
- `defaultWorldScaling(_:)`
- `WorldScalingCompensation`
- `worldTrackingLimitations`
- `WorldTrackingLimitation`
- `SurfaceSnappingInfo`
