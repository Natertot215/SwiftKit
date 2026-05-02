---
url: https://developer.apple.com/documentation/swiftui/view/oncameracaptureevent(isenabled:primaryaction:secondaryaction:)
framework: SwiftUI
category: Input events
title: onCameraCaptureEvent(isEnabled:primaryAction:secondaryAction:)
kind: method
captured: 2026-05-02
---

# onCameraCaptureEvent(isEnabled:primaryAction:secondaryAction:)

Used to register actions triggered by system capture events.

## Declaration

```swift
@MainActor @preconcurrency func onCameraCaptureEvent(isEnabled: Bool = true, primaryAction: @escaping (AVCaptureEvent) -> Void, secondaryAction: @escaping (AVCaptureEvent) -> Void) -> some View

```

### Discussion

Events may or may not be sent to applications based on the current system state. Backgrounded applications will not receive events, additionally events will only be sent to applications that are actively using the camera.

This API is for media capture use cases only.

## Parameters

- **isEnabled**: A boolean value indicating whether capture events trigger the provided actions or not. Set this value to `false` when your application cannot or will not respond to the action callbacks to avoid non-interactive buttons or UI elements.
- **primaryAction**: An event handler called when a primary capture event is triggered.
- **secondaryAction**: An event handler called when a secondary capture event is triggered.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0



## See Also

- `onCameraCaptureEvent(isEnabled:action:)`
