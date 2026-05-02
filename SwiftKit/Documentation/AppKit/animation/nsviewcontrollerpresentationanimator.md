---
url: https://developer.apple.com/documentation/appkit/nsviewcontrollerpresentationanimator
framework: AppKit
category: Animation
title: NSViewControllerPresentationAnimator
kind: protocol
captured: 2026-05-02
---

# NSViewControllerPresentationAnimator

A set of methods that let you define animations to play when transitioning between two view controllers.

## Declaration

```swift
protocol NSViewControllerPresentationAnimator : NSObjectProtocol
```

### Overview

Implement this protocol only if you want to provide custom animations. You might find what you need in the `NSViewController/TransitionOptions` enumeration, which provides many predefined animations.

A class that adopts this protocol is responsible for both presenting and dismissing a view controller.





## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Animating Presentation and Dismissal of View Controllers

- `animatePresentation(of:from:)`
- `animateDismissal(of:from:)`
