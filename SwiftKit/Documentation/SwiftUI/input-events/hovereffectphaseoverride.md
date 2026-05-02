---
url: https://developer.apple.com/documentation/swiftui/hovereffectphaseoverride
framework: SwiftUI
category: Input events
title: HoverEffectPhaseOverride
kind: struct
captured: 2026-05-02
---

# HoverEffectPhaseOverride

Options for overriding a hover effect’s current phase.

## Declaration

```swift
struct HoverEffectPhaseOverride
```

### Overview

By default hover effects transition between the active and inactive phases in response to hover events. Use `HoverEffectPhaseOverride` to cause a hover effect to transition between phases based on other criteria.





## Relationships

**Conforms To**: `Equatable`

## Availability

- visionOS 26.0

## Topics

### Type Properties

- `active`
- `inactive`

### Type Methods

- `activeTemporarily(trigger:)`
- `inactiveTemporarily(trigger:)`
- `toggled(trigger:)`
- `toggledTemporarily(trigger:)`

## See Also

- `onHover(perform:)`
- `onContinuousHover(coordinateSpace:perform:)`
- `hoverEffect(_:isEnabled:)`
- `hoverEffectDisabled(_:)`
- `defaultHoverEffect(_:)`
- `isHoverEffectEnabled`
- `HoverPhase`
- `OrnamentHoverContentEffect`
- `OrnamentHoverEffect`
