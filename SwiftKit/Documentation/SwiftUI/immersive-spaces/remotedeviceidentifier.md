---
url: https://developer.apple.com/documentation/swiftui/remotedeviceidentifier
framework: SwiftUI
category: Immersive spaces
title: RemoteDeviceIdentifier
kind: struct
captured: 2026-05-02
---

# RemoteDeviceIdentifier

An opaque type that identifies a remote device displaying scene content in a `RemoteImmersiveSpace`.

## Declaration

```swift
struct RemoteDeviceIdentifier
```

### Overview

Access this from the `EnvironmentValues/remoteDeviceIdentifier` environment property in a remote scene to get the identifier for that scene’s device.

When accessed in a context that is being presented on the local device, this value will be `nil`.

This identifier can also be used to initialize an `ARKitSession` associated with the remote device.

```swift
struct SolarSystem: CompositorContent {
    @Environment(\.remoteDeviceIdentifier) private var deviceID

    var body: some CompositorContent {
        RemoteImmersiveSpace {
            CompositorLayer { layerRenderer in
                // Create an ARSession for the device
                let arSession = ARKitSession(deviceID)

                // Set up and run the Metal render loop.
                let renderThread = Thread {
                    let engine = solar_engine_create(
                        layerRenderer, arSession)
                    solar_engine_render_loop(engine)
                }
                renderThread.name = "Render Thread"
                renderThread.start()
            }
        }
    }
}
```

> **NOTE:** This identifier is not stable across app launches.





## Relationships

**Conforms To**: `Equatable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- macOS 26.0
- visionOS 26.0

## Topics

### Instance Properties

- `cDevice`

## See Also

- `RemoteImmersiveSpace`
