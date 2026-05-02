---
url: https://developer.apple.com/documentation/swiftui/view/presentationdetents(_:selection:)
framework: SwiftUI
category: Modal presentations
title: presentationDetents(_:selection:)
kind: method
captured: 2026-05-02
---

# presentationDetents(_:selection:)

Sets the available detents for the enclosing sheet, giving you programmatic control of the currently selected detent.

## Declaration

```swift
nonisolated func presentationDetents(_ detents: Set<PresentationDetent>, selection: Binding<PresentationDetent>) -> some View

```

### Discussion

By default, sheets support the `PresentationDetent/large` detent.

```swift
struct ContentView: View {
    @State private var showSettings = false
    @State private var settingsDetent = PresentationDetent.medium

    var body: some View {
        Button("View Settings") {
            showSettings = true
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
                .presentationDetents(
                    [.medium, .large],
                    selection: $settingsDetent
                 )
        }
    }
}
```

## Parameters

- **detents**: A set of supported detents for the sheet. If you provide more that one detent, people can drag the sheet to resize it.
- **selection**: A `Binding` to the currently selected detent. Ensure that the value matches one of the detents that you provide for the `detents` parameter.





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
- `presentationContentInteraction(_:)`
- `presentationDragIndicator(_:)`
- `PresentationDetent`
- `CustomPresentationDetent`
- `PresentationContentInteraction`
