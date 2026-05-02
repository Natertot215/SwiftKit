---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/surfacesnappinginfo
framework: SwiftUI
category: Environment values
title: surfaceSnappingInfo
kind: property
captured: 2026-05-02
---

# surfaceSnappingInfo

Provides information about the current snap state of the scene.

## Declaration

```swift
var surfaceSnappingInfo: SurfaceSnappingInfo { get }
```

### Discussion

Use the provided `SurfaceSnappingInfo` from the environment to modify the content of your view

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

This environment value should be accessed inside a view of your app, not at the app or scene level. If you try to access this value at the scene or app level it will always return the default value.

If you would like access to the classification of the surface a scene is snapped to, the user must allow the app to access information about their surroundings. In your app’s `Info.plist` you should set `UIWantsDetailedSurfaceInfo` to `YES` and set `NSWorldSensingUsageDescription` to provide a description of why your app is requesting this information. The description will be displayed to the user when they first snap a scene from your app.







## Availability

- visionOS 26.0
