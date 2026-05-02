---
url: https://developer.apple.com/documentation/swiftui/view/presentationcornerradius(_:)
framework: SwiftUI
category: Modal presentations
title: presentationCornerRadius(_:)
kind: method
captured: 2026-05-02
---

# presentationCornerRadius(_:)

Requests that the presentation have a specific corner radius.

## Declaration

```swift
nonisolated func presentationCornerRadius(_ cornerRadius: CGFloat?) -> some View

```

### Discussion

Use this modifier to change the corner radius of a presentation.

```swift
struct ContentView: View {
    @State private var showSettings = false

    var body: some View {
        Button("View Settings") {
            showSettings = true
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
                .presentationDetents([.medium, .large])
                .presentationCornerRadius(21)
        }
    }
}
```

> **NOTE:** Configuring a corner radius is not supported on watchOS, tvOS, or macOS.

## Parameters

- **cornerRadius**: The corner radius, or `nil` to use the system default.





## Availability

- iOS 16.4
- iPadOS 16.4
- Mac Catalyst 16.4
- macOS 13.3
- tvOS 16.4
- visionOS 1.0
- watchOS 9.4



## See Also

- `presentationBackground(_:)`
- `presentationBackground(alignment:content:)`
- `presentationBackgroundInteraction(_:)`
- `PresentationBackgroundInteraction`
