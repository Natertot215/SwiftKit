---
url: https://developer.apple.com/documentation/swiftui/contenttransition
framework: SwiftUI
category: Animations
title: ContentTransition
kind: struct
captured: 2026-05-02
---

# ContentTransition

A kind of transition that applies to the content within a single view, rather than to the insertion or removal of a view.

## Declaration

```swift
struct ContentTransition
```

### Overview

Set the behavior of content transitions within a view with the `View/contentTransition(_:)` modifier, passing in one of the defined transitions, such as `ContentTransition/opacity` or `ContentTransition/interpolate` as the parameter.

> **TIP:** Content transitions only take effect within transactions that apply an `Animation` to the views inside the `View/contentTransition(_:)` modifier.

Content transitions only take effect within the context of an `Animation` block.





## Relationships

**Conforms To**: `Equatable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Getting content transitions

- `identity`
- `interpolate`
- `numericText(countsDown:)`
- `numericText(value:)`
- `opacity`
- `symbolEffect`
- `symbolEffect(_:options:)`

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
- `PlaceholderContentView`
- `navigationTransition(_:)`
- `NavigationTransition`
- `matchedTransitionSource(id:in:)`
- `matchedTransitionSource(id:in:configuration:)`
- `MatchedTransitionSourceConfiguration`
