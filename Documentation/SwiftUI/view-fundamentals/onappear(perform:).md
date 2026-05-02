---
url: https://developer.apple.com/documentation/swiftui/view/onappear(perform:)
framework: SwiftUI
category: View fundamentals
title: onAppear(perform:)
kind: method
captured: 2026-05-02
---

# onAppear(perform:)

Adds an action to perform before this view appears.

## Declaration

```swift
nonisolated func onAppear(perform action: (() -> Void)? = nil) -> some View

```

### Return Value

A view that triggers `action` before it appears.

### Discussion

The exact moment that SwiftUI calls this method depends on the specific view type that you apply it to, but the `action` closure completes before the first rendered frame appears.

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

- `onDisappear(perform:)`
