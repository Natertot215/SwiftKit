---
url: https://developer.apple.com/documentation/swiftui/view/presentationbackground(alignment:content:)
framework: SwiftUI
category: Modal presentations
title: presentationBackground(alignment:content:)
kind: method
captured: 2026-05-02
---

# presentationBackground(alignment:content:)

Sets the presentation background of the enclosing sheet to a custom view.

## Declaration

```swift
nonisolated func presentationBackground<V>(alignment: Alignment = .center, @ViewBuilder content: () -> V) -> some View where V : View

```

### Discussion

The following example uses a yellow view as the sheet background:

```swift
struct ContentView: View {
    @State private var showSettings = false

    var body: some View {
        Button("View Settings") {
            showSettings = true
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
                .presentationBackground {
                    Color.yellow
                }
        }
    }
}
```

The `presentationBackground(alignment:content:)` modifier differs from the `View/background(alignment:content:)` modifier in several key ways. A presentation background:

- Automatically fills the entire presentation.
- Allows views behind the presentation to show through translucent areas of the `content` on supported platforms.

> **NOTE:** Sheet presentations on macOS do not support translucency or transparency — the background is always opaque.

## Parameters

- **alignment**: The alignment that the modifier uses to position the implicit `ZStack` that groups the background views. The default is `Alignment/center`.
- **content**: The view to use as the background of the presentation.





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
- `presentationBackground(_:)`
- `presentationBackgroundInteraction(_:)`
- `PresentationBackgroundInteraction`
