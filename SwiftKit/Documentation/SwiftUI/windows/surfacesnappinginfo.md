---
url: https://developer.apple.com/documentation/swiftui/surfacesnappinginfo
framework: SwiftUI
category: Windows
title: SurfaceSnappingInfo
kind: struct
captured: 2026-05-02
---

# SurfaceSnappingInfo

A type representing information about the window scenes snap state.

## Declaration

```swift
struct SurfaceSnappingInfo
```

### Overview

Use the provided `SurfaceSnappingInfo` to modify the contents of your view.

```swift
struct LightFixtureView: View {
    @Environment(\.surfaceSnappingInfo)
    var snappingInfo: SurfaceSnappingInfo

    var body: some View {
        if snappingInfo.isSnapped {
            switch SurfaceSnappingInfo.authorizationStatus {
                case .authorized:
                    switch snappingInfo.classification {
                        case .table:
                            LampView()
                        case .floor:
                            FloorLampView()
                        default:
                            DefaultLampView()
                    }
                default:
                    DefaultLampView()
            }
        } else {
            FloatingOrbLampView()
        }
    }
}
```

The bottom of volumes may snap to horizontal surfaces and the back of windows may snap to vertical surfaces.





## Relationships

**Conforms To**: `CustomDebugStringConvertible`, `Equatable`, `Sendable`, `SendableMetatype`

## Availability

- visionOS 26.0

## Topics

### Instance Properties

- `classification`
- `isSnapped`

### Type Properties

- `authorizationStatus`

### Enumerations

- `SurfaceSnappingInfo.AuthorizationStatus`

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
- `WorldTrackingLimitation`
