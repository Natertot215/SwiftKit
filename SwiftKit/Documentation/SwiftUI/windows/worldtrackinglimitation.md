---
url: https://developer.apple.com/documentation/swiftui/worldtrackinglimitation
framework: SwiftUI
category: Windows
title: WorldTrackingLimitation
kind: struct
captured: 2026-05-02
---

# WorldTrackingLimitation

A structure to represent limitations of tracking the user’s surroundings.

## Declaration

```swift
struct WorldTrackingLimitation
```

### Overview

You receive a set of world tracking limitations when you read the `EnvironmentValues/worldTrackingLimitations` environment value. The value tells you which limitations the device currently is facing. If any of the limitations occur due to changing circumstances, e.g., the lighting, the set is updated accordingly. For example, the following `Text` view automatically updates when the world tracking limitations change:

```swift
@Environment(\.worldTrackingLimitations)
private var worldTrackingLimitations

var body: some View {
    Text("Can track translation?" + worldTrackingLimitations
        .contains(.translation) ? "No" : "Yes")
}
```





## Relationships

**Conforms To**: `Equatable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- macOS 26.0
- visionOS 2.0

## Topics

### Type Properties

- `orientation`
- `translation`

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
- `WorldScalingCompensation`
- `worldTrackingLimitations`
- `SurfaceSnappingInfo`
