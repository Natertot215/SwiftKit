---
url: https://developer.apple.com/documentation/swiftui/preview(_:traits:body:cameras:)
framework: SwiftUI
category: Previews in Xcode
title: Preview(_:traits:body:cameras:)
kind: macro
captured: 2026-05-01
---

# Preview(_:traits:body:cameras:)

## Declaration

```swift
@freestanding(declaration) macro Preview(
    _ name: String? = nil,
    traits: PreviewTrait<Preview.ViewTraits>...,
    @ViewBuilder body: @escaping @MainActor () -> any View,
    @PreviewCameraBuilder cameras: () -> [PreviewCamera]
)
```

## Abstract

Creates a preview of a SwiftUI view using the specified traits and custom viewpoints.

## Overview

This macro behaves like [`Preview(_:traits:_:body:)`](/documentation/swiftui/preview(_:traits:_:body:)) except that it also enables you to specify one or more [`PreviewCamera`](/documentation/DeveloperToolsSupport/PreviewCamera) instances that define custom, fixed viewpoints from which to view the preview:

```swift
#Preview {
    ContentView()
} cameras: {
    PreviewCamera(from: .bottomLeadingBack, name: "Corner 1")
    PreviewCamera(from: .topTrailingFront, name: "Corner 2")
}
```

If you use one of the preview macros that doesn't include a `cameras` closure, the canvas displays the preview from the front by default. It also provides a camera picker to choose other standard, fixed viewpoints — like the top or the back. When you do specify one or more preview cameras, the canvas adds a submenu to the camera picker that lists the viewpoints you define, like Corner 1 and Corner 2 in the above example. The canvas also displays the preview from the first of these custom viewpoints by default when it loads the preview.

> **Note:** In addition to using fixed camera perspectives, you can also interactively alter the viewpoint of a preview in the canvas using controls like those that Simulator provides.

## Parameters

- **name**: An optional display name for the preview. If you don't specify a name, the canvas labels the preview using the line number where the preview appears in source.

- **traits**: An optional list of [`PreviewTrait`](/documentation/DeveloperToolsSupport/PreviewTrait) instances that customize the appearance of the preview.

- **body**: A [`ViewBuilder`](/documentation/swiftui/viewbuilder) that produces a SwiftUI view to preview. You typically specify one of your app's custom views and optionally any inputs, model data, modifiers, and enclosing views that the custom view needs for normal operation.

- **cameras**: One or more preview cameras that indicate the custom, fixed viewpoints that you want to be able to view the preview from. The first of these replaces the front viewpoint as the default.

## Availability

- **visionOS** 1.0+

## See Also

- [`Preview(_:body:)`](/documentation/swiftui/preview(_:body:))
- [`Preview(_:traits:_:body:)`](/documentation/swiftui/preview(_:traits:_:body:))
