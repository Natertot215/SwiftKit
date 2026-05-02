---
url: https://developer.apple.com/documentation/swiftui/ornamenthovercontenteffect
framework: SwiftUI
category: Input events
title: OrnamentHoverContentEffect
kind: struct
captured: 2026-05-02
---

# OrnamentHoverContentEffect

Presents an ornament on hover using a custom effect.

## Declaration

```swift
struct OrnamentHoverContentEffect<OrnamentView, OrnamentContentEffect> where OrnamentView : View, OrnamentContentEffect : HoverEffectContent
```

### Overview

You don’t use this directly. Use `CustomHoverEffect.ornament` to create ornament effects instead.





## Relationships

**Conforms To**: `CustomHoverEffect`

## Availability

- visionOS 26.0



## See Also

- `onHover(perform:)`
- `onContinuousHover(coordinateSpace:perform:)`
- `hoverEffect(_:isEnabled:)`
- `hoverEffectDisabled(_:)`
- `defaultHoverEffect(_:)`
- `isHoverEffectEnabled`
- `HoverPhase`
- `HoverEffectPhaseOverride`
- `OrnamentHoverEffect`
