---
url: https://developer.apple.com/documentation/swiftui/view/backgroundstyle(_:)
framework: SwiftUI
category: Drawing and graphics
title: backgroundStyle(_:)
kind: method
captured: 2026-05-02
---

# backgroundStyle(_:)

Sets the specified style to render backgrounds within the view.

## Declaration

```swift
nonisolated func backgroundStyle<S>(_ style: S) -> some View where S : ShapeStyle

```

### Discussion

The following example uses this modifier to set the `EnvironmentValues/backgroundStyle` environment value to a `ShapeStyle/blue` color that includes a subtle `Color/gradient`. SwiftUI fills the `Circle` shape that acts as a background element with this style:

```swift
Image(systemName: "swift")
    .padding()
    .background(in: Circle())
    .backgroundStyle(.blue.gradient)
```

To restore the default background style, set the `EnvironmentValues/backgroundStyle` environment value to `nil` using the `View/environment(_:_:)` modifer:

```swift
.environment(\.backgroundStyle, nil)
```







## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `border(_:width:)`
- `foregroundStyle(_:)`
- `foregroundStyle(_:_:)`
- `foregroundStyle(_:_:_:)`
- `backgroundStyle`
- `ShapeStyle`
- `AnyShapeStyle`
- `Gradient`
- `MeshGradient`
- `AnyGradient`
- `ShadowStyle`
- `Glass`
