---
url: https://developer.apple.com/documentation/swiftui/view/onhover(perform:)
framework: SwiftUI
category: Input events
title: onHover(perform:)
kind: method
captured: 2026-05-02
---

# onHover(perform:)

Adds an action to perform when the user moves the pointer over or away from the view’s frame.

## Declaration

```swift
nonisolated func onHover(perform action: @escaping (Bool) -> Void) -> some View

```

### Return Value

A view that triggers `action` when the pointer enters or exits this view’s frame.

### Discussion

Calling this method defines a region for detecting pointer movement with the size and position of this view.

## Parameters

- **action**: The action to perform whenever the pointer enters or exits this view’s frame. If the pointer is in the view’s frame, the `action` closure passes `true` as a parameter; otherwise, `false`.





## Availability

- iOS 13.4
- iPadOS 13.4
- Mac Catalyst 13.4
- macOS 10.15
- visionOS 1.0



## See Also

- `onContinuousHover(coordinateSpace:perform:)`
- `hoverEffect(_:isEnabled:)`
- `hoverEffectDisabled(_:)`
- `defaultHoverEffect(_:)`
- `isHoverEffectEnabled`
- `HoverPhase`
- `HoverEffectPhaseOverride`
- `OrnamentHoverContentEffect`
- `OrnamentHoverEffect`
