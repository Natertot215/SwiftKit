---
url: https://developer.apple.com/documentation/swiftui/view/animation(_:body:)
framework: SwiftUI
category: Animations
title: animation(_:body:)
kind: method
captured: 2026-05-02
---

# animation(_:body:)

Applies the given animation to all animatable values within the `body` closure.

## Declaration

```swift
nonisolated func animation<V>(_ animation: Animation?, @ViewBuilder body: (PlaceholderContentView<Self>) -> V) -> some View where V : View

```

### Discussion

Any modifiers applied to the content of `body` will be applied to this view, and the `animation` will only be used on the modifiers defined in the `body`.

The following code animates the opacity changing with an easeInOut animation, while the contents of MyView are animated with the implicit transaction’s animation:

```swift
MyView(isActive: isActive)
    .animation(.easeInOut) { content in
        content.opacity(isActive ? 1.0 : 0.0)
    }
```







## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `animation(_:)`
- `animation(_:value:)`
