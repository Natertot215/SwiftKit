---
url: https://developer.apple.com/documentation/swiftui/view/listrowhovereffectdisabled(_:)
framework: SwiftUI
category: Lists
title: listRowHoverEffectDisabled(_:)
kind: method
captured: 2026-05-02
---

# listRowHoverEffectDisabled(_:)

Requests that the containing list row have its hover effect disabled.

## Declaration

```swift
nonisolated func listRowHoverEffectDisabled(_ disabled: Bool = true) -> some View

```

### Return Value

A view that requests the default hover effect on its containing list row to conditionally be disabled.

### Discussion

By default, `List` rows have built-in hover effects in visionOS. In some cases, it is useful to disable the default hover effect.

## Parameters

- **disabled**: A Boolean value that determines whether the containing list row should display its default hover effect.





## Availability

- visionOS 1.0



## See Also

- `swipeActions(edge:allowsFullSwipe:content:)`
- `selectionDisabled(_:)`
- `listRowHoverEffect(_:)`
