---
url: https://developer.apple.com/documentation/appkit/nsanimationeffect
framework: AppKit
category: Animation
title: NSAnimationEffect
kind: enum
captured: 2026-05-02
---

# NSAnimationEffect

The type for standard system animation effects, which include both display and sound.

## Declaration

```swift
enum NSAnimationEffect
```

### Overview

These effects are used to indicate that an item was removed from a collection, such as a toolbar, without deleting the underlying data. See `NSShowAnimationEffect`.





## Relationships

**Conforms To**: `BitwiseCopyable`, `Equatable`, `Hashable`, `RawRepresentable`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.3 (deprecated 14.0)

## Topics

### Constants

- `NSAnimationEffect.disappearingItemDefault`
- `NSAnimationEffect.poof`

### Instance Methods

- `show(centeredAt:size:completionHandler:)`

### Initializers

- `init(rawValue:)`

## See Also

- `NSViewAnimation`
- `NSAnimatablePropertyContainer`
- `NSAnimationContext`
- `NSAnimation.Progress`
