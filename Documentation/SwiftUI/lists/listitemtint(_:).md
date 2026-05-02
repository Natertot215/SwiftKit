---
url: https://developer.apple.com/documentation/swiftui/view/listitemtint(_:)
framework: SwiftUI
category: Lists
title: listItemTint(_:)
kind: method
captured: 2026-05-02
---

# listItemTint(_:)

Sets a fixed tint color for content in a list.

## Declaration

```swift
nonisolated func listItemTint(_ tint: Color?) -> some View

```

### Discussion

The containing list’s style applies the tint as appropriate. For example, watchOS uses the tint color for its background platter appearance. Sidebars on iOS and macOS apply the tint color to their `Label` icons, which otherwise use the accent color by default.

> **NOTE:** This modifier is equivalent to using the version of the modifier that takes a `ListItemTint` value and specifying the `tint` color in the corresponding `ListItemTint/fixed(_:)` input.

## Parameters

- **tint**: The color to use to tint the content. Use `nil` to avoid overriding the inherited tint.





## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0



## See Also

- `ListItemTint`
