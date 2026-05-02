---
url: https://developer.apple.com/documentation/swiftui/linearkeyframe
framework: SwiftUI
category: Animations
title: LinearKeyframe
kind: struct
captured: 2026-05-02
---

# LinearKeyframe

A keyframe that uses simple linear interpolation.

## Declaration

```swift
struct LinearKeyframe<Value> where Value : Animatable
```







## Relationships

**Conforms To**: `KeyframeTrackContent`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Creating the keyframe

- `init(_:duration:timingCurve:)`

## See Also

- `keyframeAnimator(initialValue:repeating:content:keyframes:)`
- `keyframeAnimator(initialValue:trigger:content:keyframes:)`
- `KeyframeAnimator`
- `Keyframes`
- `KeyframeTimeline`
- `KeyframeTrack`
- `KeyframeTrackContentBuilder`
- `KeyframesBuilder`
- `KeyframeTrackContent`
- `CubicKeyframe`
- `MoveKeyframe`
- `SpringKeyframe`
