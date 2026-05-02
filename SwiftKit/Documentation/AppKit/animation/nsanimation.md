---
url: https://developer.apple.com/documentation/appkit/nsanimation
framework: AppKit
category: Animation
title: NSAnimation
kind: class
captured: 2026-05-02
---

# NSAnimation

An object that manages the timing and progress of animations in the user interface.

## Declaration

```swift
class NSAnimation
```

### Overview

`NSAnimation` also lets you link together multiple animations so that when one animation ends another one starts. It does not provide any drawing support for animation and does not directly deal with views, targets, or actions.

> **NOTE:**  For simple tasks requiring a timing mechanism, consider using `Timer`.

`NSAnimation` objects have several characteristics, including duration, frame rate, and animation curve, which describes the relative speed of the animation over its course. You can set progress marks in an animation, each of which specifies a percentage of the animation completed; when an animation reaches a progress mark, it notifies its delegate and posts a notification to any observers. Animations execute in one of three blocking modes: blocking, non-blocking on the main thread, and non-blocking on a separate thread. The non-blocking modes permit the handling of user events while the animation is running.

#### Subclassing Notes

The usual usage pattern for `NSAnimation` is to make a subclass that overrides (at least) the `NSAnimation/currentProgress` property to invoke the superclass implementation and then perform whatever animation action is needed. The method implementation might use the `NSAnimation/currentValue` property and then use that value to update some drawing; as a consequence of getting the current value, the method `NSAnimationDelegate/animation(_:valueForProgress:)` is sent to the delegate (if there is a delegate that implements the method). For more information on subclassing `NSAnimation`, see `https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/AnimationGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40003592`.





## Relationships

**Inherits From**: `NSObject`

**Inherited By**: `NSViewAnimation`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Initializing an NSAnimation Object

- `init(duration:animationCurve:)`

### Configuring an Animation

- `animationBlockingMode`
- `runLoopModesForAnimating`
- `animationCurve`
- `duration`
- `frameRate`

### Managing the Delegate

- `delegate`

### Controlling and Monitoring an Animation

- `start()`
- `stop()`
- `isAnimating`
- `currentProgress`
- `currentValue`

### Managing Progress Marks

- `addProgressMark(_:)`
- `removeProgressMark(_:)`
- `progressMarks`

### Linking Animations Together

- `start(when:reachesProgress:)`
- `stop(when:reachesProgress:)`
- `clearStart()`
- `clearStop()`

### Constants

- `NSAnimation.Curve`
- `NSAnimation.BlockingMode`
- `NSAnimation.Progress`
- `NSAnimationProgressMark Notification Key`

### Notifications

- `progressMarkNotification`

### Initializers

- `init(coder:)`

## See Also

- `NSAnimationDelegate`
