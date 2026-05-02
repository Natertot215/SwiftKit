---
url: https://developer.apple.com/documentation/swiftui/scrolltransitionphase
framework: SwiftUI
category: Scroll views
title: ScrollTransitionPhase
kind: enum
captured: 2026-05-02
---

# ScrollTransitionPhase

The phases that a view transitions between when it scrolls among other views.

## Declaration

```swift
@frozen enum ScrollTransitionPhase
```

### Overview

When a view with a scroll transition modifier applied is approaching the visible region of the containing scroll view or other container, the effect  will first be applied with the `topLeading` or `bottomTrailing` phase (depending on which edge the view is approaching), then will be moved to the `identity` phase as the view moves into the visible area. The timing and behavior that determines when a view is visible within the container is controlled by the configuration that is provided to the `scrollTransition` modifier.

In the `identity` phase, scroll transitions should generally not make any visual change to the view they are applied to, since the transition’s view modifications in the `identity` phase will be applied to the view as long as it is visible. In the `topLeading` and `bottomTrailing` phases, transitions should apply a change that will be animated to create the transition.





## Relationships

**Conforms To**: `BitwiseCopyable`, `Copyable`, `Equatable`, `Escapable`, `Hashable`

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

- `ScrollTransitionPhase.identity`
- `ScrollTransitionPhase.topLeading`
- `ScrollTransitionPhase.bottomTrailing`

### Accessing the phase state

- `isIdentity`
- `value`

## See Also

- `scrollTransition(_:axis:transition:)`
- `scrollTransition(topLeading:bottomTrailing:axis:transition:)`
- `ScrollTransitionConfiguration`
