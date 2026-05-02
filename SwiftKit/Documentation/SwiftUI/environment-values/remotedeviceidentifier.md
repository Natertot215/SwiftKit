---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/remotedeviceidentifier
framework: SwiftUI
category: Environment values
title: remoteDeviceIdentifier
kind: property
captured: 2026-05-02
---

# remoteDeviceIdentifier

An opaque object that identifies the device on which the scene (from which this value is accessed from) is being presented on.

## Declaration

```swift
var remoteDeviceIdentifier: RemoteDeviceIdentifier? { get }
```

### Discussion

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







## Availability

- macOS 26.0
- visionOS 26.0
