---
url: https://developer.apple.com/documentation/swiftui/view/listsectionseparatortint(_:edges:)
framework: SwiftUI
category: Lists
title: listSectionSeparatorTint(_:edges:)
kind: method
captured: 2026-05-02
---

# listSectionSeparatorTint(_:edges:)

Sets the tint color associated with a section.

## Declaration

```swift
nonisolated func listSectionSeparatorTint(_ color: Color?, edges: VerticalEdge.Set = .all) -> some View

```

### Discussion

Separators can be presented above and below a section. You can specify to which edge this preference should apply.

This modifier expresses a preference to the containing `List`. The list style is the final arbiter for the separator tint.

The following example shows a simple grouped list whose section separators are tinted based on section-specific data:

```swift
List {
    ForEach(garage) { garage in
        Section(header: Text(garage.location)) {
            ForEach(garage.cars) { car in
                Text(car.model)
                    .listRowSeparatorTint(car.brandColor)
            }
        }
        .listSectionSeparatorTint(
            garage.cars.last?.brandColor, edges: .bottom)
    }
}
.listStyle(.grouped)
```

To change the visibility and tint color for a row separator, use `View/listRowSeparator(_:edges:)` and `View/listRowSeparatorTint(_:edges:)`. To hide a section separator, use `View/listSectionSeparator(_:edges:)`.

## Parameters

- **color**: The color to use to tint the section separators, or `nil` to use the default color for the current list style.
- **edges**: The set of row edges for which the tint applies. The list style might decide to not display certain separators, typically the top edge. The default is `VerticalEdge/Set/all`.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 13.0
- visionOS 1.0



## See Also

- `listRowSeparatorTint(_:edges:)`
- `listRowSeparator(_:edges:)`
- `listSectionSeparator(_:edges:)`
