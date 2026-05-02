---
url: https://developer.apple.com/documentation/swiftui/preview(_:immersionstyle:traits:body:)
framework: SwiftUI
category: Previews in Xcode
title: Preview(_:immersionStyle:traits:body:)
kind: macro
captured: 2026-05-01
---

# Preview(_:immersionStyle:traits:body:)

## Abstract
Creates a preview of a SwiftUI view in an immersive space.

## Declaration
```swift
@freestanding(declaration) macro Preview<Style>(
    _ name: String? = nil,
    immersionStyle: Style,
    traits: PreviewTrait<Preview.ViewTraits>...,
    @ViewBuilder @escaping @MainActor body: () -> any View
) where Style : ImmersionStyle
```

## Parameters

- **name**: An optional display name for the preview. If you don't specify a name, the canvas labels the preview using the line number where the preview appears in source.

- **immersionStyle**: The [`ImmersionStyle`](doc://com.apple.SwiftUI/documentation/SwiftUI/ImmersionStyle) to use for the preview. Use this input to display the view as if it appears in an immersive space that has the specified style.

- **traits**: An optional list of [`PreviewTrait`](doc://com.apple.documentation/documentation/DeveloperToolsSupport/PreviewTrait) instances that customize the appearance of the preview.

- **body**: A [`ViewBuilder`](doc://com.apple.SwiftUI/documentation/SwiftUI/ViewBuilder) that produces a SwiftUI view to preview. You typically specify one of your app's custom views and optionally any inputs, model data, modifiers, and enclosing views that the custom view needs for normal operation.

## Overview

This preview macro behaves like [`Preview(_:traits:_:body:)`](doc://com.apple.SwiftUI/documentation/SwiftUI/Preview(_:traits:_:body:)), except that it also enables you to define a scene context for the view. Specifically, it places the view in an immersive space with the specified immersion style, like the [`mixed`](doc://com.apple.SwiftUI/documentation/SwiftUI/ImmersionStyle/mixed) style:

```swift
#Preview("Mixed immersive space", immersionStyle: .mixed) {
   ContentView()
}
```

Use this preview macro when the view needs scene context to behave as it would during normal operation of your app.

Other preview macros provide different customization options. For example, if you want to see how the view appears in a window rather than an immersive space, you can use [`Preview(_:windowStyle:traits:body:)`](doc://com.apple.SwiftUI/documentation/SwiftUI/Preview(_:windowStyle:traits:body:)). If you want to add custom, fixed viewpoints to an immersive space preview, use [`Preview(_:immersionStyle:traits:body:cameras:)`](doc://com.apple.SwiftUI/documentation/SwiftUI/Preview(_:immersionStyle:traits:body:cameras:)).

## Availability
- **visionOS** 1.0+

## See Also
- [`Preview(_:immersionStyle:traits:body:cameras:)`](doc://com.apple.SwiftUI/documentation/SwiftUI/Preview(_:immersionStyle:traits:body:cameras:))
- [`Preview(_:windowStyle:traits:body:)`](doc://com.apple.SwiftUI/documentation/SwiftUI/Preview(_:windowStyle:traits:body:))
- [`Preview(_:windowStyle:traits:body:cameras:)`](doc://com.apple.SwiftUI/documentation/SwiftUI/Preview(_:windowStyle:traits:body:cameras:))
