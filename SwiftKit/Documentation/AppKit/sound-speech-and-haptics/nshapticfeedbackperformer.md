---
url: https://developer.apple.com/documentation/appkit/nshapticfeedbackperformer
framework: AppKit
category: Sound, speech, and haptics
title: NSHapticFeedbackPerformer
kind: protocol
captured: 2026-05-02
---

# NSHapticFeedbackPerformer

A set of methods and constants that a haptic feedback performer implements.

## Declaration

```swift
protocol NSHapticFeedbackPerformer : NSObjectProtocol
```

### Overview

To retrieve a haptic feedback performer object based on the current input device, accessibility settings, and user preferences, call the `NSHapticFeedbackManager/defaultPerformer` method of the `NSHapticFeedbackManager` class.

To provide the user with haptic feedback while using a Force Touch trackpad, call the `NSHapticFeedbackPerformer/perform(_:performanceTime:)` method of this protocol.

> **IMPORTANT:**  Haptic feedback is intended to be provided in response to a user action, such as aligning one object to another. Do not use it to provide feedback for events that are not user initiated. Excessive or unnecessary haptic feedback could be interpreted by the user as a malfunction and could encourage the user to disable haptic feedback entirely.





## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Performing Haptic Feedback

- `perform(_:performanceTime:)`

### Constants

- `NSHapticFeedbackManager.FeedbackPattern`
- `NSHapticFeedbackManager.PerformanceTime`

## See Also

- `NSHapticFeedbackManager`
- `NSAlignmentFeedbackToken`
- `NSAlignmentFeedbackFilter`
