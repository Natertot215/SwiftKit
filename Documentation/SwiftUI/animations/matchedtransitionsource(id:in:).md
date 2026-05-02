---
url: https://developer.apple.com/documentation/swiftui/view/matchedtransitionsource(id:in:)
framework: SwiftUI
category: Animations
title: matchedTransitionSource(id:in:)
kind: method
captured: 2026-05-02
---

# matchedTransitionSource(id:in:)

Identifies this view as the source of a navigation transition, such as a zoom transition.

## Declaration

```swift
nonisolated func matchedTransitionSource(id: some Hashable, in namespace: Namespace.ID) -> some View

```



## Parameters

- **id**: The identifier, often derived from the identifier of the data being displayed by the view.
- **namespace**: The namespace in which defines the `id`. New namespaces are created by adding an `Namespace` variable to a `View` type and reading its value in the view’s body method.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



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
- `matchedTransitionSource(id:in:configuration:)`
- `MatchedTransitionSourceConfiguration`
