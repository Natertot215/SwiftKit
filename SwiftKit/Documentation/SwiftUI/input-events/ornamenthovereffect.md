---
url: https://developer.apple.com/documentation/swiftui/ornamenthovereffect
framework: SwiftUI
category: Input events
title: OrnamentHoverEffect
kind: struct
captured: 2026-05-02
---

# OrnamentHoverEffect

Presents an ornament on hover.

## Declaration

```swift
struct OrnamentHoverEffect<OrnamentView> where OrnamentView : View
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
- `OrnamentHoverContentEffect`
