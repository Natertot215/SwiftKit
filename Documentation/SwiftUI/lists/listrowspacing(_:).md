---
url: https://developer.apple.com/documentation/swiftui/view/listrowspacing(_:)
framework: SwiftUI
category: Lists
title: listRowSpacing(_:)
kind: method
captured: 2026-05-02
---

# listRowSpacing(_:)

Sets the vertical spacing between two adjacent rows in a List.

## Declaration

```swift
nonisolated func listRowSpacing(_ spacing: CGFloat?) -> some View

```

### Discussion

The following example creates a List with 10 pts of spacing between each row:

```swift
List {
    Text("Blue")
    Text("Red")
}
.listRowSpacing(10.0)
```

## Parameters

- **spacing**: The spacing value to use. A value of `nil` uses the default spacing.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- visionOS 1.0



## See Also

- `listRowInsets(_:)`
- `defaultMinListRowHeight`
- `defaultMinListHeaderHeight`
- `listSectionSpacing(_:)`
- `ListSectionSpacing`
- `listSectionMargins(_:_:)`
