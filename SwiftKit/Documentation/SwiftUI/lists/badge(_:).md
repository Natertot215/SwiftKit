---
url: https://developer.apple.com/documentation/swiftui/view/badge(_:)
framework: SwiftUI
category: Lists
title: badge(_:)
kind: method
captured: 2026-05-02
---

# badge(_:)

Generates a badge for the view from an integer value.

## Declaration

```swift
nonisolated func badge(_ count: Int) -> some View

```

### Discussion

Use a badge to convey optional, supplementary information about a view. Keep the contents of the badge as short as possible. Badges appear in list rows, tab bars, toolbar items, and menus.

The following example shows a `List` with the value of `recentItems.count` represented by a badge on one of the rows:

```swift
List {
    Text("Recents")
        .badge(recentItems.count)
    Text("Favorites")
}
```

## Parameters

- **count**: An integer value to display in the badge. Set the value to zero to hide the badge.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- visionOS 1.0



## See Also

- `badgeProminence(_:)`
- `badgeProminence`
- `BadgeProminence`
