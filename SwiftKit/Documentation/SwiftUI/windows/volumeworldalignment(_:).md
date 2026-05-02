---
url: https://developer.apple.com/documentation/swiftui/scene/volumeworldalignment(_:)
framework: SwiftUI
category: Windows
title: volumeWorldAlignment(_:)
kind: method
captured: 2026-05-02
---

# volumeWorldAlignment(_:)

Specifies how a volume should be aligned when moved in the world.

## Declaration

```swift
nonisolated func volumeWorldAlignment(_ behavior: WorldAlignmentBehavior) -> some Scene

```

### Discussion

For example, you can create a volume that remains parallel to the floor even when lifted up high above eye level by applying a `WorldAlignmentBehavior/gravityAligned` alignment to the scene:

```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.volumetric)
        .volumeWorldAlignment(.gravityAligned)
    }
}
```

The default value if you don’t apply the modifier is `WorldAlignmentBehavior/automatic`. With that strategy, volumes will tilt themselves so the front remains fully visible while being repositioned.







## Availability

- visionOS 2.0



## See Also

- `onVolumeViewpointChange(updateStrategy:initial:_:)`
- `supportedVolumeViewpoints(_:)`
- `VolumeViewpointUpdateStrategy`
- `Viewpoint3D`
- `SquareAzimuth`
- `WorldAlignmentBehavior`
- `WorldScalingBehavior`
- `defaultWorldScaling(_:)`
- `WorldScalingCompensation`
- `worldTrackingLimitations`
- `WorldTrackingLimitation`
- `SurfaceSnappingInfo`
