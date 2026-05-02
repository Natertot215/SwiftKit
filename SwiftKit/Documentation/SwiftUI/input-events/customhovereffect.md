---
url: https://developer.apple.com/documentation/swiftui/customhovereffect
framework: SwiftUI
category: Input events
title: CustomHoverEffect
kind: protocol
captured: 2026-05-02
---

# CustomHoverEffect

A type that represents how a view should change when a pointer hovers over a view, or when someone looks at the view.

## Declaration

```swift
protocol CustomHoverEffect
```

### Overview

Custom hover effects apply their inactive values when the effect is inactive, and their active values when the effect is active. For example, the following effect causes a view to be partially transparent when inactive, but animate to fully opaque when active:

```swift
struct FadeInHoverEffect: CustomHoverEffect {
    func body(content: Content) -> some CustomHoverEffect {
        content.hoverEffect { effect, isActive, proxy in
            effect.animation(.easeOut) {
                $0.opacity(isActive ? 1 : 0.5)
            }
        }
    }
}
```

This effect can be applied to a view using the `hoverEffect(_:)` modifier:

```swift
Color.red
    .hoverEffect(FadeInHoverEffect())
```

Hover effects do not affect a view’s layout, and may be applied to a view out-of-process. Therefore an effect’s current phase may not be visible within your app.





## Relationships

**Conforming Types**: `AutomaticHoverEffect`, `ContentHoverEffect`, `EmptyHoverEffect`, `GroupHoverEffect`, `HighlightHoverEffect`, `HoverEffect`, `LiftHoverEffect`, `ModifiedContent`, `OrnamentHoverContentEffect`, `OrnamentHoverEffect`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- tvOS 18.0
- visionOS 2.0

## Topics

### Getting built-in hover effects

- `automatic`
- `empty`
- `highlight`
- `lift`

### Creating custom hover effects

- `hoverEffect(_:in:isEnabled:)`
- `hoverEffect(in:isEnabled:body:)`
- `hoverEffectGroup(_:)`
- `hoverEffectGroup(id:in:behavior:)`
- `hoverEffectDisabled(_:)`

### Supporting types

- `AutomaticHoverEffect`
- `EmptyHoverEffect`
- `HighlightHoverEffect`
- `LiftHoverEffect`

### Associated Types

- `Body`

### Instance Methods

- `body(content:)`
- `hoverEffectPhaseOverride(_:)`

### Type Aliases

- `CustomHoverEffect.Content`

### Type Methods

- `hoverEffect(in:isEnabled:body:)`
- `hoverEffectGroup(_:)`
- `hoverEffectGroup(id:in:behavior:)`
- `ornament(attachmentAnchor:contentAlignment:ornament:)`
- `ornament(attachmentAnchor:contentAlignment:ornament:effect:)`

## See Also

- `hoverEffect(_:)`
- `HoverEffect`
- `hoverEffect(_:in:isEnabled:)`
- `hoverEffect(in:isEnabled:body:)`
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
