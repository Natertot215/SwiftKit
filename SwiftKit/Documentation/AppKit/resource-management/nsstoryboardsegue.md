---
url: https://developer.apple.com/documentation/appkit/nsstoryboardsegue
framework: AppKit
category: Resource management
title: NSStoryboardSegue
kind: class
captured: 2026-05-02
---

# NSStoryboardSegue

A transition or containment relationship between two scenes in a storyboard.

## Declaration

```swift
class NSStoryboardSegue
```

### Overview

In this context, a *scene*scene is a view controller or a window controller and a *storyboard*storyboard is an instance of the `NSStoryboard` class.

A storyboard segue has a procedural notion of being invoked, known in the API as being *performed*performed. You can take advantage of hooks into the segue performance process by way of the `NSSeguePerforming` protocol.

You do not create storyboard segue objects directly. Instead, the system creates them as needed as segues are invoked. To run code during initialization and performance of a segue, override the `NSStoryboardSegue/init(identifier:source:destination:)` and `NSStoryboardSegue/perform()` methods.

You can initiate a segue programmatically with the `NSSeguePerforming/performSegue(withIdentifier:sender:)` method of the `NSSeguePerforming` protocol. For example, you might do this to transition from a scene in one storyboard file to a scene in another.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 10.10

## Topics

### Inspecting a Storyboard Segue

- `sourceController`
- `destinationController`
- `identifier`
- `NSStoryboardSegue.Identifier`

### Customizing Storyboard Segue Initialization and Invocation

- `init(identifier:source:destination:performHandler:)`
- `init(identifier:source:destination:)`
- `perform()`

## See Also

- `NSStoryboard`
- `NSSeguePerforming`
