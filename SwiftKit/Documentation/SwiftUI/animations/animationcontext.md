---
url: https://developer.apple.com/documentation/swiftui/animationcontext
framework: SwiftUI
category: Animations
title: AnimationContext
kind: struct
captured: 2026-05-01
---

# AnimationContext

## Declaration

```swift
struct AnimationContext<Value> where Value : VectorArithmetic
```

## Abstract

Contextual values that a custom animation can use to manage state and access a view's environment.

## Overview

The system provides an `AnimationContext` to a `CustomAnimation` instance so that the animation can store and retrieve values in an instance of `AnimationState`. To access these values, use the context's `state` property.

For more convenient access to state, create an `AnimationStateKey` and extend `AnimationContext` to include a computed property that gets and sets the `AnimationState` value. Then use this property instead of `state` to retrieve the state of a custom animation. For example, the following code creates an animation state key named `PausableState`. Then the code extends `AnimationContext` to include the `pausableState` property:

```swift
private struct PausableState<Value: VectorArithmetic>: AnimationStateKey {
    var paused = false
    var pauseTime: TimeInterval = 0.0

    static var defaultValue: Self { .init() }
}

extension AnimationContext {
    fileprivate var pausableState: PausableState<Value> {
        get { state[PausableState<Value>.self] }
        set { state[PausableState<Value>.self] = newValue }
    }
}
```

To access the pausable state, the custom animation `PausableAnimation` uses the `pausableState` property instead of the `state` property:

```swift
struct PausableAnimation: CustomAnimation {
    let base: Animation

    func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
        let paused = context.environment.animationPaused

        let pausableState = context.pausableState
        var pauseTime = pausableState.pauseTime
        if pausableState.paused != paused {
            pauseTime = time - pauseTime
            context.pausableState = PausableState(paused: paused, pauseTime: pauseTime)
        }

        let effectiveTime = paused ? pauseTime : time - pauseTime
        let result = base.animate(value: value, time: effectiveTime, context: &context)
        return result
    }
}
```

The animation can also retrieve environment values of the view that created the animation. To retrieve a view's environment value, use the context's `environment` property. For instance, the following code creates a custom `EnvironmentValues` property named `animationPaused`, and the view `PausableAnimationView` uses the property to store the paused state:

```swift
extension EnvironmentValues {
    @Entry var animationPaused: Bool = false
}

struct PausableAnimationView: View {
    @State private var paused = false

    var body: some View {
        VStack {
            ...
        }
        .environment(\.animationPaused, paused)
    }
}
```

Then the custom animation `PausableAnimation` retrieves the paused state from the view's environment using the `environment` property:

```swift
struct PausableAnimation: CustomAnimation {
    func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
        let paused = context.environment.animationPaused
        ...
    }
}
```

## Topics

### Managing state
- `state`: The current state of a custom animation.

### Retrieving view environment values
- `environment`: The current environment of the view that created the custom animation.

### Creating context
- `withState(_:)`: Creates a new context from another one with a state that you provide.

### Instance Properties
- `isLogicallyComplete`: Set this to `true` to indicate that an animation is logically complete.

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
- `CustomAnimation`
- `AnimationState`
- `AnimationStateKey`
- `UnitCurve`
- `Spring`
