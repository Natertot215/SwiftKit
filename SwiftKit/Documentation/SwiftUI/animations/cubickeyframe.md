---
url: https://developer.apple.com/documentation/swiftui/cubickeyframe
framework: SwiftUI
category: Animations
title: CubicKeyframe
kind: struct
captured: 2026-05-02
---

# CubicKeyframe

A keyframe that uses a cubic curve to smoothly interpolate between values.

## Declaration

```swift
struct CubicKeyframe<Value> where Value : Animatable
```

### Overview

If you don’t specify a start or end velocity, SwiftUI automatically computes a curve that maintains smooth motion between keyframes.

Adjacent cubic keyframes result in a Catmull-Rom spline.

If a cubic keyframe follows a different type of keyframe, such as a linear keyframe, the end velocity of the segment defined by the previous keyframe will be used as the starting velocity.

Likewise, if a cubic keyframe is followed by a different type of keyframe, the initial velocity of the next segment is used as the end velocity of the segment defined by this keyframe.





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

- `init(_:duration:startVelocity:endVelocity:)`

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
- `LinearKeyframe`
- `MoveKeyframe`
- `SpringKeyframe`
