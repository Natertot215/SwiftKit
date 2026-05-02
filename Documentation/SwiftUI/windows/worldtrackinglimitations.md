---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/worldtrackinglimitations
framework: SwiftUI
category: Windows
title: worldTrackingLimitations
kind: property
captured: 2026-05-02
---

# worldTrackingLimitations

The current limitations of the device tracking the user’s surroundings.

## Declaration

```swift
var worldTrackingLimitations: Set<WorldTrackingLimitation> { get set }
```

### Discussion

Read this environment value from within a view to obtain the current limitations of the device tracking the user’s surroundings. The device’s capabilities may be limited due to physical circumstances such as the lighting. If any of the limitations occur due to changing circumstances, the set is updated accordingly. For example, the following `Text` view automatically updates when the world tracking limitations change:

```swift
@Environment(\.worldTrackingLimitations)
private var worldTrackingLimitations

var body: some View {
    Text("Can track translation?" + worldTrackingLimitations
        .contains(.translation) ? "No" : "Yes")
}
```

When the device’s world tracking capabilities are limited, don’t prevent the user from experiencing your app entirely. Instead, try to adapt the user experience to the current circumstances in order to provide a meaningful experience at all times.







## Availability

- macOS 26.0
- visionOS 2.0



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
- `WorldTrackingLimitation`
- `SurfaceSnappingInfo`
