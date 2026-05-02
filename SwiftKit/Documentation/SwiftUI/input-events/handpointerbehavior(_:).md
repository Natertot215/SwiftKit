---
url: https://developer.apple.com/documentation/swiftui/view/handpointerbehavior(_:)
framework: SwiftUI
category: Input events
title: handPointerBehavior(_:)
kind: method
captured: 2026-05-02
---

# handPointerBehavior(_:)

Sets the behavior of the hand pointer while the user is interacting with the view.

## Declaration

```swift
nonisolated func handPointerBehavior(_ behavior: HandPointerBehavior?) -> some View

```

### Return Value

A view that applies the given behavior to the hand pointer.

## Parameters

- **behavior**: The behavior to apply to the hand pointer. If `nil`, the hand pointer behavior will be inherited from the view’s ancestors.





## Availability

- visionOS 2.0



## See Also

- `hoverEffect(_:)`
- `HoverEffect`
- `hoverEffect(_:in:isEnabled:)`
- `hoverEffect(in:isEnabled:body:)`
- `CustomHoverEffect`
- `ContentHoverEffect`
- `HoverEffectGroup`
- `hoverEffectGroup()`
- `hoverEffectGroup(_:)`
- `hoverEffectGroup(id:in:behavior:)`
- `GroupHoverEffect`
- `HoverEffectContent`
- `EmptyHoverEffectContent`
- `HandPointerBehavior`
