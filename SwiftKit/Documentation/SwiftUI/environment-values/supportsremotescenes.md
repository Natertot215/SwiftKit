---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/supportsremotescenes
framework: SwiftUI
category: Environment values
title: supportsRemoteScenes
kind: property
captured: 2026-05-02
---

# supportsRemoteScenes

Indicates if the current device supports presenting a `RemoteImmersiveSpace` on a remote device.

## Declaration

```swift
var supportsRemoteScenes: Bool { get }
```

### Discussion

Use this to provide affordances for displaying your app’s content on a remote device.

```swift
struct NewSolarSystemImmersiveSpaceButton: View {
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.supportsRemoteScenes) private var supportsRemoteScenes

    var body: some View {
        Button("Present Solar System") {
            Task {
                await openImmersiveSpace(id: "solarSystem")
            }
        }
        .disabled(!supportsRemoteScenes)
        .help(!supportsRemoteScenes
            ? "Presenting remote scenes is not supported on this device."
            : "")
    }
}
```







## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0
- tvOS 26.0
- visionOS 26.0
- watchOS 26.0
