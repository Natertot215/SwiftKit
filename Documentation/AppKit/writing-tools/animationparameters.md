---
url: https://developer.apple.com/documentation/appkit/nswritingtoolscoordinator/animationparameters
framework: AppKit
category: Writing Tools
title: NSWritingToolsCoordinator.AnimationParameters
kind: class
captured: 2026-05-02
---

# NSWritingToolsCoordinator.AnimationParameters

An object you use to configure additional tasks or animations to run alongside the Writing Tools animations.

## Declaration

```swift
class AnimationParameters
```

### Overview

When Writing Tools replaces text in one of your context objects, it provides an `NSWritingToolsCoordinator.AnimationParameters` object for you to use to configure any additional animations. During a Writing Tools session, you hide the text under evaluation and provide a targeted preview of your content. Writing Tools animations changes to that preview, but you might need to provide additional animations for other parts of your view’s content. For example, you might need to animate any layout changes caused by the insertion or removal of text in other parts of your view. Use this object to configure those animations.

You don’t create an `NSWritingToolsCoordinator.AnimationParameters` object directly. Instead, the system creates one and passes it to the `NSWritingToolsCoordinator/Delegate-swift.protocol/writingToolsCoordinator(_:replace:in:proposedText:reason:animationParameters:completion:)` method of your `NSWritingToolsCoordinator/Delegate-swift.protocol` object. Use that object to specify the blocks to run during and after the system animations.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 15.2

## Topics

### Getting the animation values

- `duration`
- `delay`

### Creating custom animations

- `progressHandler`
- `completionHandler`

## See Also

- `Supporting Writing Tools via the pasteboard`
- `Adding Writing Tools support to a custom AppKit view`
- `NSWritingToolsCoordinator`
- `NSWritingToolsCoordinator.Delegate`
- `NSWritingToolsCoordinator.Context`
- `Enhancing your custom text engine with Writing Tools`
