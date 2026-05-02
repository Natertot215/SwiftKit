---
url: https://developer.apple.com/documentation/appkit/nsgesturerecognizerdelegate
framework: AppKit
category: Gestures
title: NSGestureRecognizerDelegate
kind: protocol
captured: 2026-05-02
---

# NSGestureRecognizerDelegate

A set of methods for fine-tuning a gesture recognizer’s behavior.

## Declaration

```swift
protocol NSGestureRecognizerDelegate : NSObjectProtocol
```

### Overview

Use the methods in this protocol to establish dynamic dependencies between gesture recognizers and to prevent a single gesture recognizer from acting at all.





## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Regulating Gesture Recognition

- `gestureRecognizer(_:shouldAttemptToRecognizeWith:)`
- `gestureRecognizerShouldBegin(_:)`

### Controlling Simultaneous Gesture Recognition

- `gestureRecognizer(_:shouldRecognizeSimultaneouslyWith:)`

### Setting Up Failure Requirements

- `gestureRecognizer(_:shouldRequireFailureOf:)`
- `gestureRecognizer(_:shouldBeRequiredToFailBy:)`

### Instance Methods

- `gestureRecognizer(_:shouldReceive:)`

## See Also

- `NSGestureRecognizer`
