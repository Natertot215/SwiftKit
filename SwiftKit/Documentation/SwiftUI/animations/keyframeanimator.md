---
url: https://developer.apple.com/documentation/swiftui/keyframeanimator
framework: SwiftUI
category: Animations
title: KeyframeAnimator
kind: struct
captured: 2026-05-02
---

# KeyframeAnimator

A container that animates its content with keyframes.

## Declaration

```swift
struct KeyframeAnimator<Value, KeyframePath, Content> where Value == KeyframePath.Value, KeyframePath : Keyframes, Content : View
```

### Overview

The `content` closure updates every frame while animating, so avoid performing any expensive operations directly within `content`.





## Relationships

**Conforms To**: `View`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Creating a phase animator

- `init(initialValue:repeating:content:keyframes:)`
- `init(initialValue:trigger:content:keyframes:)`

## See Also

- `keyframeAnimator(initialValue:repeating:content:keyframes:)`
- `keyframeAnimator(initialValue:trigger:content:keyframes:)`
- `Keyframes`
- `KeyframeTimeline`
- `KeyframeTrack`
- `KeyframeTrackContentBuilder`
- `KeyframesBuilder`
- `KeyframeTrackContent`
- `CubicKeyframe`
- `LinearKeyframe`
- `MoveKeyframe`
- `SpringKeyframe`
