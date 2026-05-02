---
url: https://developer.apple.com/documentation/appkit/nsapplication
framework: AppKit
category: App structure
title: NSApplication
kind: class
captured: 2026-05-01
---

# NSApplication

## Declaration

```swift
class NSApplication
```

## Abstract

An object that manages an app's main event loop and resources used by all of that app's objects.

## Overview

Every app uses a single instance of `NSApplication` to control the main event loop, keep track of the app's windows and menus, distribute events to the appropriate objects, set up autorelease pools, and receive notification of app-level events. An `NSApplication` object has a delegate (an object that you assign) that's notified when the app starts or terminates, is hidden or activated, should open a file selected by the user, and so forth. By setting the delegate and implementing the delegate methods, you customize the behavior of your app without having to subclass `NSApplication`.

In your app's `main()` function, create the `NSApplication` instance by calling the `shared` class method. After creating the application object, the `main()` function should load your app's main nib file and then start the event loop by sending the application object a `run()` message.

```objc
void NSApplicationMain(int argc, char *argv[]) {
    [NSApplication sharedApplication];
    [NSBundle loadNibNamed:@"myMain" owner:NSApp];
    [NSApp run];
}
```

The `shared` class method initializes the display environment and connects your program to the window server and the display server. The `NSApplication` object maintains a list of all the `NSWindow` objects the app uses, so it can retrieve any of the app's `NSView` objects. The `shared` method also initializes the global variable `NSApp`, which you use to retrieve the `NSApplication` instance.

The shared `NSApplication` object performs the important task of receiving events from the window server and distributing them to the proper `NSResponder` objects. `NSApp` translates an event into an `NSEvent` object, then forwards the event object to the affected `NSWindow` object. All keyboard and mouse events go directly to the `NSWindow` object associated with the event.

`NSApplication` is also responsible for dispatching certain Apple events received by the app. For example, macOS sends Apple events to your app at various times, such as when the app is launched or reopened.

## Getting the Shared App Object

- `shared` - Returns the application instance, creating it if it doesn't exist yet.
- `NSApp` - The global variable for the shared app instance.

## Managing the App's Behavior

- `delegate` - The app delegate object.
- `NSApplicationDelegate` - A set of methods that manage your app's life cycle and its interaction with common system services.

## Managing the Event Loop

- `nextEvent(matching:until:inMode:dequeue:)` - Returns the next event matching a given mask.
- `discardEvents(matching:before:)` - Removes all events matching the given mask and generated before the specified event.
- `currentEvent` - The current event being processed by the receiver.
- `isRunning` - A Boolean value indicating whether the main event loop is running.
- `run()` - Starts the main event loop.
- `finishLaunching()` - Activates the app, opens any files specified by the `NSOpen` user default, and unhighlights the app's icon.
- `stop(_:)` - Stops the main event loop.
- `sendEvent(_:)` - Dispatches an event to the appropriate receiver.
- `postEvent(_:atStart:)` - Adds a given event to the receiver's event queue.

## Posting Actions

- `tryToPerform(_:with:)` - Dispatches an action message to the specified target.
- `sendAction(_:to:from:)` - Sends an action message to a specified target.
- `target(forAction:)` - Returns the object that receives the action message specified by the given selector.
- `target(forAction:to:from:)` - Returns the object that receives the action message.

## Terminating the App

- `terminate(_:)` - Terminates the receiver.
- `reply(toApplicationShouldTerminate:)` - Responds to `NSTerminateLater` once the app knows whether it can terminate.

## Activating and Deactivating the App

- `activate()` - Activates the receiver app, if appropriate.
- `deactivate()` - Deactivates the receiver.
- `isActive` - A Boolean value indicating whether this is the active app.
- `yieldActivation(to:)` - Yields activation to the specified app.
- `yieldActivation(toApplicationWithBundleIdentifier:)` - Yields activation to the app with the specified bundle identifier.
- `ActivationOptions` - Flags for activation.

## Inheritance

Inherits from `NSResponder`

## Conformance

- `CVarArg`
- `Copyable`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Escapable`
- `Hashable`
- `NSAccessibilityElementProtocol`
- `NSAccessibilityProtocol`
- `NSAppearanceCustomization`
- `NSCoding`
- `NSMenuItemValidation`
- `NSObject`
- `NSStandardKeyBindingResponding`
- `NSTouchBarProvider`
- `NSUserActivityRestoring`
- `NSUserInterfaceValidations`
- `Sendable`

## See Also

### Life Cycle

- `NSRunningApplication` - An object that can manipulate and provide information for a single instance of an app.
- `NSApplicationDelegate` - A set of methods that manage your app's life cycle and its interaction with common system services.
- `NSApplicationMain(_:_:)` - Called by the main function to create and run the application.
