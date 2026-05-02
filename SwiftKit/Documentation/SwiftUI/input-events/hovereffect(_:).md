---
url: https://developer.apple.com/documentation/swiftui/view/hovereffect(_:)
framework: SwiftUI
category: Input events
title: hoverEffect(_:)
kind: method
captured: 2026-05-02
---

# hoverEffect(_:)

Applies a hover effect to this view.

## Declaration

```swift
nonisolated func hoverEffect(_ effect: HoverEffect = .automatic) -> some View

```

### Return Value

A new view that applies a hover effect to `self`.

### Discussion

By default, `HoverEffect/automatic` is used. You can control the behavior of the automatic effect with the `View/defaultHoverEffect(_:)` modifier.

## Parameters

- **effect**: The effect to apply to this view.





## Availability

- iOS 13.4
- iPadOS 13.4
- Mac Catalyst 13.4
- tvOS 16.0
- visionOS 1.0



## See Also

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
- `handPointerBehavior(_:)`
- `HandPointerBehavior`
