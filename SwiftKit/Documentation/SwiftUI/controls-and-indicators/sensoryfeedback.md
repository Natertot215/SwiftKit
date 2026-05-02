---
url: https://developer.apple.com/documentation/swiftui/sensoryfeedback
framework: SwiftUI
category: Controls and indicators
title: SensoryFeedback
kind: struct
captured: 2026-05-01
---

# SensoryFeedback

## Declaration

```swift
struct SensoryFeedback
```

## Abstract

Represents a type of haptic and/or audio feedback that can be played.

## Overview

This feedback can be passed to `View.sensoryFeedback` to play it.

## Conformance

- `Equatable`
- `Sendable`
- `SendableMetatype`

## Availability

| Platform | Introduced |
|----------|------------|
| iOS | 17.0 |
| iPadOS | 17.0 |
| Mac Catalyst | 17.0 |
| macOS | 14.0 |
| tvOS | 17.0 |
| visionOS | 26.0 |
| watchOS | 10.0 |

## Topics

### Indicating start and stop
- `start` - Indicates that an activity started.
- `stop` - Indicates that an activity stopped.

### Indicating changes and selections
- `alignment` - Indicates the alignment of a dragged item.
- `decrease` - Indicates that an important value decreased below a significant threshold.
- `increase` - Indicates that an important value increased above a significant threshold.
- `levelChange` - Indicates movement between discrete levels of pressure.
- `selection` - Indicates that a UI element's values are changing.
- `pathComplete` - Indicates a drawn path has completed and/or recognized.

### Indicating the outcome of an operation
- `success` - Indicates that a task or action has completed.
- `warning` - Indicates that a task or action has produced a warning of some kind.
- `error` - Indicates that an error has occurred.

### Producing a physical impact
- `impact` - Provides a physical metaphor you can use to complement a visual experience.
- `impact(weight:intensity:)` - Provides a physical metaphor with specified weight and intensity.
- `impact(flexibility:intensity:)` - Provides a physical metaphor with specified flexibility and intensity.
- `Weight` - The weight to be represented by a type of feedback.
- `Flexibility` - The flexibility to be represented by a type of feedback.

### Structures
- `PressFeedback` - Feedback that can be played in response to a press (touch down) on a control.
- `ReleaseFeedback` - Feedback that can be played in response to a release (touch up) of a control.
- `SelectionFeedback` - Feedback that can be played in response to a specific UI element's values changing.

### Type Methods
- `press(_:)` - Plays feedback in response to a specific UI element being pressed (touch down).
- `release(_:)` - Plays feedback in response to a specific UI element being released (touch up).
- `selection(_:)` - Plays feedback in response to a specific UI element's values changing.

## See Also

### Providing haptic feedback
- `View.sensoryFeedback(_:trigger:)` - Plays the specified feedback when the provided trigger value changes.
- `View.sensoryFeedback(trigger:_:)` - Plays feedback when returned from the feedback closure after the provided trigger value changes.
- `View.sensoryFeedback(_:trigger:condition:)` - Plays the specified feedback when the provided trigger value changes and the condition closure returns true.
