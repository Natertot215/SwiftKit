---
url: https://developer.apple.com/documentation/swiftui/view/listrowbackground(_:)
framework: SwiftUI
category: Lists
title: listRowBackground(_:)
kind: method
captured: 2026-05-02
---

# listRowBackground(_:)

Places a custom background view behind a list row item.

## Declaration

```swift
nonisolated func listRowBackground<V>(_ view: V?) -> some View where V : View

```

### Return Value

A list row view with `view` as its background view.

### Discussion

Use `listRowBackground(_:)` to place a custom background view behind a list row item.

In the example below, the `Flavor` enumeration provides content for list items. The SwiftUI `ForEach` structure computes views for each element of the `Flavor` enumeration and extracts the raw value of each of its elements using the resulting text to create each list row item. The `listRowBackground(_:)` modifier then places the view you supply behind each of the list row items:

```swift
struct ContentView: View {
    enum Flavor: String, CaseIterable, Identifiable {
        var id: String { self.rawValue }
        case vanilla, chocolate, strawberry
    }

    var body: some View {
        List {
            ForEach(Flavor.allCases) {
                Text($0.rawValue)
                    .listRowBackground(Ellipse()
                                        .background(Color.clear)
                                        .foregroundColor(.purple)
                                        .opacity(0.3)
                    )
            }
        }
    }
}
```

## Parameters

- **view**: The `View` to use as the background behind the list row view.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `alternatingRowBackgrounds(_:)`
- `AlternatingRowBackgroundBehavior`
- `backgroundProminence`
- `BackgroundProminence`
