---
url: https://developer.apple.com/documentation/swiftui/symboleffecttransition
framework: SwiftUI
category: Images
title: SymbolEffectTransition
kind: struct
captured: 2026-05-02
---

# SymbolEffectTransition

Creates a transition that applies the Appear, Disappear, DrawOn or DrawOff symbol animation to symbol images within the inserted or removed view hierarchy.

## Declaration

```swift
@MainActor @frozen @preconcurrency struct SymbolEffectTransition
```

### Overview

Other views are unaffected by this transition.





## Relationships

**Conforms To**: `Transition`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Creating a transition

- `init(effect:options:)`

## See Also

- `symbolEffect(_:options:isActive:)`
- `symbolEffect(_:options:value:)`
- `symbolEffectsRemoved(_:)`
