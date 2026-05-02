---
url: https://developer.apple.com/documentation/swiftui/preview(_:windowstyle:traits:body:cameras:)
framework: SwiftUI
category: Previews in Xcode
title: Preview(_:windowStyle:traits:body:cameras:)
kind: macro
captured: 2026-05-02
---

# Preview(_:windowStyle:traits:body:cameras:)

Creates a preview of a SwiftUI view in a window with custom viewpoints.

## Declaration

```swift
@freestanding(declaration) macro Preview<Style>(_ name: String? = nil, windowStyle: Style, traits: PreviewTrait<Preview.ViewTraits>..., @ViewBuilder body: @escaping @MainActor () -> any View, @PreviewCameraBuilder cameras: () -> [PreviewCamera]) where Style : WindowStyle
```

### Overview

This preview macro behaves like `Preview(_:windowStyle:traits:body:)` combined with `Preview(_:traits:body:cameras:)`: it enables you to define a window scene context for the view, and also to define custom, fixed viewpoints for the preview:

```swift
#Preview("Volume", windowStyle: .volumetric) {
   ContentView()
} cameras: {
   PreviewCamera(from: .front)
   PreviewCamera(from: .top, zoom: 2)
   PreviewCamera(from: .leading, zoom: 0.5, name: "close up")
}
```

See those other preview macros for more information about using scenes and cameras in your preview. If you want to preview in an immersive space rather than a window, use `Preview(_:immersionStyle:traits:body:cameras:)`.

## Parameters

- **name**: An optional display name for the preview. If you don’t specify a name, the canvas labels the preview using the line number where the preview appears in source.
- **windowStyle**: The `WindowStyle` to use for the preview. Use this input to display the view as if it appears in a window that has the specified style.
- **traits**: An optional list of `PreviewTrait` instances that customize the appearance of the preview.
- **body**: A `ViewBuilder` that produces a SwiftUI view to preview. You typically specify one of your app’s custom views and optionally any inputs, model data, modifiers, and enclosing views that the custom view needs for normal operation.
- **cameras**: One or more preview cameras that indicate the custom, fixed viewpoints that you want to be able to view the preview from. The first of these replaces the front viewpoint as the default.





## Availability

- visionOS 1.0



## See Also

- `Preview(_:immersionStyle:traits:body:)`
- `Preview(_:immersionStyle:traits:body:cameras:)`
- `Preview(_:windowStyle:traits:body:)`
