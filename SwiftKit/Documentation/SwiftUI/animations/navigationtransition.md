---
url: https://developer.apple.com/documentation/swiftui/navigationtransition
framework: SwiftUI
category: Animations
title: NavigationTransition
kind: protocol
captured: 2026-05-02
---

# NavigationTransition

A type that defines the transition to use when navigating to a view.

## Declaration

```swift
protocol NavigationTransition
```







## Relationships

**Conforming Types**: `AutomaticNavigationTransition`, `ZoomNavigationTransition`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Getting built-in transitions

- `automatic`
- `zoom(sourceID:in:)`

### Supporting Types

- `AutomaticNavigationTransition`
- `ZoomNavigationTransition`

## See Also

- `transition(_:)`
- `Transition`
- `TransitionProperties`
- `TransitionPhase`
- `AsymmetricTransition`
- `AnyTransition`
- `contentTransition(_:)`
- `contentTransition`
- `contentTransitionAddsDrawingGroup`
- `ContentTransition`
- `PlaceholderContentView`
- `navigationTransition(_:)`
- `matchedTransitionSource(id:in:)`
- `matchedTransitionSource(id:in:configuration:)`
- `MatchedTransitionSourceConfiguration`
