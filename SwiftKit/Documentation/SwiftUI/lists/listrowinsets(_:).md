---
url: https://developer.apple.com/documentation/swiftui/view/listrowinsets(_:)
framework: SwiftUI
category: Lists
title: listRowInsets(_:)
kind: method
captured: 2026-05-02
---

# listRowInsets(_:)

Applies an inset to the rows in a list.

## Declaration

```swift
nonisolated func listRowInsets(_ insets: EdgeInsets?) -> some View

```

### Return Value

A view that uses the given edge insets when used as a list cell.

### Discussion

Use `listRowInsets(_:)` to change the default padding of the content of list items.

In the example below, the `Flavor` enumeration provides content for list items. The SwiftUI `ForEach` structure computes views for each element of the `Flavor` enumeration and extracts the raw value of each of its elements using the resulting text to create each list row item. The `listRowInsets(_:)` modifier then changes the edge insets of each row of the list according to the `EdgeInsets` provided:

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
                    .listRowInsets(.init(top: 0,
                                         leading: 25,
                                         bottom: 0,
                                         trailing: 0))
            }
        }
    }
}
```

> **NOTE:** On iOS 18 and earlier, and on visionOS 2 and earlier, the content of list rows can grow slightly into the row insets. The effective vertical insets can then be smaller than expected.

## Parameters

- **insets**: The `EdgeInsets` to apply to the edges of the view.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `defaultMinListRowHeight`
- `defaultMinListHeaderHeight`
- `listRowSpacing(_:)`
- `listSectionSpacing(_:)`
- `ListSectionSpacing`
- `listSectionMargins(_:_:)`
