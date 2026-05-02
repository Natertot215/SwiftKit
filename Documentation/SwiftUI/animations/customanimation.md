---
url: https://developer.apple.com/documentation/swiftui/customanimation
framework: SwiftUI
category: Animations
title: CustomAnimation
kind: protocol
captured: 2026-05-01
---

# CustomAnimation

## Declaration

```swift
@preconcurrency protocol CustomAnimation : Hashable, Sendable
```

## Abstract

A type that defines how an animatable value changes over time.

## Overview

Use this protocol to create a type that changes an animatable value over time, which produces a custom visual transition of a view. For example, the follow code changes an animatable value using an elastic ease-in ease-out function:

```swift
struct ElasticEaseInEaseOutAnimation: CustomAnimation {
    let duration: TimeInterval

    func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
        if time > duration { return nil } // The animation has finished.

        let p = time / duration
        let s = sin((20 * p - 11.125) * ((2 * Double.pi) / 4.5))
        if p < 0.5 {
            return value.scaled(by: -(pow(2, 20 * p - 10) * s) / 2)
        } else {
            return value.scaled(by: (pow(2, -20 * p + 10) * s) / 2 + 1)
        }
    }
}
```

> **Note:** To maintain state during the life span of a custom animation, use the `state` property available on the `context` parameter value. You can also use context's `environment` property to retrieve environment values from the view that created the custom animation. For more information, see `AnimationContext`.

### Creating an Animation Instance

To create an `Animation` instance of a custom animation, use the `init(_:)` initializer:

```swift
Animation(ElasticEaseInEaseOutAnimation(duration: 5.0))
```

### Extension Pattern

To make view code more readable, extend `Animation` and add a static property and function:

```swift
extension Animation {
    static var elasticEaseInEaseOut: Animation { elasticEaseInEaseOut(duration: 0.35) }
    static func elasticEaseInEaseOut(duration: TimeInterval) -> Animation {
        Animation(ElasticEaseInEaseOutAnimation(duration: duration))
    }
}
```

### Usage Example

```swift
struct ElasticEaseInEaseOutView: View {
    @State private var isActive = false

    var body: some View {
        VStack(alignment: isActive ? .trailing : .leading) {
            Circle()
                .frame(width: 100.0)
                .foregroundColor(.accentColor)

            Button("Animate") {
                withAnimation(.elasticEaseInEaseOut(duration: 5.0)) {
                    isActive.toggle()
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
    }
}
```

## Topics

### Animating a Value
- `animate(value:time:context:)` — Calculates the value of the animation at the specified time.

### Getting the Velocity
- `velocity(value:time:context:)` — Calculates the velocity of the animation at a specified time.

### Determining Whether to Merge
- `shouldMerge(previous:value:time:context:)` — Determines whether an instance of the animation can merge with other instance of the same type.

## Availability

- **iOS** 17.0+
- **iPadOS** 17.0+
- **Mac Catalyst** 17.0+
- **macOS** 14.0+
- **tvOS** 17.0+
- **visionOS** 1.0+
- **watchOS** 10.0+

## See Also

### Creating custom animations
- `AnimationContext`
- `AnimationState`
- `AnimationStateKey`
- `UnitCurve`
- `Spring`
