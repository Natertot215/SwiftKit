---
url: https://developer.apple.com/documentation/swiftui/keyframetrackcontentbuilder
framework: SwiftUI
category: Animations
title: KeyframeTrackContentBuilder
kind: struct
captured: 2026-05-02
---

# KeyframeTrackContentBuilder

The builder that creates keyframe track content from the keyframes that you define within a closure.

## Declaration

```swift
@resultBuilder struct KeyframeTrackContentBuilder<Value> where Value : Animatable
```









## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Building keyframe track content

- `buildArray(_:)`
- `buildBlock()`
- `buildEither(first:)`
- `buildEither(second:)`
- `buildExpression(_:)`
- `buildPartialBlock(accumulated:next:)`
- `buildPartialBlock(first:)`
- `KeyframeTrackContentBuilder.Conditional`

## See Also

- `keyframeAnimator(initialValue:repeating:content:keyframes:)`
- `keyframeAnimator(initialValue:trigger:content:keyframes:)`
- `KeyframeAnimator`
- `Keyframes`
- `KeyframeTimeline`
- `KeyframeTrack`
- `KeyframesBuilder`
- `KeyframeTrackContent`
- `CubicKeyframe`
- `LinearKeyframe`
- `MoveKeyframe`
- `SpringKeyframe`
