---
url: https://developer.apple.com/documentation/appkit/nsstoryboard
framework: AppKit
category: Resource management
title: NSStoryboard
kind: class
captured: 2026-05-02
---

# NSStoryboard

An encapsulation of the design-time view controller and window controller graph represented in an Interface Builder storyboard resource file.

## Declaration

```swift
class NSStoryboard
```

### Overview

You can use storyboard files to define the view and window controllers for all or part of an app’s user interface. Typically, AppKit creates these objects automatically in response to actions defined within a storyboard file itself, such as the clicking of a button or the choosing of a menu item. However, you can use a storyboard object to directly instantiate the initial view controller from a storyboard file or to instantiate other view or window controllers that you want to present programmatically. In the context of a storyboard file, each contained controller is called a *scene*scene.

A transition from one scene to another in a storyboard is called a *segue*segue. This same term, and the same Cocoa APIs, express a containment relationship between two scenes. In macOS, containment (rather than transition) is the more common notion for storyboards. For descriptions of the related APIs, refer to `NSStoryboardSegue` and `NSSeguePerforming`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 10.10

## Topics

### Creating a Storyboard Object

- `init(name:bundle:)`
- `main`
- `NSStoryboard.Name`

### Loading the Initial View Controller

- `instantiateInitialController()`
- `instantiateInitialController(creator:)`
- `instantiateInitialController(creator:)`

### Instantiating Storyboard Controllers

- `instantiateController(withIdentifier:)`
- `instantiateController(identifier:creator:)`
- `instantiateController(identifier:creator:)`
- `NSStoryboard.SceneIdentifier`

## See Also

- `NSStoryboardSegue`
- `NSSeguePerforming`
