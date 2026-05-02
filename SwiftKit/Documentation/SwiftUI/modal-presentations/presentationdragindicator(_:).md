---
url: https://developer.apple.com/documentation/swiftui/view/presentationdragindicator(_:)
framework: SwiftUI
category: Modal presentations
title: presentationDragIndicator(_:)
kind: method
captured: 2026-05-02
---

# presentationDragIndicator(_:)

Sets the visibility of the drag indicator on top of a sheet.

## Declaration

```swift
nonisolated func presentationDragIndicator(_ visibility: Visibility) -> some View

```

### Discussion

You can show a drag indicator when it isn’t apparent that a sheet can resize or when the sheet can’t dismiss interactively.

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
                .presentationDragIndicator(.visible)
        }
    }
}
```

## Parameters

- **visibility**: The preferred visibility of the drag indicator.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `presentationDetents(_:)`
- `presentationDetents(_:selection:)`
- `presentationContentInteraction(_:)`
- `PresentationDetent`
- `CustomPresentationDetent`
- `PresentationContentInteraction`
