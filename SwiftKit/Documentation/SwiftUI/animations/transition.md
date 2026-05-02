---
url: https://developer.apple.com/documentation/swiftui/transition
framework: SwiftUI
category: Animations
title: Transition
kind: protocol
captured: 2026-05-02
---

# Transition

A description of view changes to apply when a view is added to and removed from the view hierarchy.

## Declaration

```swift
@MainActor @preconcurrency protocol Transition
```

### Overview

A transition should generally be made by applying one or more modifiers to the `content`. For symmetric transitions, the `isIdentity` property on `phase` can be used to change the properties of modifiers. For asymmetric transitions, the phase itself can be used to change those properties. Transitions should not use any identity-affecting changes like `.id`, `if`, and `switch` on the `content`, since doing so would reset the state of the view they’re applied to, causing wasted work and potentially surprising behavior when it appears and disappears.

The following code defines a transition that can be used to change the opacity and rotation when a view appears and disappears.

```swift
struct RotatingFadeTransition: Transition {
    func body(content: Content, phase: TransitionPhase) -> some View {
        content
          .opacity(phase.isIdentity ? 1.0 : 0.0)
          .rotationEffect(phase.rotation)
    }
}
extension TransitionPhase {
    fileprivate var rotation: Angle {
        switch self {
        case .willAppear: return .degrees(30)
        case .identity: return .zero
        case .didDisappear: return .degrees(-30)
        }
    }
}
```

A type conforming to this protocol inherits `@preconcurrency @MainActor` isolation from the protocol if the conformance is included in the type’s base declaration:

```swift
struct MyCustomType: Transition {
    // `@preconcurrency @MainActor` isolation by default
}
```

Isolation to the main actor is the default, but it’s not required. Declare the conformance in an extension to opt out of main actor isolation:

```swift
extension MyCustomType: Transition {
    // `nonisolated` by default
}
```

- See Also: `TransitionPhase`
- See Also: `AnyTransition`





## Relationships

**Conforming Types**: `AsymmetricTransition`, `BlurReplaceTransition`, `IdentityTransition`, `MoveTransition`, `OffsetTransition`, `OpacityTransition`, `PushTransition`, `ScaleTransition`, `SlideTransition`, `SymbolEffectTransition`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Getting built-in transitions

- `blurReplace`
- `blurReplace(_:)`
- `identity`
- `move(edge:)`
- `offset(_:)`
- `offset(x:y:)`
- `opacity`
- `push(from:)`
- `scale`
- `scale(_:anchor:)`
- `slide`
- `symbolEffect`
- `symbolEffect(_:options:)`

### Configuring a transition

- `animation(_:)`
- `properties`

### Using a transition

- `apply(content:phase:)`
- `combined(with:)`

### Creating a custom transition

- `body(content:phase:)`
- `Body`
- `Transition.Content`

### Supporting types

- `BlurReplaceTransition`
- `IdentityTransition`
- `MoveTransition`
- `OffsetTransition`
- `OpacityTransition`
- `PushTransition`
- `ScaleTransition`
- `SlideTransition`

## See Also

- `transition(_:)`
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
- `MatchedTransitionSourceConfiguration`
