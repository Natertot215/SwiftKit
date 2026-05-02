---
url: https://developer.apple.com/documentation/swiftui/animation
framework: SwiftUI
category: Animations
title: Animation
kind: struct
captured: 2026-05-01
---

# Animation

## Declaration

```swift
@frozen struct Animation
```

## Abstract

The way a view changes over time to create a smooth visual transition from one state to another.

## Overview

An `Animation` provides a visual transition of a view when a state value changes from one value to another. The characteristics of this transition vary according to the animation type. For instance, a `linear` animation provides a mechanical feel to the animation because its speed is consistent from start to finish. In contrast, an animation that uses easing, like `easeOut`, offers a more natural feel by varying the acceleration of the animation.

### Applying Animations to Views

To apply an animation to a view, add the `animation(_:value:)` modifier, and specify both an animation type and the value to animate. For example, the `Circle` view in the following code performs an `easeIn` animation each time the state variable `scale` changes:

```swift
struct ContentView: View {
    @State private var scale = 0.5

    var body: some View {
        VStack {
            Circle()
                .scaleEffect(scale)
                .animation(.easeIn, value: scale)
            HStack {
                Button("+") { scale += 0.1 }
                Button("-") { scale -= 0.1 }
            }
        }
        .padding()
    }
}
```

When the value of `scale` changes, the modifier `scaleEffect(_:anchor:)` resizes `Circle` according to the new value. SwiftUI can animate the transition between sizes because `Circle` conforms to the `Shape` protocol. Shapes in SwiftUI conform to the `Animatable` protocol, which describes how to animate a property of a view.

### Configuring Animations

In addition to adding an animation to a view, you can also configure the animation by applying animation modifiers to the animation type. For example, you can:

- Delay the start of the animation by using the `delay(_:)` modifier.
- Repeat the animation by using the `repeatCount(_:autoreverses:)` or `repeatForever(autoreverses:)` modifiers.
- Change the speed of the animation by using the `speed(_:)` modifier.

For example, the `Circle` view in the following code repeats the `easeIn` animation three times by using the `repeatCount(_:autoreverses:)` modifier:

```swift
struct ContentView: View {
    @State private var scale = 0.5

    var body: some View {
        VStack {
            Circle()
                .scaleEffect(scale)
                .animation(.easeIn.repeatCount(3), value: scale)
            HStack {
                Button("+") { scale += 0.1 }
                Button("-") { scale -= 0.1 }
            }
        }
        .padding()
    }
}
```

### Animating Binding Changes

A view can also perform an animation when a binding value changes. To specify the animation type on a binding, call its `animation(_:)` method. For example, the view in the following code performs a `linear` animation, moving the box truck between the leading and trailing edges of the view. The truck moves each time a person clicks the `Toggle` control, which changes the value of the `$isTrailing` binding.

```swift
struct ContentView: View {
    @State private var isTrailing = false

    var body: some View {
       VStack(alignment: isTrailing ? .trailing : .leading) {
            Image(systemName: "box.truck")
                .font(.system(size: 64))

            Toggle("Move to trailing edge",
                   isOn: $isTrailing.animation(.linear))
        }
    }
}
```

## Availability

- **iOS** 13.0+
- **iPadOS** 13.0+
- **Mac Catalyst** 13.0+
- **macOS** 10.15+
- **tvOS** 13.0+
- **visionOS** 1.0+
- **watchOS** 6.0+

## Conforms To

- `Copyable`
- `CustomDebugStringConvertible`
- `CustomReflectable`
- `CustomStringConvertible`
- `Equatable`
- `Escapable`
- `Hashable`
- `Sendable`
- `SendableMetatype`

## See Also

- `withAnimation(_:_:)` — Returns the result of recomputing the view's body with the provided animation.
- `withAnimation(_:completionCriteria:_:completion:)` — Returns the result of recomputing the view's body with the provided animation, and runs the completion when all animations are complete.
- `AnimationCompletionCriteria` — The criteria that determines when an animation is considered finished.
