---
url: https://developer.apple.com/documentation/swiftui/view/hovereffect(_:isenabled:)
framework: SwiftUI
category: Input events
title: hoverEffect(_:isEnabled:)
kind: method
captured: 2026-05-02
---

# hoverEffect(_:isEnabled:)

Applies a hover effect to this view.

## Declaration

```swift
nonisolated func hoverEffect(_ effect: HoverEffect = .automatic, isEnabled: Bool = true) -> some View

```

### Return Value

A new view that applies a hover effect to `self`.

### Discussion

By default, `HoverEffect/automatic` is used. You can control the behavior of the automatic effect with the `View/defaultHoverEffect(_:)` modifier.

## Parameters

- **effect**: The effect to apply to this view.
- **isEnabled**: Whether the effect is enabled or not.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- tvOS 17.0
- visionOS 1.0



## See Also

- `onHover(perform:)`
- `onContinuousHover(coordinateSpace:perform:)`
- `hoverEffectDisabled(_:)`
- `defaultHoverEffect(_:)`
- `isHoverEffectEnabled`
- `HoverPhase`
- `HoverEffectPhaseOverride`
- `OrnamentHoverContentEffect`
- `OrnamentHoverEffect`
