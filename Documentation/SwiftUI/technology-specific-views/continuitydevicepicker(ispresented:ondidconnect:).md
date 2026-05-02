---
url: https://developer.apple.com/documentation/swiftui/view/continuitydevicepicker(ispresented:ondidconnect:)
framework: SwiftUI
category: Technology-specific views
title: continuityDevicePicker(isPresented:onDidConnect:)
kind: method
captured: 2026-05-02
---

# continuityDevicePicker(isPresented:onDidConnect:)

A `continuityDevicePicker` should be used to discover and connect nearby continuity device through a button interface or other form of activation. On tvOS, this presents a fullscreen continuity device picker experience when selected. The modal view covers as much the screen of `self` as possible when a given condition is true.

## Declaration

```swift
@MainActor @preconcurrency func continuityDevicePicker(isPresented: Binding<Bool>, onDidConnect: ((AVContinuityDevice?) -> Void)? = nil) -> some View

```



## Parameters

- **isPresented**: A `Binding` to whether the modal view is presented.
- **onDidConnect**: A closure executed when the picker successfully, connects AVContinuityDevice or nil if cancelled by a user.





## Availability

- tvOS 17.0



## See Also

- `CameraView`
- `NowPlayingView`
- `VideoPlayer`
- `cameraAnchor(isActive:)`
