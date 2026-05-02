---
url: https://developer.apple.com/documentation/appkit/nswritingtoolscoordinator/delegate-swift.protocol
framework: AppKit
category: Writing Tools
title: NSWritingToolsCoordinator.Delegate
kind: protocol
captured: 2026-05-02
---

# NSWritingToolsCoordinator.Delegate

An interface that you use to manage interactions between Writing Tools and your custom text view.

## Declaration

```swift
protocol Delegate : NSObjectProtocol
```

### Overview

Adopt the `NSWritingToolsCoordinator.Delegate` protocol in the type you use to manage your custom text view. When you add a `NSWritingToolsCoordinator` object to your view, the coordinator uses this protocol to communicate with that view. The protocol lets Writing Tools fetch your view’s text, report suggested changes back to your view, and deliver visual feedback when Writing Tools features are active. Make sure the type that adopts this protocol has access to your view’s text storage and can perform relevant tasks on behalf of the view.

Writing Tools expects you to call the provided handler blocks at the end of your delegate methods. It’s crucial that you execute these blocks in a timely manner to allow Writing Tools to perform subsequent tasks. For example, Writing Tools waits for you to execute the handlers for animation-related methods before moving on to the next stage of the animations.





## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS 15.2

## Topics

### Starting a Writing Tools operation

- `writingToolsCoordinator(_:requestsContextsFor:completion:)`

### Incorporating Writing Tools suggestions

- `writingToolsCoordinator(_:replace:in:proposedText:reason:animationParameters:completion:)`
- `writingToolsCoordinator(_:select:in:completion:)`

### Responding to lifecycle changes

- `writingToolsCoordinator(_:willChangeTo:completion:)`

### Animating inline text changes

- `writingToolsCoordinator(_:requestsPreviewFor:of:in:completion:)`
- `writingToolsCoordinator(_:requestsPreviewFor:in:completion:)`
- `writingToolsCoordinator(_:prepareFor:for:in:completion:)`
- `writingToolsCoordinator(_:finish:for:in:completion:)`

### Displaying proofreading marks

- `writingToolsCoordinator(_:requestsRangeInContextWithIdentifierFor:completion:)`
- `writingToolsCoordinator(_:requestsBoundingBezierPathsFor:in:completion:)`
- `writingToolsCoordinator(_:requestsUnderlinePathsFor:in:completion:)`

### Providing animation container views dynamically

- `writingToolsCoordinator(_:requestsSingleContainerSubrangesOf:in:completion:)`
- `writingToolsCoordinator(_:requestsDecorationContainerViewFor:in:completion:)`

## See Also

- `Supporting Writing Tools via the pasteboard`
- `Adding Writing Tools support to a custom AppKit view`
- `NSWritingToolsCoordinator`
- `NSWritingToolsCoordinator.Context`
- `NSWritingToolsCoordinator.AnimationParameters`
- `Enhancing your custom text engine with Writing Tools`
