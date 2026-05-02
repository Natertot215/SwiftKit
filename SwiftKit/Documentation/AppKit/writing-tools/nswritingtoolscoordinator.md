---
url: https://developer.apple.com/documentation/appkit/nswritingtoolscoordinator
framework: AppKit
category: Writing Tools
title: NSWritingToolsCoordinator
kind: class
captured: 2026-05-02
---

# NSWritingToolsCoordinator

An object that manages interactions between Writing Tools and your custom text view.

## Declaration

```swift
@MainActor class NSWritingToolsCoordinator
```

### Overview

Add a `NSWritingToolsCoordinator` object to a custom view when you want to add Writing Tools support to that view. The coordinator manages interactions between your view and the Writing Tools UI and back-end capabilities. When creating a coordinator, you supply a delegate object to respond to requests from the system and provide needed information. Your delegate delivers your view’s text to Writing Tools, incorporates suggested changes back into your text storage, and supports the animations that Writing Tools creates to show the state of an operation.

Create the `NSWritingToolsCoordinator` object when setting up your UI, and initialize it with a custom object that adopts the `NSWritingToolsCoordinator/Delegate-swift.protocol` protocol. Add the coordinator to the `NSView/writingToolsCoordinator` property of your view. When a coordinator is present on a view, the system adds UI elements to initiate Writing Tools operations.

When defining the delegate, choose an object from your app that has access to your view and its text storage. You can adopt the `NSWritingToolsCoordinator/Delegate-swift.protocol` protocol in the view itself, or in another type that your view uses to manage content. During the interactions with Writing Tools, the delegate gets and sets the contents of the view’s text storage and supports Writing Tools behaviors.

> **NOTE:** You don’t need to create an `NSWritingToolsCoordinator`  object if you display text using a `UITextView`, `NSTextField`, `NSTextView`, `TextField`, or `TextEditor` view. Those views already include the required support to handle Writing Tools interactions.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS 15.2

## Topics

### Creating a coordinator object

- `init(delegate:)`

### Checking the availability of Writing Tools

- `isWritingToolsAvailable`

### Managing Writing Tools interactions

- `delegate`
- `NSWritingToolsCoordinator.Delegate`
- `view`

### Getting the host views for effects

- `effectContainerView`
- `decorationContainerView`

### Configuring the experience

- `preferredBehavior`
- `behavior`
- `preferredResultOptions`
- `resultOptions`

### Reporting changes to Writing Tools

- `updateRange(_:with:reason:forContextWithIdentifier:)`
- `updateForReflowedTextInContextWithIdentifier(_:)`
- `NSWritingToolsCoordinator.TextUpdateReason`

### Managing the current state

- `stopWritingTools()`
- `state`
- `NSWritingToolsCoordinator.State`

### Getting the supporting types

- `NSWritingToolsCoordinator.ContextScope`
- `NSWritingToolsCoordinator.TextReplacementReason`
- `NSWritingToolsCoordinator.TextAnimation`

### Instance Properties

- `includesTextListMarkers`

## See Also

- `Supporting Writing Tools via the pasteboard`
- `Adding Writing Tools support to a custom AppKit view`
- `NSWritingToolsCoordinator.Delegate`
- `NSWritingToolsCoordinator.Context`
- `NSWritingToolsCoordinator.AnimationParameters`
- `Enhancing your custom text engine with Writing Tools`
