---
url: https://developer.apple.com/documentation/swiftui/preview(_:traits:_:body:)
framework: SwiftUI
category: Previews in Xcode
title: Preview(_:traits:_:body:)
kind: macro
captured: 2026-05-02
---

# Preview(_:traits:_:body:)

Creates a preview of a SwiftUI view using the specified traits.

## Declaration

```swift
@freestanding(declaration) macro Preview(_ name: String? = nil, traits: PreviewTrait<Preview.ViewTraits>, _ additionalTraits: PreviewTrait<Preview.ViewTraits>..., @ViewBuilder body: @escaping @MainActor () -> any View)
```

### Overview

This macro behaves like `Preview(_:body:)` except that it also enables you to customize the appearance of the preview by adding one or more traits, which are instances of `PreviewTrait`. For example, you can display a preview at a fixed size using the `PreviewTrait/fixedLayout(width:height:)` trait:

```swift
#Preview(
    "Content",
    traits: .fixedLayout(width: 100, height: 100)
) {
    ContentView()
}
```

The macro ignores traits that don’t apply to the current context. For example, the `PreviewTrait/portrait` trait has no impact on a visionOS preview.

Other preview macros provide different customization options. For example, if you want to specify a custom viewpoint for the preview, use `Preview(_:traits:body:cameras:)`.

## Parameters

- **name**: An optional display name for the preview. If you don’t specify a name, the canvas labels the preview using the line number where the preview appears in source.
- **traits**: A `PreviewTrait` instance that customizes the appearance of the preview.
- **additionalTraits**: Optional additional traits that further customize the preview.
- **body**: A `ViewBuilder` that produces a SwiftUI view to preview. You typically specify one of your app’s custom views and optionally any inputs, model data, modifiers, and enclosing views that the custom view needs for normal operation.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `Preview(_:body:)`
- `Preview(_:traits:body:cameras:)`
