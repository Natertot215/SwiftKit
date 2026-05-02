---
url: https://developer.apple.com/documentation/swiftui/view/presentationbackground(_:)
framework: SwiftUI
category: Modal presentations
title: presentationBackground(_:)
kind: method
captured: 2026-05-02
---

# presentationBackground(_:)

Sets the presentation background of the enclosing sheet using a shape style.

## Declaration

```swift
nonisolated func presentationBackground<S>(_ style: S) -> some View where S : ShapeStyle

```

### Discussion

The following example uses the `Material/thick` material as the sheet background:

```swift
struct ContentView: View {
    @State private var showSettings = false

    var body: some View {
        Button("View Settings") {
            showSettings = true
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
                .presentationBackground(.thickMaterial)
        }
    }
}
```

The `presentationBackground(_:)` modifier differs from the `View/background(_:ignoresSafeAreaEdges:)` modifier in several key ways. A presentation background:

- Automatically fills the entire presentation.
- Allows views behind the presentation to show through translucent styles on supported platforms.

> **NOTE:** Sheet presentations on macOS do not support translucency or transparency — the background is always opaque.

## Parameters

- **style**: The shape style to use as the presentation background.





## Availability

- iOS 16.4
- iPadOS 16.4
- Mac Catalyst 16.4
- macOS 13.3
- tvOS 16.4
- visionOS 1.0
- watchOS 9.4



## See Also

- `presentationCornerRadius(_:)`
- `presentationBackground(alignment:content:)`
- `presentationBackgroundInteraction(_:)`
- `PresentationBackgroundInteraction`
