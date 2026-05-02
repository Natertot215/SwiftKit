---
url: https://developer.apple.com/documentation/swiftui/transitionphase
framework: SwiftUI
category: Animations
title: TransitionPhase
kind: enum
captured: 2026-05-02
---

# TransitionPhase

An indication of which the current stage of a transition.

## Declaration

```swift
@frozen enum TransitionPhase
```

### Overview

When a view is appearing with a transition, the transition will first be shown with the `willAppear` phase, then will be immediately moved to the `identity` phase. When a view is being removed, its transition is changed from the `identity` phase to the `didDisappear` phase. If a view is removed while it is still transitioning in, then its phase will change to `didDisappear`. If a view is re-added while it is transitioning out, its phase will change back to `identity`.

In the `identity` phase, transitions should generally not make any visual change to the view they are applied to, since the transition’s view modifications in the `identity` phase will be applied to the view as long as it is visible. In the `willAppear` and `didDisappear` phases, transitions should apply a change that will be animated to create the transition. If no animatable change is applied, then the transition will be a no-op.

- See Also: `Transition`
- See Also: `AnyTransition`





## Relationships

**Conforms To**: `BitwiseCopyable`, `Copyable`, `Equatable`, `Escapable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Getting the phase

- `TransitionPhase.identity`
- `TransitionPhase.willAppear`
- `TransitionPhase.didDisappear`

### Getting phase characteristics

- `isIdentity`
- `value`

## See Also

- `transition(_:)`
- `Transition`
- `TransitionProperties`
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
