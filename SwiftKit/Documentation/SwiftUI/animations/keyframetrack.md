---
url: https://developer.apple.com/documentation/swiftui/keyframetrack
framework: SwiftUI
category: Animations
title: KeyframeTrack
kind: struct
captured: 2026-05-02
---

# KeyframeTrack

A sequence of keyframes animating a single property of a root type.

## Declaration

```swift
struct KeyframeTrack<Root, Value, Content> where Value == Content.Value, Content : KeyframeTrackContent
```







## Relationships

**Conforms To**: `Keyframes`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Creating a keyframe track

- `init(content:)`
- `init(_:content:)`

## See Also

- `keyframeAnimator(initialValue:repeating:content:keyframes:)`
- `keyframeAnimator(initialValue:trigger:content:keyframes:)`
- `KeyframeAnimator`
- `Keyframes`
- `KeyframeTimeline`
- `KeyframeTrackContentBuilder`
- `KeyframesBuilder`
- `KeyframeTrackContent`
- `CubicKeyframe`
- `LinearKeyframe`
- `MoveKeyframe`
- `SpringKeyframe`
