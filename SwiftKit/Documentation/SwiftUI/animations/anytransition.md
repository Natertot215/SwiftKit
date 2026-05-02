---
url: https://developer.apple.com/documentation/swiftui/anytransition
framework: SwiftUI
category: Animations
title: AnyTransition
kind: struct
captured: 2026-05-02
---

# AnyTransition

A type-erased transition.

## Declaration

```swift
@frozen struct AnyTransition
```

### Overview

- See Also: `Transition`







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting built-in transitions

- `identity`
- `move(edge:)`
- `offset(_:)`
- `offset(x:y:)`
- `opacity`
- `push(from:)`
- `scale`
- `scale(scale:anchor:)`
- `slide`

### Combining and configuring transitions

- `animation(_:)`
- `asymmetric(insertion:removal:)`
- `combined(with:)`

### Creating a custom transition

- `init(_:)`
- `modifier(active:identity:)`

## See Also

- `transition(_:)`
- `Transition`
- `TransitionProperties`
- `TransitionPhase`
- `AsymmetricTransition`
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
