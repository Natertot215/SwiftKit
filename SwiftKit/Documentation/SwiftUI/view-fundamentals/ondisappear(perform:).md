---
url: https://developer.apple.com/documentation/swiftui/view/ondisappear(perform:)
framework: SwiftUI
category: View fundamentals
title: onDisappear(perform:)
kind: method
captured: 2026-05-02
---

# onDisappear(perform:)

Adds an action to perform after this view disappears.

## Declaration

```swift
nonisolated func onDisappear(perform action: (() -> Void)? = nil) -> some View

```

### Return Value

A view that triggers `action` after it disappears.

### Discussion

The exact moment that SwiftUI calls this method depends on the specific view type that you apply it to, but the `action` closure doesn’t execute until the view disappears from the interface.

## Parameters

- **action**: The action to perform. If `action` is `nil`, the call has no effect.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `onAppear(perform:)`
