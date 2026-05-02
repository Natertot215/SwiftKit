---
url: https://developer.apple.com/documentation/swiftui/view/contenttransition(_:)
framework: SwiftUI
category: Animations
title: contentTransition(_:)
kind: method
captured: 2026-05-02
---

# contentTransition(_:)

Modifies the view to use a given transition as its method of animating changes to the contents of its views.

## Declaration

```swift
nonisolated func contentTransition(_ transition: ContentTransition) -> some View

```

### Discussion

This modifier allows you to perform a transition that animates a change within a single view. The provided `ContentTransition` can present an opacity animation for content changes, an interpolated animation of the content’s paths as they change, or perform no animation at all.

> **TIP:** The `contentTransition(_:)` modifier only has an effect within the context of an `Animation`.

In the following example, a `Button` changes the color and font size of a `Text` view. Since both of these properties apply to the paths of the text, the `ContentTransition/interpolate` transition can animate a gradual change to these properties through the entire transition. By contrast, the `ContentTransition/opacity` transition would simply fade between the start and end states.

```swift
private static let font1 = Font.system(size: 20)
private static let font2 = Font.system(size: 45)

@State private var color = Color.red
@State private var currentFont = font1

var body: some View {
    VStack {
        Text("Content transition")
            .foregroundColor(color)
            .font(currentFont)
            .contentTransition(.interpolate)
        Spacer()
        Button("Change") {
            withAnimation(Animation.easeInOut(duration: 5.0)) {
                color = (color == .red) ? .green : .red
                currentFont = (currentFont == font1) ? font2 : font1
            }
        }
    }
}
```

This example uses an ease-in–ease-out animation with a five-second duration to make it easier to see the effect of the interpolation. The figure below shows the `Text` at the beginning of the animation, halfway through, and at the end.

[table — see source]

To control whether content transitions use GPU-accelerated rendering, set the value of the `EnvironmentValues/contentTransitionAddsDrawingGroup` environment variable.

## Parameters

- **transition**: The transition to apply when animating the content change.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `transition(_:)`
- `Transition`
- `TransitionProperties`
- `TransitionPhase`
- `AsymmetricTransition`
- `AnyTransition`
- `contentTransition`
- `contentTransitionAddsDrawingGroup`
- `ContentTransition`
- `PlaceholderContentView`
- `navigationTransition(_:)`
- `NavigationTransition`
- `matchedTransitionSource(id:in:)`
- `matchedTransitionSource(id:in:configuration:)`
- `MatchedTransitionSourceConfiguration`
