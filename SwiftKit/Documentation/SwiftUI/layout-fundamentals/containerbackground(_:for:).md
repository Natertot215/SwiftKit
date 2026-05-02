---
url: https://developer.apple.com/documentation/swiftui/view/containerbackground(_:for:)
framework: SwiftUI
category: Layout fundamentals
title: containerBackground(_:for:)
kind: method
captured: 2026-05-02
---

# containerBackground(_:for:)

Sets the container background of the enclosing container using a view.

## Declaration

```swift
nonisolated func containerBackground<S>(_ style: S, for container: ContainerBackgroundPlacement) -> some View where S : ShapeStyle

```

### Discussion

The following example uses a `LinearGradient` as a background:

```swift
struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Blue") {
                    Text("Blue")
                    .containerBackground(.blue.gradient, for: .navigation)
                }
                NavigationLink("Red") {
                    Text("Red")
                    .containerBackground(.red.gradient, for: .navigation)
                }
            }
        }
    }
}
```

The `.containerBackground(_:for:)` modifier differs from the `View/background(_:ignoresSafeAreaEdges:)` modifier by automatically filling an entire parent container. `ContainerBackgroundPlacement` describes the available containers.

- Parameters

- style: The shape style to use as the container background.
- container: The container that will use the background.







## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `Adding a background to your view`
- `ZStack`
- `zIndex(_:)`
- `background(alignment:content:)`
- `background(_:ignoresSafeAreaEdges:)`
- `background(ignoresSafeAreaEdges:)`
- `background(_:in:fillStyle:)`
- `background(in:fillStyle:)`
- `overlay(alignment:content:)`
- `overlay(_:ignoresSafeAreaEdges:)`
- `overlay(_:in:fillStyle:)`
- `backgroundMaterial`
- `containerBackground(for:alignment:content:)`
- `ContainerBackgroundPlacement`
