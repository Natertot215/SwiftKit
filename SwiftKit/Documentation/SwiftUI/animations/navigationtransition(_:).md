---
url: https://developer.apple.com/documentation/swiftui/view/navigationtransition(_:)
framework: SwiftUI
category: Animations
title: navigationTransition(_:)
kind: method
captured: 2026-05-02
---

# navigationTransition(_:)

Sets the navigation transition style for this view.

## Declaration

```swift
nonisolated func navigationTransition(_ style: some NavigationTransition) -> some View

```

### Discussion

Add this modifier to a view that appears within a `NavigationStack` or a sheet, outside of any containers such as `VStack`.

```swift
struct ContentView: View {
    @Namespace private var namespace
    var body: some View {
        NavigationStack {
            NavigationLink {
                DetailView()
                    .navigationTransition(.zoom(sourceID: "world", in: namespace))
            } label: {
                Image(systemName: "globe")
                    .matchedTransitionSource(id: "world", in: namespace)
            }
        }
    }
}
```







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
- `NavigationTransition`
- `matchedTransitionSource(id:in:)`
- `matchedTransitionSource(id:in:configuration:)`
- `MatchedTransitionSourceConfiguration`
