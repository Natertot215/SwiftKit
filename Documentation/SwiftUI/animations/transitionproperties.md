---
url: https://developer.apple.com/documentation/swiftui/transitionproperties
framework: SwiftUI
category: Animations
title: TransitionProperties
kind: struct
captured: 2026-05-02
---

# TransitionProperties

The properties a `Transition` can have.

## Declaration

```swift
struct TransitionProperties
```

### Overview

A transition can have properties that specify high level information about it. This can determine how a transition interacts with other features like Accessibility settings.

- See Also: `Transition`





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Creating the transition properties

- `init(hasMotion:)`
- `hasMotion`

## See Also

- `transition(_:)`
- `Transition`
- `TransitionPhase`
- `AsymmetricTransition`
- `AnyTransition`
- `contentTransition(_:)`
- `contentTransition`
- `contentTransitionAddsDrawingGroup`
- `ContentTransition`
- `PlaceholderContentView`
- `navigationTransition(_:)`
- `NavigationTransition`
- `matchedTransitionSource(id:in:)`
- `matchedTransitionSource(id:in:configuration:)`
- `MatchedTransitionSourceConfiguration`
