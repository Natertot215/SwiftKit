---
url: https://developer.apple.com/documentation/swiftui/view/transition(_:)
framework: SwiftUI
category: Animations
title: transition(_:)
kind: method
captured: 2026-05-02
---

# transition(_:)

Associates a transition with the view.

## Declaration

```swift
nonisolated func transition(_ t: AnyTransition) -> some View

```

### Discussion

When this view appears or disappears, the transition will be applied to it, allowing for animating it in and out.

The following code will conditionally show MyView, and when it appears or disappears, will use a slide transition to show it.

```swift
if isActive {
    MyView()
        .transition(.slide)
}
Button("Toggle") {
    withAnimation {
        isActive.toggle()
    }
}
```







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

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
- `MatchedTransitionSourceConfiguration`
