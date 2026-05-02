---
url: https://developer.apple.com/documentation/swiftui/view/glasseffect(_:in:)
framework: SwiftUI
category: View styles
title: glassEffect(_:in:)
kind: method
captured: 2026-05-02
---

# glassEffect(_:in:)

Applies the Liquid Glass effect to a view.

## Declaration

```swift
nonisolated func glassEffect(_ glass: Glass = .regular, in shape: some Shape = DefaultGlassEffectShape()) -> some View

```

### Discussion

When you use this effect, the system:

- Renders a shape anchored behind a view with the Liquid Glass material.
- Applies the foreground effects of Liquid Glass over a view.

For example, to add this effect to a `Text`:

```swift
Text("Hello, World!")
    .font(.title)
    .padding()
    .glassEffect()
```

SwiftUI uses the `Glass/regular` variant by default along with a `Capsule` shape.

SwiftUI anchors the Liquid Glass to a view’s bounds. For the example above, the material fills the entirety of the `Text` frame, which includes the padding.

You typically use this modifier with a `GlassEffectContainer` to combine multiple Liquid Glass shapes into a single shape that can morph into one another.







## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0
- tvOS 26.0
- watchOS 26.0



## See Also

- `Applying Liquid Glass to custom views`
- `Landmarks: Building an app with Liquid Glass`
- `interactive(_:)`
- `GlassEffectContainer`
- `GlassEffectTransition`
- `GlassButtonStyle`
- `GlassProminentButtonStyle`
- `DefaultGlassEffectShape`
