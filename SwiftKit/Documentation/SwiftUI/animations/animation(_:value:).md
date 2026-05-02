---
url: https://developer.apple.com/documentation/swiftui/view/animation(_:value:)
framework: SwiftUI
category: Animations
title: animation(_:value:)
kind: method
captured: 2026-05-02
---

# animation(_:value:)

Applies the given animation to this view when the specified value changes.

## Declaration

```swift
nonisolated func animation<V>(_ animation: Animation?, value: V) -> some View where V : Equatable

```

### Return Value

A view that applies `animation` to this view whenever `value` changes.

## Parameters

- **animation**: The animation to apply. If `animation` is `nil`, the view doesn’t animate.
- **value**: A value to monitor for changes.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `animation(_:)`
- `animation(_:body:)`
