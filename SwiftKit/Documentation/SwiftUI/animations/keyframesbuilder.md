---
url: https://developer.apple.com/documentation/swiftui/keyframesbuilder
framework: SwiftUI
category: Animations
title: KeyframesBuilder
kind: struct
captured: 2026-05-02
---

# KeyframesBuilder

A builder that combines keyframe content values into a single value.

## Declaration

```swift
@resultBuilder struct KeyframesBuilder<Value>
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

### Building keyframes

- `buildArray(_:)`
- `buildBlock()`
- `buildEither(first:)`
- `buildEither(second:)`
- `buildExpression(_:)`
- `buildFinalResult(_:)`
- `buildPartialBlock(accumulated:next:)`
- `buildPartialBlock(first:)`

## See Also

- `keyframeAnimator(initialValue:repeating:content:keyframes:)`
- `keyframeAnimator(initialValue:trigger:content:keyframes:)`
- `KeyframeAnimator`
- `Keyframes`
- `KeyframeTimeline`
- `KeyframeTrack`
- `KeyframeTrackContentBuilder`
- `KeyframeTrackContent`
- `CubicKeyframe`
- `LinearKeyframe`
- `MoveKeyframe`
- `SpringKeyframe`
