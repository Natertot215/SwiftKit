---
url: https://developer.apple.com/documentation/swiftui/matchedtransitionsourceconfiguration
framework: SwiftUI
category: Animations
title: MatchedTransitionSourceConfiguration
kind: protocol
captured: 2026-05-02
---

# MatchedTransitionSourceConfiguration

A configuration that defines the appearance of a matched transition source.

## Declaration

```swift
protocol MatchedTransitionSourceConfiguration : Sendable
```







## Relationships

**Inherits From**: `Sendable`, `SendableMetatype`

**Conforming Types**: `EmptyMatchedTransitionSourceConfiguration`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Instance Methods

- `background(_:)`
- `clipShape(_:)`
- `shadow(color:radius:x:y:)`

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
- `NavigationTransition`
- `matchedTransitionSource(id:in:)`
- `matchedTransitionSource(id:in:configuration:)`
