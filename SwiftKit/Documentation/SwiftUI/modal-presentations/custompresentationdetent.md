---
url: https://developer.apple.com/documentation/swiftui/custompresentationdetent
framework: SwiftUI
category: Modal presentations
title: CustomPresentationDetent
kind: protocol
captured: 2026-05-02
---

# CustomPresentationDetent

The definition of a custom detent with a calculated height.

## Declaration

```swift
protocol CustomPresentationDetent
```

### Overview

You can create and use a custom detent with built-in detents.

```swift
extension PresentationDetent {
    static let bar = Self.custom(BarDetent.self)
    static let small = Self.height(100)
    static let extraLarge = Self.fraction(0.75)
}

private struct BarDetent: CustomPresentationDetent {
    static func height(in context: Context) -> CGFloat? {
        max(44, context.maxDetentValue * 0.1)
    }
}

struct ContentView: View {
    @State private var showSettings = false
    @State private var selectedDetent = PresentationDetent.bar

    var body: some View {
        Button("View Settings") {
            showSettings = true
        }
        .sheet(isPresented: $showSettings) {
            SettingsView(selectedDetent: $selectedDetent)
                .presentationDetents(
                    [.bar, .small, .medium, .large, .extraLarge],
                    selection: $selectedDetent)
        }
    }
}
```







## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Getting the height

- `height(in:)`
- `CustomPresentationDetent.Context`

## See Also

- `presentationDetents(_:)`
- `presentationDetents(_:selection:)`
- `presentationContentInteraction(_:)`
- `presentationDragIndicator(_:)`
- `PresentationDetent`
- `PresentationContentInteraction`
