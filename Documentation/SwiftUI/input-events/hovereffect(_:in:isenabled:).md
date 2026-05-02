---
url: https://developer.apple.com/documentation/swiftui/view/hovereffect(_:in:isenabled:)
framework: SwiftUI
category: Input events
title: hoverEffect(_:in:isEnabled:)
kind: method
captured: 2026-05-02
---

# hoverEffect(_:in:isEnabled:)

Applies a hover effect to this view, optionally adding it to a `HoverEffectGroup`.

## Declaration

```swift
nonisolated func hoverEffect(_ effect: some CustomHoverEffect, in group: HoverEffectGroup?, isEnabled: Bool = true) -> some View

```

### Return Value

A new view that applies the hover effect to `self` whenever the view is hovered, or the `HoverEffectGroup` is activated.

## Parameters

- **effect**: The effect to apply to this view.
- **group**: An optional `HoverEffectGroup` the effect should belong to.
- **isEnabled**: Whether this effect is enabled or not.





## Availability

- visionOS 2.0



## See Also

- `hoverEffect(_:)`
- `HoverEffect`
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
