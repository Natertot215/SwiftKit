---
url: https://developer.apple.com/documentation/swiftui/hovereffectcontent
framework: SwiftUI
category: Input events
title: HoverEffectContent
kind: protocol
captured: 2026-05-02
---

# HoverEffectContent

A type that describes the effects of a view for a particular hover effect phase.

## Declaration

```swift
protocol HoverEffectContent
```

### Overview

```swift
Color.red
    .hoverEffect { effect, isActive, proxy in
        effect.opacity(isActive ? 1 : 0.5)
    }
```

You don’t conform to this protocol yourself. Instead, effects are described by calling modifier functions on other effects, like the `opacity(_:)` modifier used in the example above.





## Relationships

**Conforming Types**: `EmptyHoverEffectContent`, `ModifiedContent`

## Availability

- visionOS 2.0

## Topics

### Instance Methods

- `animation(_:body:)`
- `clipShape(_:style:)`
- `offset(_:)`
- `offset(x:y:)`
- `opacity(_:)`
- `rotationEffect(_:anchor:)`
- `scaleEffect(_:anchor:)`
- `scaleEffect(x:y:anchor:)`
- `transformEffect(_:)`

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
- `EmptyHoverEffectContent`
- `handPointerBehavior(_:)`
- `HandPointerBehavior`
