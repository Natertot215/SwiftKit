---
url: https://developer.apple.com/documentation/appkit/nstitlebaraccessoryviewcontroller
framework: AppKit
category: View management
title: NSTitlebarAccessoryViewController
kind: class
captured: 2026-05-02
---

# NSTitlebarAccessoryViewController

An object that manages a custom view—known as an accessory view—in the title bar–toolbar area of a window.

## Declaration

```swift
class NSTitlebarAccessoryViewController
```

### Overview

Because a title bar accessory view controller is contained in a visual effect view (that is, `NSVisualEffectView`), it automatically handles the blur behind the accessory view and the size and location changes for the content of the view when a window goes in and out of full screen mode. If you’re currently using `NSToolbar` fullscreen accessory APIs, such as `NSToolbar/fullScreenAccessoryView`, you should use `NSTitlebarAccessoryViewController` APIs instead.

Typically, you create an `NSTitlebarAccessoryViewController` object, give it your custom view, set the `NSTitlebarAccessoryViewController/layoutAttribute` property to ensure that it displays correctly in relation to the title bar, and add the view controller to your window. For more information about `NSWindow` methods you can use to add and remove a title bar accessory view controller, see Managing Title Bars.

Don’t override the `view` property in your `NSTitlebarAccessoryViewController` subclass. Instead, you can override `NSViewController/loadView()`, and set the `view` property in that method.

> **NOTE:**  `NSTitlebarAccessoryViewController` observes the view’s frame for changes. Depending on the value of `NSTitlebarAccessoryViewController/layoutAttribute`, you can change either the height or the width of the view. Specifically, you can change the view’s height when `NSTitlebarAccessoryViewController/layoutAttribute` is `NSLayoutConstraint/Attribute/bottom`, and you can change the view’s width when the `NSTitlebarAccessoryViewController/layoutAttribute` is `NSLayoutConstraint/Attribute/right` or `NSLayoutConstraint/Attribute/left`. The remaining size direction is automatically set to the maximum size as required for the window.





## Relationships

**Inherits From**: `NSViewController`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAnimatablePropertyContainer`, `NSAnimationDelegate`, `NSCoding`, `NSEditor`, `NSExtensionRequestHandling`, `NSObjectProtocol`, `NSSeguePerforming`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.10

## Topics

### Configuring a title bar accessory view controller

- `fullScreenMinHeight`
- `layoutAttribute`

### Configuring the scroll edge effect

- `preferredScrollEdgeEffectStyle`
- `NSScrollEdgeEffectStyle`

### Responding to view events

- `viewDidAppear()`
- `viewDidDisappear()`
- `viewWillAppear()`

### Instance Properties

- `automaticallyAdjustsSize`
- `isHidden`

## See Also

- `NSWindowController`
- `NSViewController`
