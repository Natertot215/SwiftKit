---
url: https://developer.apple.com/documentation/appkit/nswindowcontroller
framework: AppKit
category: View management
title: NSWindowController
kind: class
captured: 2026-05-02
---

# NSWindowController

A controller that manages a window, usually a window stored in a nib file.

## Declaration

```swift
class NSWindowController
```

### Overview

Managing a window entails:

- Loading and displaying the window
- Closing the window when appropriate
- Customizing the window’s title
- Storing the window’s frame (size and location) in the defaults database
- Cascading the window in relation to other document windows of the app

A window controller can manage a window by itself or as a role player in AppKit’s document-based architecture, which also includes `NSDocument` and `NSDocumentController` objects. In this architecture, a window controller is created and managed by a “document” (an instance of an `NSDocument` subclass) and, in turn, keeps a reference to the document.

The relationship between a window controller and a nib file is important. Although a window controller can manage a programmatically created window, it usually manages a window in a nib file. The nib file can contain other top-level objects, including other windows, but the window controller’s responsibility is this primary window. The window controller is usually the owner of the nib file, even when it is part of a document-based app. Regardless of who is the file’s owner, the window controller is responsible for freeing all top-level objects in the nib file it loads.

For simple documents—that is, documents with only one nib file containing a window—you need to do little directly with `NSWindowController`; AppKit creates one for you. However, if the default window controller is not sufficient, you can create a custom subclass of `NSWindowController`. For documents with multiple windows or panels, your document must create separate instances of `NSWindowController` (or of custom subclasses of `NSWindowController`), one for each window or panel. An example is a CAD app that has different windows for side, top, and front views of drawn objects. What you do in your `NSDocument` subclass determines whether the default `NSWindowController` or separately created and configured `NSWindowController` objects are used.

#### Subclassing NSWindowController

You should create a subclass of `NSWindowController` when you want to augment the default behavior, such as to give the window a custom title or to perform some setup tasks before the window is loaded. In your class’s initialization method, be sure to invoke on `super` either one of the `initWithWindowNibName:...` initializers or the `NSWindowController/init(window:)` initializer. The initializer you choose depends on whether the window object originates in a nib file or is programmatically created.

You can also implement an `NSWindowController` subclass to avoid requiring client code to get the corresponding nib’s filename and pass it to `NSWindowController/init(windowNibName:)` or `NSWindowController/init(windowNibName:owner:)` when instantiating the window controller. The best way to do this is to override `NSWindowController/windowNibName` to return the nib’s filename and instantiate the window controller by passing `nil` to `NSWindowController/init(window:)`. Using the `NSWindowController/init(window:)` designated initializer simplifies compliance with Swift initializer requirements.

Typically, you override one of the methods listed below.

[table — see source]

You can also override `NSWindowController/loadWindow()` to get different nib-searching or nib-loading behavior, although there is usually no need to do this.





## Relationships

**Inherits From**: `NSResponder`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `NSSeguePerforming`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Initializing Window Controllers

- `init(window:)`
- `init(windowNibName:)`
- `init(windowNibName:owner:)`
- `init(windowNibPath:owner:)`

### Loading and Displaying the Window

- `loadWindow()`
- `showWindow(_:)`
- `isWindowLoaded`
- `window`
- `windowDidLoad()`
- `windowWillLoad()`

### Accessing the Document

- `document`
- `setDocumentEdited(_:)`

### Closing the Window

- `close()`
- `shouldCloseDocument`

### Getting Nib and Storyboard Information

- `owner`
- `storyboard`
- `windowNibName`
- `windowNibPath`

### Accessing Window Attributes and Content

- `shouldCascadeWindows`
- `windowFrameAutosaveName`
- `synchronizeWindowTitleWithDocumentName()`
- `windowTitle(forDocumentDisplayName:)`
- `contentViewController`
- `dismissController(_:)`

### Window Property Wrappers

- `NSWindowController.WindowLoading`

### Initializers

- `init(coder:)`

### Instance Properties

- `previewRepresentableActivityItems`

## See Also

- `NSViewController`
- `NSTitlebarAccessoryViewController`
