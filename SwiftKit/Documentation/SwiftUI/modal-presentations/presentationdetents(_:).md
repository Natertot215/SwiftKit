---
url: https://developer.apple.com/documentation/swiftui/view/presentationdetents(_:)
framework: SwiftUI
category: Modal presentations
title: presentationDetents(_:)
kind: method
captured: 2026-05-02
---

# presentationDetents(_:)

Sets the available detents for the enclosing sheet.

## Declaration

```swift
nonisolated func presentationDetents(_ detents: Set<PresentationDetent>) -> some View

```

### Discussion

By default, sheets support the `PresentationDetent/large` detent.

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
        }
    }
}
```

## Parameters

- **detents**: A set of supported detents for the sheet. If you provide more that one detent, people can drag the sheet to resize it.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `presentationDetents(_:selection:)`
- `presentationContentInteraction(_:)`
- `presentationDragIndicator(_:)`
- `PresentationDetent`
- `CustomPresentationDetent`
- `PresentationContentInteraction`
