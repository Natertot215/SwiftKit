---
url: https://developer.apple.com/design/human-interface-guidelines/camera-control
framework: HIG
category: Inputs
title: Camera Control
kind: hig-topic
captured: 2026-05-01
---

# Camera Control

## Overview

On iPhone 16 and iPhone 16 Pro models, the Camera Control quickly opens your app's camera experience to capture moments as they happen. When a person lightly presses the Camera Control, the system displays an overlay that extends from the device bezel.

The overlay allows people to quickly adjust controls. A person can view the available controls by lightly double-pressing the Camera Control. After selecting a control, they can slide their finger on the Camera Control to adjust a value to capture their content as they want.

## Anatomy

The Camera Control offers two types of controls for adjusting values or changing between options:

- **Slider** — Provides a range of values to choose from, such as how much contrast to apply to the content.
- **Picker** — Offers discrete options, such as turning a grid on and off in the viewfinder.

In addition to custom controls that you create, the system provides a set of standard controls that you can optionally include in the overlay:

- **Zoom factor control** — Allows adjustment of camera zoom
- **Exposure bias control** — Allows adjustment of exposure

## Best Practices

**Use SF Symbols to represent control functionality.** The system doesn't support custom symbols; instead, pick a symbol from [SF Symbols](https://developer.apple.com/sf-symbols/) that clearly denotes a control's behavior. Examples include:
- `bolt.fill` — Camera flash control
- `camera.filters` — Camera filters control

**Keep names of controls short.** Control labels adhere to Dynamic Type sizes, and longer names may obfuscate the camera's viewfinder.

**Include units or symbols with slider control values to provide context.** Providing descriptive information in the overlay, such as EV, %, or a custom string, helps people understand what the slider controls.

**Define prominent values for a slider control.** Prominent values are ones people choose most frequently, or values that are evenly spaced. Use [`AVCaptureSlider.prominentValues`](https://developer.apple.com/documentation/AVFoundation/AVCaptureSlider/prominentValues-199dz).

**Make space for the overlay in the viewfinder.** The overlay and control labels occupy the screen area adjacent to the Camera Control in both portrait and landscape orientations. Place your UI outside of the overlay areas.

**Minimize distractions in the viewfinder.** Avoid duplicating controls, like sliders and toggles, in your UI and the overlay when the system displays the overlay.

**Enable or disable controls depending on the camera mode.** For example, disable video controls when taking photos.

**Consider how to arrange your controls.** Order commonly used controls toward the middle to allow quick access.

**Allow people to use the Camera Control to launch your experience from anywhere.** Create a locked camera capture extension that lets people configure the Camera Control to launch your app's camera experience from their locked device, the Home Screen, or from within other apps.

## Platform Considerations

*Not supported in iPadOS, macOS, watchOS, tvOS, or visionOS.*

## Related Resources

- [SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols)
- [Controls](https://developer.apple.com/design/human-interface-guidelines/controls)

## Developer Documentation

- [Enhancing your app experience with the Camera Control](https://developer.apple.com/documentation/AVFoundation/enhancing-your-app-experience-with-the-camera-control) — AVFoundation
- [`AVCaptureControl`](https://developer.apple.com/documentation/AVFoundation/AVCaptureControl) — AVFoundation
- [`LockedCameraCapture`](https://developer.apple.com/documentation/LockedCameraCapture)

## Change Log

| Date | Changes |
|------|---------|
| September 9, 2024 | New page |
