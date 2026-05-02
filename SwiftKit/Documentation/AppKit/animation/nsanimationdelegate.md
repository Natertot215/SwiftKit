---
url: https://developer.apple.com/documentation/appkit/nsanimationdelegate
framework: AppKit
category: Animation
title: NSAnimationDelegate
kind: protocol
captured: 2026-05-02
---

# NSAnimationDelegate

A set of optional methods implemented by delegates of `NSAnimation` objects.

## Declaration

```swift
protocol NSAnimationDelegate : NSObjectProtocol
```







## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSTitlebarAccessoryViewController`

## Availability

- macOS ?

## Topics

### Controlling and Monitoring an Animation

- `animationDidEnd(_:)`
- `animationDidStop(_:)`
- `animationShouldStart(_:)`
- `animation(_:valueForProgress:)`

### Managing Progress Marks

- `animation(_:didReachProgressMark:)`

## See Also

- `NSAnimation`
