---
url: https://developer.apple.com/documentation/appkit/nsanimatablepropertycontainer
framework: AppKit
category: Animation
title: NSAnimatablePropertyContainer
kind: protocol
captured: 2026-05-01
---

# NSAnimatablePropertyContainer

## Declaration

```swift
protocol NSAnimatablePropertyContainer
```

## Abstract

A set of methods that defines a way to add animation to an existing class with a minimum of API impact.

## Overview

The `NSAnimatablePropertyContainer` protocol returns a proxy object for the receiver that can be used to initiate implied animation of property changes. An object's animator proxy should be treated as if it was the object itself, and may be passed to any code that accepts the object as a parameter. Sending of key-value-coding compliant "set" messages to the proxy will trigger animation for automatically animated properties of its target object.

An object's automatically animated properties are those for which `NSAnimatablePropertyContainer` finds and returns a `CAAnimation` object instead of `nil`, often because `animator()` specifies a default animation for the key.

It's perfectly valid to set a new value for a property for which an animation that is currently in progress; this simply sets a new target value for that property, with animation to the new target proceeding from whatever current value the property has reached. An in-flight property animation can be stopped by setting a new value for the property bracketed by an `NSAnimationContext` with 0.0 as the duration.

## Topics

### Getting the Animator Proxy

- `animator()` — Returns a proxy object for the receiver that can be used to initiate implied animation for property changes.

### Managing Animations for Properties

- `animations` — Sets the option dictionary that maps event trigger keys to animation objects.
- `animation(forKey:)` — Returns the animation that should be performed for the specified key.
- `defaultAnimation(forKey:)` — Returns the default animation that should be performed for the specified key.
- `NSAnimatablePropertyKey` — Type alias for animation property keys.

### Constants

- Transition Animation Keys — Keys that reference transitions used as views are made visible and hidden.

## Availability

- **macOS**: 10.5+
- **Mac Catalyst**: 13.1+

## Conforming Types

Over 70 AppKit classes conform to this protocol, including:
- `NSView`
- `NSWindow`
- `NSControl`
- `NSTableView`
- `NSCollectionView`
- And many others

## See Also

### View-Based Animations

- `NSViewAnimation` — Animation of an app's views, limited to changes in frame location and size, and to fade-in and fade-out effects.
- `NSAnimationContext` — An animation context, which contains information about environment and state.
- `NSAnimation.Progress` — The animation progress, as a floating-point number between 0.0 and 1.0.
- `NSAnimationEffect` — The type for standard system animation effects, which include both display and sound.
