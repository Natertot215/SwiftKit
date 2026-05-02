---
url: https://developer.apple.com/documentation/appkit/nsresponder
framework: AppKit
category: Mouse, keyboard, and trackpad
title: NSResponder
kind: class
captured: 2026-05-02
---

# NSResponder

An abstract class that forms the basis of event and command processing in AppKit.

## Declaration

```swift
@MainActor class NSResponder
```

### Overview

The core classes—`NSApplication`, `NSWindow`, and `NSView`—inherit from `NSResponder`, as must any class that handles events. The responder model uses three components: event messages, action messages, and the responder chain.

`NSResponder` also plays an important role in the presentation of error information. The default implementations of the `NSResponder/presentError(_:)` and `NSResponder/presentError(_:modalFor:delegate:didPresent:contextInfo:)` methods send `NSResponder/willPresentError(_:)` to `self`, thereby giving subclasses the opportunity to customize the localized information presented in error alerts. `NSResponder` then forwards the message to the next responder, passing it the customized `NSError` object. The exact path up the modified responder chain depends on the type of application window:

- Window that the document owns: view > superviews > window > window controller > document object > document controller > the application object
- Window with window controller but no documents: view > superviews > window > window controller > the application object
- Window with no window controllers: view > superviews > window > the application object

`NSApplication` displays a document-modal error alert and, if the error object has a recovery attempter, gives it a chance to recover from the error. A recovery attempter is an object that conforms to the `nserrorrecoveryattempting` informal protocol.

> **NOTE:**  In macOS 10.15 and later, `NSResponder` and its descendants call the `NSObject-swift.class/dealloc` method on the main thread. This method helps to avoid situations where an asynchronous block unexpectedly deallocates an object on a background queue.





## Relationships

**Inherits From**: `NSObject`

**Inherited By**: `NSApplication`, `NSDrawer`, `NSPopover`, `NSView`, `NSViewController`, `NSWindow`, `NSWindowController`

**Conforms To**: `CVarArg`, `Copyable`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `Sendable`

## Availability

- macOS ?

## Topics

### Changing the First Responder

- `acceptsFirstResponder`
- `becomeFirstResponder()`
- `resignFirstResponder()`
- `validateProposedFirstResponder(_:for:)`

### Managing the Next Responder

- `nextResponder`

### Responding to Mouse Events

- `mouseDown(with:)`
- `mouseDragged(with:)`
- `mouseUp(with:)`
- `mouseMoved(with:)`
- `mouseEntered(with:)`
- `mouseExited(with:)`
- `rightMouseDown(with:)`
- `rightMouseDragged(with:)`
- `rightMouseUp(with:)`
- `otherMouseDown(with:)`
- `otherMouseDragged(with:)`
- `otherMouseUp(with:)`

### Responding to Key Events

- `keyDown(with:)`
- `keyUp(with:)`
- `interpretKeyEvents(_:)`
- `performKeyEquivalent(with:)`
- `flushBufferedKeyEvents()`

### Responding to Pressure Changes

- `pressureChange(with:)`

### Responding to Other Kinds of Events

- `cursorUpdate(with:)`
- `flagsChanged(with:)`
- `tabletPoint(with:)`
- `tabletProximity(with:)`
- `helpRequested(_:)`
- `scrollWheel(with:)`
- `quickLook(with:)`
- `changeMode(with:)`

### Responding to Action Messages

- `supplementalTarget(forAction:sender:)`
- `NSStandardKeyBindingResponding`
- `Action Messages`

### Handling Window Restoration

- `allowedClasses(forRestorableStateKeyPath:)`
- `encodeRestorableState(with:)`
- `encodeRestorableState(with:backgroundQueue:)`
- `restoreState(with:)`
- `restorableStateKeyPaths`
- `invalidateRestorableState()`

### Supporting User Activities

- `userActivity`
- `updateUserActivityState(_:)`

### Presenting and Customizing Error Information

- `presentError(_:)`
- `presentError(_:modalFor:delegate:didPresent:contextInfo:)`
- `willPresentError(_:)`

### Dispatching Messages

- `tryToPerform(_:with:)`

### Managing a Responder’s Menu

- `menu`

### Updating the Services Menu

- `validRequestor(forSendType:returnType:)`

### Getting the Undo Manager

- `undoManager`

### Testing Events

- `shouldBeTreatedAsInkEvent(_:)`

### Terminating the Responder Chain

- `noResponder(for:)`

### Touch and Gesture Events

- `beginGesture(with:)`
- `endGesture(with:)`
- `magnify(with:)`
- `rotate(with:)`
- `swipe(with:)`
- `touchesBegan(with:)`
- `touchesMoved(with:)`
- `touchesCancelled(with:)`
- `touchesEnded(with:)`
- `wantsForwardedScrollEvents(for:)`
- `smartMagnify(with:)`
- `wantsScrollEventsForSwipeTracking(on:)`
- `NSEvent.GestureAxis`

### Supporting the Touch Bar

- `touchBar`
- `makeTouchBar()`

### Performing Text Find Actions

- `performTextFinderAction(_:)`

### Supporting Tabbed Windows

- `newWindowForTab(_:)`

### Creating Responders

- `init()`
- `init(coder:)`

### Instance Methods

- `contextMenuKeyDown(_:)`
- `mouseCancelled(with:)`
- `showWritingTools(_:)`
