---
url: https://developer.apple.com/documentation/swiftui/spring
framework: SwiftUI
category: Animations
title: Spring
kind: struct
captured: 2026-05-01
---

# Spring

## Declaration

```swift
struct Spring
```

## Abstract

A representation of a spring's motion.

## Overview

Use this type to convert between different representations of spring parameters:

```swift
let spring = Spring(duration: 0.5, bounce: 0.3)
let (mass, stiffness, damping) = (spring.mass, spring.stiffness, spring.damping)
// (1.0, 157.9, 17.6)

let spring2 = Spring(mass: 1, stiffness: 100, damping: 10)
let (duration, bounce) = (spring2.duration, spring2.bounce)
// (0.63, 0.5)
```

You can also use it to query for a spring's position and its other properties for a given set of inputs:

```swift
func unitPosition(time: TimeInterval) -> Double {
    let spring = Spring(duration: 0.5, bounce: 0.3)
    return spring.position(target: 1.0, time: time)
}
```

## Initializers

- `init(duration:bounce:)` - Creates a spring with the specified duration and bounce.
- `init(mass:stiffness:damping:allowOverDamping:)` - Creates a spring with the specified mass, stiffness, and damping.
- `init(response:dampingRatio:)` - Creates a spring with the specified response and damping ratio.
- `init(settlingDuration:dampingRatio:epsilon:)` - Creates a spring with the specified duration and damping ratio.

## Built-in Springs

- `bouncy`, `bouncy(duration:extraBounce:)`
- `smooth`, `smooth(duration:extraBounce:)`
- `snappy`, `snappy(duration:extraBounce:)`

## Spring Characteristics

- `bounce: Double`
- `damping: Double`
- `dampingRatio: Double`
- `duration: TimeInterval`
- `mass: Double`
- `response: Double`
- `settlingDuration: TimeInterval`
- `stiffness: Double`

## Spring State

- `value(target:initialVelocity:time:)`
- `value(fromValue:toValue:initialVelocity:time:)`
- `velocity(target:initialVelocity:time:)`
- `velocity(fromValue:toValue:initialVelocity:time:)`

## Setting Spring State

- `update(value:velocity:target:deltaTime:)`

## Forces and Durations

- `force(target:position:velocity:)`
- `force(fromValue:toValue:position:velocity:)`
- `settlingDuration(target:initialVelocity:epsilon:)`
- `settlingDuration(fromValue:toValue:initialVelocity:epsilon:)`

## Availability

- **iOS** 17.0+
- **iPadOS** 17.0+
- **Mac Catalyst** 17.0+
- **macOS** 14.0+
- **tvOS** 17.0+
- **visionOS** 1.0+
- **watchOS** 10.0+

## Conformance

- `Equatable`
- `Hashable`
- `Sendable`

## See Also

- `CustomAnimation`
- `AnimationContext`
- `AnimationState`
- `AnimationStateKey`
- `UnitCurve`
