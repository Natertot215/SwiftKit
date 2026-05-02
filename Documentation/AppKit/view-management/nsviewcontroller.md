---
url: https://developer.apple.com/documentation/appkit/nsviewcontroller
framework: AppKit
category: View management
title: NSViewController
kind: class
captured: 2026-05-02
---

# NSViewController

A controller that manages a view, typically loaded from a nib file.

## Declaration

```swift
class NSViewController
```

### Overview

View controller management includes:

- Memory management of top-level objects similar to that performed by the `NSWindowController` class, taking the same care to prevent reference cycles when controls are bound to the nib file’s owner.
- Declaring a generic `NSViewController/view` property, to make it easy to establish bindings in the nib to an object that isn’t yet known at nib-loading time or readily available to the code that’s doing the nib loading.
- Implementing the key-value binding NSEditor informal protocol, so that apps using a view controller can easily make bound controls in the views commit or discard changes by the user.

In macOS 10.10 and later, a view controller offers a full set of life cycle methods, allowing you to manage the content of a window in a way that is on a par with iOS view controller management. These methods, presented in order here to reflect a typical cycle, are:

*View life cycle:*View life cycle:

1. `NSViewController/viewDidLoad()`
2. `NSViewController/viewWillAppear()`
3. `NSViewController/viewDidAppear()`

*User interaction cycle:*User interaction cycle:

1. `NSViewController/updateViewConstraints()`
2. `NSViewController/viewWillLayout()`
3. `NSViewController/viewDidLayout()`
4. `NSViewController/viewWillDisappear()`
5. `NSViewController/viewDidDisappear()`

In addition, in macOS 10.10 and later, a view controller participates in the responder chain. You can implement action methods directly in the view controller. Corresponding actions that originate in the view controller’s view proceed up the responder chain and are handled by those methods.

Prior to OS X v10.10, a typical usage pattern for loading a nib file was to subclass `NSViewController` and override its `NSViewController/loadView()` method to call `[super loadView]`. But in macOS 10.10 and later, the `NSViewController/loadView()` method automatically looks for a nib file with the same name as the view controller. To take advantage of this behavior, name a nib file after its corresponding view controller and pass `nil` to both parameters of the `NSViewController/init(nibName:bundle:)` method.

A view controller employs lazy loading of its view: Immediately after a view controller is loaded into memory, the value of its `NSViewController/isViewLoaded` property is `false`. The value changes to `true` after the `NSViewController/loadView()` method returns and just before the system calls the `NSViewController/viewDidLoad()` method.

A view controller is meant to be highly reusable, such as for dynamically representing various objects. For example, the  `NSPageLayout/addAccessoryController(_:)` methods of the `NSPageLayout` and `NSPrintPanel` classes take an `NSViewController` instance as the argument, and set the `NSViewController/representedObject` property to the `NSPrintInfo` object that is to be shown to the user. This allows a developer to easily create new printing accessory views using bindings and the `NSPrintInfo` class’s key-value coding and key-value observing compliance. When the user dismisses a printing dialog, the  `NSPageLayout` and `NSPrintPanel` classes each send NSEditor messages to each accessory view controller to ensure that the user’s changes have been committed or discarded properly. The titles of the accessories are retrieved from the view controllers and shown to the user in menus that the user can choose from.





## Relationships

**Inherits From**: `NSResponder`

**Inherited By**: `NSCollectionViewItem`, `NSPageController`, `NSSplitViewController`, `NSSplitViewItemAccessoryViewController`, `NSTabViewController`, `NSTitlebarAccessoryViewController`

**Conforms To**: `CVarArg`, `Copyable`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `NSCoding`, `NSEditor`, `NSExtensionRequestHandling`, `NSObjectProtocol`, `NSSeguePerforming`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `PlaygroundLiveViewable`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.5

## Topics

### Creating A View Controller

- `init(nibName:bundle:)`
- `loadView()`

### Represented Object

- `representedObject`

### Nib Properties

- `nibBundle`
- `nibName`

### View Properties

- `view`
- `title`

### View Property Wrappers

- `NSViewController.ViewLoading`

### NSEditor Conformance

- `commitEditing(withDelegate:didCommit:contextInfo:)`
- `commitEditing()`
- `discardEditing()`

### Using a Storyboard

- `storyboard`
- `dismiss(_:)`

### Responding to View Events

- `viewDidLoad()`
- `loadViewIfNeeded()`
- `isViewLoaded`
- `viewIfLoaded`
- `viewWillAppear()`
- `viewDidAppear()`
- `viewWillDisappear()`
- `viewDidDisappear()`

### Managing View Layout

- `preferredContentSize`
- `updateViewConstraints()`
- `viewWillLayout()`
- `viewDidLayout()`

### Managing Child View Controllers in a Custom Container

- `addChild(_:)`
- `children`
- `transition(from:to:options:completionHandler:)`
- `insertChild(_:at:)`
- `removeChild(at:)`
- `removeFromParent()`
- `preferredContentSizeDidChange(for:)`

### Presenting Another View Controller’s Content

- `present(_:animator:)`
- `dismiss(_:)`
- `present(_:asPopoverRelativeTo:of:preferredEdge:behavior:)`
- `present(_:asPopoverRelativeTo:of:preferredEdge:behavior:hasFullSizeContent:)`
- `presentAsModalWindow(_:)`
- `presentAsSheet(_:)`
- `present(inWidget:)`

### Getting Related View Controllers

- `parent`
- `presentedViewControllers`
- `presentingViewController`

### Configuring an App Extension View Controller

- `extensionContext`
- `preferredScreenOrigin`
- `preferredMaximumSize`
- `preferredMinimumSize`
- `viewWillTransition(to:)`
- `sourceItemView`

### Constants

- `NSViewController.TransitionOptions`

### Initializers

- `init(coder:)`

## See Also

- `NSWindowController`
- `NSTitlebarAccessoryViewController`
