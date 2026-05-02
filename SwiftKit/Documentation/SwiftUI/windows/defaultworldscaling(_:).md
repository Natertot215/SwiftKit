---
url: https://developer.apple.com/documentation/swiftui/scene/defaultworldscaling(_:)
framework: SwiftUI
category: Windows
title: defaultWorldScaling(_:)
kind: method
captured: 2026-05-02
---

# defaultWorldScaling(_:)

Specify the world scaling behavior for the window.

## Declaration

```swift
nonisolated func defaultWorldScaling(_ scaling: WorldScalingBehavior) -> some Scene

```

### Discussion

By default, regular windows increase their physical size as they move further away, ensuring they remain at the same angular size. This preserves legibility and ease of use for text and controls. Volumes render with a fixed physical size, because they are most commonly used for 3D content which is meant to behave with greater physical accuracy.

This modifier overrides the physical scaling behavior for volumes, so they scale like windows while still maintaining other volumetric behaviors.

This modifier has no effect on immersive spaces or windows without a window style of `WindowStyle/volumetric`.

```swift
@main
struct SampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.volumetric)
        .defaultWorldScaling(.dynamic)
    }
}
```

For further information, see `doc://com.apple.documentation/design/Human-Interface-Guidelines/spatial-layout#Scale` in the Human Interface Guidelines.







## Availability

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
- `WorldScalingCompensation`
- `worldTrackingLimitations`
- `WorldTrackingLimitation`
- `SurfaceSnappingInfo`
