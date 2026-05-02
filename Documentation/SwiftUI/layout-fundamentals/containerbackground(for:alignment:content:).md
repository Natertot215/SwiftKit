---
url: https://developer.apple.com/documentation/swiftui/view/containerbackground(for:alignment:content:)
framework: SwiftUI
category: Layout fundamentals
title: containerBackground(for:alignment:content:)
kind: method
captured: 2026-05-02
---

# containerBackground(for:alignment:content:)

Sets the container background of the enclosing container using a view.

## Declaration

```swift
nonisolated func containerBackground<V>(for container: ContainerBackgroundPlacement, alignment: Alignment = .center, @ViewBuilder content: () -> V) -> some View where V : View

```

### Discussion

The following example uses a custom `View` as a background:

```swift
struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Image") {
                    Text("Image")
                    .containerBackground(for: .navigation) {
                        Image(name: "ImageAsset")
                    }
                }
            }
        }
    }
}
```

The `.containerBackground(for:alignment:content:)` modifier differs from the `View/background(_:ignoresSafeAreaEdges:)` modifier by automatically filling an entire parent container. `ContainerBackgroundPlacement` describes the available containers.

## Parameters

- **container**: The container that will use the background.
- **alignment**: The alignment that the modifier uses to position the implicit `ZStack` that groups the background views. The default is `Alignment/center`.
- **content**: The view to use as the background of the container.





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
- `containerBackground(_:for:)`
- `ContainerBackgroundPlacement`
