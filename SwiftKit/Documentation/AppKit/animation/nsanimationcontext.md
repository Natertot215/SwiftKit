---
url: https://developer.apple.com/documentation/appkit/nsanimationcontext
framework: AppKit
category: Animation
title: NSAnimationContext
kind: class
captured: 2026-05-01
---

# NSAnimationContext

## Declaration

```swift
class NSAnimationContext
```

## Abstract

An animation context, which contains information about environment and state.

## Overview

`NSAnimationContext` is analogous to `CATransaction` and is similar in overall concept to `NSGraphicsContext`. Each thread maintains its own stack of nestable `NSAnimationContext` instances, with each new instance initialized as a copy of the instance below (so, inheriting its current properties).

Multiple `NSAnimationContext` instances can be nested, allowing a given block of code to initiate animations using its own specified duration without affecting animations initiated by surrounding code.

### Example Usage

```objc
[NSAnimationContext beginGrouping];
// Animate enclosed operations with a duration of 1 second
[[NSAnimationContext currentContext] setDuration:1.0];
[[aView animator] setFrame:newFrame];
...
    [NSAnimationContext beginGrouping];
    // Animate alpha fades with half-second duration
    [[NSAnimationContext currentContext] setDuration:0.5];
    [[aView animator] setAlphaValue:0.75];
    [[bView animator] setAlphaValue:0.75];
    [NSAnimationContext endGrouping];
...
// Will animate with a duration of 1 second
[[bView animator] setFrame:secondFrame];
[NSAnimationContext endGrouping];
```

## Topics

### Grouping Transactions
- `beginGrouping()` - Creates a new animation grouping
- `endGrouping()` - Ends the current animation grouping

### Getting the Current Animation Context
- `current` - Returns the current animation context

### Animation Completion Handlers
- `completionHandler` - A completion block called when animations in the grouping are completed
- `runAnimationGroup(_:completionHandler:)` - Specify a completion block after animation actions

### Modifying the Animation Duration
- `duration` - The duration used by animations created from animatable property changes
- `timingFunction` - The timing function used for all animations within this animation proxy group

### Implicit Animation
- `allowsImplicitAnimation` - Determine if animations are enabled for property changes

### Type Methods
- `runAnimationGroup(_:)` - Run animation with a closure
- `animate(_:changes:completion:)` - Animate changes using SwiftUI animation

## Inheritance

Inherits from `NSObject`

## Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSObjectProtocol`

## Availability

- macOS 10.5+

## See Also

- `NSViewAnimation` - Animation of app's views for frame and fade changes
- `NSAnimatablePropertyContainer` - Protocol defining animation capabilities
- `NSAnimation.Progress` - Animation progress as a floating-point value (0.0-1.0)
- `NSAnimationEffect` - Standard system animation effects (deprecated)
