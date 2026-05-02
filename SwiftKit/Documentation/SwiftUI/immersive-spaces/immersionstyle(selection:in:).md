---
url: https://developer.apple.com/documentation/swiftui/scene/immersionstyle(selection:in:)
framework: SwiftUI
category: Immersive spaces
title: immersionStyle(selection:in:)
kind: method
captured: 2026-05-02
---

# immersionStyle(selection:in:)

Sets the style for an immersive space.

## Declaration

```swift
nonisolated func immersionStyle(selection: Binding<any ImmersionStyle>, in styles: any ImmersionStyle...) -> some Scene

```

### Return Value

A scene that uses one of the specified `styles`.

### Discussion

Use this modifier to configure the appearance and behavior of an `ImmersiveSpace`. Specify a style that conforms to the `ImmersionStyle` protocol, like `ImmersionStyle/mixed` or `ImmersionStyle/full`. For example, the following app defines a solar system scene that uses full immersion:

```swift
@main
struct SolarSystemApp: App {
    @State private var style: ImmersionStyle = .full

    var body: some Scene {
        ImmersiveSpace {
            SolarSystem()
        }
        .immersionStyle(selection: $style, in: .full)
    }
}
```

## Parameters

- **selection**: A `Binding` to the style that the space uses. You can change this value to change the scene’s style even after you present the immersive space. Even though you provide a binding, the value changes only if you change it.
- **styles**: The list of styles that the `selection` input can have. Include any styles that you plan to use during the lifetime of the scene.





## Availability

- macOS 26.0
- visionOS 1.0



## See Also

- `ImmersiveSpace`
- `ImmersiveSpaceContentBuilder`
- `ImmersionStyle`
- `immersiveSpaceDisplacement`
- `ImmersiveEnvironmentBehavior`
- `ProgressiveImmersionAspectRatio`
