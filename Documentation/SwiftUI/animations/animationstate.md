---
url: https://developer.apple.com/documentation/swiftui/animationstate
framework: SwiftUI
category: Animations
title: AnimationState
kind: struct
captured: 2026-05-01
---

# AnimationState

## Declaration

```swift
struct AnimationState<Value> where Value : VectorArithmetic
```

## Abstract

A container that stores the state for a custom animation.

## Overview

An `AnimationContext` uses this type to store state for a `CustomAnimation`. To retrieve the stored state of a context, you can use the `state` property. However, a more convenient way to access the animation state is to define an `AnimationStateKey` and extend `AnimationContext` with a computed property that gets and sets the animation state:

```swift
private struct PausableState<Value: VectorArithmetic>: AnimationStateKey {
    static var defaultValue: Self { .init() }
}

extension AnimationContext {
    fileprivate var pausableState: PausableState<Value> {
        get { state[PausableState<Value>.self] }
        set { state[PausableState<Value>.self] = newValue }
    }
}
```

When creating an `AnimationStateKey`, it's convenient to define the state values that your custom animation needs:

```swift
private struct PausableState<Value: VectorArithmetic>: AnimationStateKey {
    var paused = false
    var pauseTime: TimeInterval = 0.0

    static var defaultValue: Self { .init() }
}
```

To access the pausable state in a `PausableAnimation`, call `pausableState` instead of using the context's `state` property:

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

### Storing state for secondary animations

A custom animation can also use `AnimationState` to store the state of a secondary animation:

```swift
private struct TargetState<Value: VectorArithmetic>: AnimationStateKey {
    var timeDelta = 0.0
    var valueDelta = Value.zero
    var secondaryState: AnimationState<Value>? = .init()

    static var defaultValue: Self { .init() }
}

extension AnimationContext {
    fileprivate var targetState: TargetState<Value> {
        get { state[TargetState<Value>.self] }
        set { state[TargetState<Value>.self] = newValue }
    }
}
```

## Availability

| Platform | Introduced |
|----------|-----------|
| iOS | 17.0 |
| iPadOS | 17.0 |
| Mac Catalyst | 17.0 |
| macOS | 14.0 |
| tvOS | 17.0 |
| visionOS | 1.0 |
| watchOS | 10.0 |

## See Also

- `CustomAnimation`
- `AnimationContext`
- `AnimationStateKey`
- `UnitCurve`
- `Spring`
