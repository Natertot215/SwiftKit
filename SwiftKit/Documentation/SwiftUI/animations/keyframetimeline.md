---
url: https://developer.apple.com/documentation/swiftui/keyframetimeline
framework: SwiftUI
category: Animations
title: KeyframeTimeline
kind: struct
captured: 2026-05-01
---

# KeyframeTimeline

## Declaration

```swift
struct KeyframeTimeline<Value>
```

## Abstract

A description of how a value changes over time, modeled using keyframes.

## Overview

Unlike other animations in SwiftUI (using `Animation`), keyframes don't interpolate between from and to values that SwiftUI provides as state changes. Instead, keyframes fully define the path that a value takes over time using the tracks that make up their body.

`Keyframes` values are roughly analogous to video clips; they have a set duration, and you can scrub and evaluate them for any time within the duration.

The `Keyframes` structure also allows you to compute an interpolated value at a specific time, which you can use when integrating keyframes into custom use cases.

### Example Usage

For example, you can use a `Keyframes` instance to define animations for a type conforming to `Animatable`:

```swift
let keyframes = KeyframeTimeline(initialValue: CGPoint.zero) {
    CubicKeyframe(.init(x: 0, y: 100), duration: 0.3)
    CubicKeyframe(.init(x: 0, y: 0), duration: 0.7)
}

let value = keyframes.value(time: 0.45)
```

For animations that involve multiple coordinated changes, you can include multiple nested tracks:

```swift
struct Values {
    var rotation = Angle.zero
    var scale = 1.0
}

let keyframes = KeyframeTimeline(initialValue: Values()) {
    KeyframeTrack(\.rotation) {
        CubicKeyframe(.zero, duration: 0.2)
        CubicKeyframe(.degrees(45), duration: 0.3)
    }
    KeyframeTrack(\.scale) {
        CubicKeyframe(value: 1.2, duration: 0.5)
        CubicKeyframe(value: 0.9, duration: 0.2)
        CubicKeyframe(value: 1.0, duration: 0.3)
    }
}
```

Multiple nested tracks update the initial value in the order that they are declared. This means that if multiple nested plans change the same property of the root value, the value from the last competing track will be used.

## Topics

### Creating a keyframe timeline
- `init(initialValue:content:)` - Creates a new instance using the initial value and content that you provide.

### Getting the duration
- `duration` - The duration of the content in seconds.

### Getting an interpolated value
- `value(time:)` - Returns the interpolated value at the given time.
- `value(progress:)` - Returns the interpolated value at the given progress in the range zero to one.

## Availability

- **iOS** 17.0+
- **iPadOS** 17.0+
- **Mac Catalyst** 17.0+
- **macOS** 14.0+
- **tvOS** 17.0+
- **visionOS** 1.0+
- **watchOS** 10.0+

## See Also

### Creating keyframe-based animation
- `View.keyframeAnimator(initialValue:repeating:content:keyframes:)`
- `View.keyframeAnimator(initialValue:trigger:content:keyframes:)`
- `KeyframeAnimator`
- `Keyframes`
- `KeyframeTrack`
- `KeyframeTrackContentBuilder`
- `KeyframesBuilder`
- `KeyframeTrackContent`
- `CubicKeyframe`
- `LinearKeyframe`
- `MoveKeyframe`
- `SpringKeyframe`
