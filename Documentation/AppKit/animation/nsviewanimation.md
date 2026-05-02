---
url: https://developer.apple.com/documentation/appkit/nsviewanimation
framework: AppKit
category: Animation
title: NSViewAnimation
kind: class
captured: 2026-05-02
---

# NSViewAnimation

An animation of an app’s views, limited to changes in frame location and size, and to fade-in and fade-out effects.

## Declaration

```swift
class NSViewAnimation
```

### Overview

An `NSViewAnimation` object takes an array of dictionaries from which it determines the objects to animate and the effects to apply to them. Each dictionary must have a target object and, optionally, properties that specify beginning and ending frame and whether to fade in or fade out. (See `NSViewAnimation/Key` for further information.) Animations with `NSViewAnimation` are, by default, in non-blocking mode over a duration of 0.5 seconds using the ease in-out animation curve. But you can configure the animation to have any duration, curve, frame rate, and blocking mode. You may also set progress marks, assign a delegate, and implement delegation methods in order to animate view and windows concurrent with the ones specified as targets in the view-animation dictionary.

Invoking the `NSAnimation` `NSAnimation/stop()` method on a running `NSViewAnimation` object moves the animation to the end frame.





## Relationships

**Inherits From**: `NSAnimation`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Initializing an NSViewAnimation object

- `init(viewAnimations:)`

### Getting and setting view-animation dictionaries

- `viewAnimations`
- `NSViewAnimation.Key`
- `NSViewAnimation.EffectName`

## See Also

- `NSAnimatablePropertyContainer`
- `NSAnimationContext`
- `NSAnimation.Progress`
- `NSAnimationEffect`
