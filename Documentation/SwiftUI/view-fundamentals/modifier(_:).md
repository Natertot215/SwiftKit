---
url: https://developer.apple.com/documentation/swiftui/view/modifier(_:)
framework: SwiftUI
category: View fundamentals
title: modifier(_:)
kind: method
captured: 2026-05-02
---

# modifier(_:)

Applies a modifier to a view and returns a new view.

## Declaration

```swift
nonisolated func modifier<T>(_ modifier: T) -> ModifiedContent<Self, T>
```

### Discussion

Use this modifier to combine a `View` and a `ViewModifier`, to create a new view. For example, if you create a view modifier for a new kind of caption with blue text surrounded by a rounded rectangle:

```swift
struct BorderedCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
            )
            .foregroundColor(Color.blue)
    }
}
```

You can use `View/modifier(_:)` to extend `View` to create new modifier for applying the `BorderedCaption` defined above:

```swift
extension View {
    func borderedCaption() -> some View {
        modifier(BorderedCaption())
    }
}
```

Then you can apply the bordered caption to any view:

```swift
Image(systemName: "bus")
    .resizable()
    .frame(width:50, height:50)
Text("Downtown Bus")
    .borderedCaption()
```

## Parameters

- **modifier**: The modifier to apply to this view.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `Configuring views`
- `Reducing view modifier maintenance`
- `ViewModifier`
- `EmptyModifier`
- `ModifiedContent`
- `EnvironmentalModifier`
- `ManipulableModifier`
- `ManipulableResponderModifier`
- `ManipulableTransformBindingModifier`
- `ManipulationGeometryModifier`
- `ManipulationGestureModifier`
- `ManipulationUsingGestureStateModifier`
- `Manipulable`
