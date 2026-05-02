---
url: https://developer.apple.com/documentation/swiftui/asymmetrictransition
framework: SwiftUI
category: Animations
title: AsymmetricTransition
kind: struct
captured: 2026-05-02
---

# AsymmetricTransition

A composite `Transition` that uses a different transition for insertion versus removal.

## Declaration

```swift
struct AsymmetricTransition<Insertion, Removal> where Insertion : Transition, Removal : Transition
```







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

### Creating the transition

- `init(insertion:removal:)`

### Getting transition properties

- `insertion`
- `removal`

## See Also

- `transition(_:)`
- `Transition`
- `TransitionProperties`
- `TransitionPhase`
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
