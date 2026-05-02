---
url: https://developer.apple.com/documentation/appkit/nswindowdelegate
framework: AppKit
category: Windows, panels, and screens
title: NSWindowDelegate
kind: protocol
captured: 2026-05-01
---

# NSWindowDelegate

## Declaration

```swift
protocol NSWindowDelegate : NSObjectProtocol
```

## Abstract

A set of optional methods that a window's delegate can implement to respond to events, such as window resizing, moving, exposing, and minimizing.

## Overview

The `NSWindowDelegate` protocol defines optional methods that allow a delegate to respond to various window-related events and customize window behavior. All methods in this protocol are optional.

## Topics

### Managing Sheets
- `window(_:willPositionSheet:using:)` - Tells the delegate that the window is about to show a sheet at the specified location
- `windowWillBeginSheet(_:)` - Notifies the delegate that the window is about to open a sheet
- `windowDidEndSheet(_:)` - Tells the delegate that the window has closed a sheet

### Sizing Windows
- `windowWillResize(_:to:)` - Tells the delegate that the window is being resized
- `windowDidResize(_:)` - Tells the delegate that the window has been resized
- `windowWillStartLiveResize(_:)` - Tells the delegate that the window is about to be live resized
- `windowDidEndLiveResize(_:)` - Tells the delegate that a live resize operation has ended

### Minimizing Windows
- `windowWillMiniaturize(_:)` - Tells the delegate that the window is about to be minimized
- `windowDidMiniaturize(_:)` - Tells the delegate that the window has been minimized
- `windowDidDeminiaturize(_:)` - Tells the delegate that the window has been deminimized

### Zooming Window
- `windowWillUseStandardFrame(_:defaultFrame:)` - Called by `NSWindow`'s `zoom(_:)` method while determining the frame a window may be zoomed to
- `windowShouldZoom(_:toFrame:)` - Asks the delegate whether the specified window should zoom to the specified frame

### Managing Full-Screen Presentation
- `window(_:willUseFullScreenContentSize:)` - Called to allow the delegate to modify the full-screen content size
- `window(_:willUseFullScreenPresentationOptions:)` - Returns the presentation options the window uses when transitioning to full-screen mode
- `windowWillEnterFullScreen(_:)` - The window is about to enter full-screen mode
- `windowDidEnterFullScreen(_:)` - The window has entered full-screen mode
- `windowWillExitFullScreen(_:)` - The window is about to exit full-screen mode
- `windowDidExitFullScreen(_:)` - The window has left full-screen mode

### Custom Full-Screen Presentation Animations
- `customWindowsToEnterFullScreen(for:)` - Called when the window is about to enter full-screen mode
- `customWindowsToEnterFullScreen(for:on:)` - Called when the window is about to enter full-screen mode on a specific screen
- `window(_:startCustomAnimationToEnterFullScreenWithDuration:)` - Called to start the window animation into full-screen mode
- `window(_:startCustomAnimationToEnterFullScreenOn:withDuration:)` - Called to start the window animation into full-screen mode on a specific screen
- `windowDidFailToEnterFullScreen(_:)` - Called if the window failed to enter full-screen mode
- `customWindowsToExitFullScreen(for:)` - Called when the window is about to exit full-screen mode
- `window(_:startCustomAnimationToExitFullScreenWithDuration:)` - Called to start the window animation out of full-screen mode
- `windowDidFailToExitFullScreen(_:)` - Called if the window failed to exit full-screen mode

### Moving Windows
- `windowWillMove(_:)` - Tells the delegate that the window is about to move
- `windowDidMove(_:)` - Tells the delegate that the window has moved
- `windowDidChangeScreen(_:)` - Tells the delegate that the window has changed screens
- `windowDidChangeScreenProfile(_:)` - Tells the delegate that the window has changed screen display profiles
- `windowDidChangeBackingProperties(_:)` - Tells the delegate that the window backing properties changed

### Closing Windows
- `windowShouldClose(_:)` - Tells the delegate that the user has attempted to close a window or the window has received a `performClose(_:)` message
- `windowWillClose(_:)` - Tells the delegate that the window is about to close

### Managing Key Status
- `windowDidBecomeKey(_:)` - Tells the delegate that the window has become the key window
- `windowDidResignKey(_:)` - Tells the delegate that the window has resigned key window status

### Managing Main Status
- `windowDidBecomeMain(_:)` - Tells the delegate that the window has become main
- `windowDidResignMain(_:)` - Tells the delegate that the window has resigned main window status

### Managing Field Editors
- `windowWillReturnFieldEditor(_:to:)` - Tells the delegate that the field editor for a text-displaying object has been requested

### Updating Windows
- `windowDidUpdate(_:)` - Tells the delegate that the window received an `update()` message

### Exposing Windows
- `windowDidExpose(_:)` - Tells the delegate that the window has been exposed

### Managing Occlusion State
- `windowDidChangeOcclusionState(_:)` - Tells the delegate that the window changed its occlusion state

### Dragging Windows
- `window(_:shouldDragDocumentWith:from:with:)` - Asks the delegate whether a user can drag the document icon from the window's title bar

### Getting the Undo Manager
- `windowWillReturnUndoManager(_:)` - Tells the delegate that the window's undo manager has been requested

### Managing Titles
- `window(_:shouldPopUpDocumentPathMenu:)` - Asks the delegate whether the window displays the title pop-up menu in response to Command-click or Control-click on its title

### Managing Restorable State
- `window(_:willEncodeRestorableState:)` - Tells the delegate the window is about to add its restorable state to a given archiver
- `window(_:didDecodeRestorableState:)` - Tells the delegate the window has extracted its restorable state from a given archiver

### Managing Presentation in Version Browsers
- `window(_:willResizeForVersionBrowserWithMaxPreferredSize:maxAllowedSize:)` - Tells the delegate the window will resize for presentation during version browsing
- `windowWillEnterVersionBrowser(_:)` - Tells the delegate the window is about to enter version browsing
- `windowDidEnterVersionBrowser(_:)` - Tells the delegate that the window has entered version browsing
- `windowWillExitVersionBrowser(_:)` - Tells the delegate that the window is about to leave version browsing
- `windowDidExitVersionBrowser(_:)` - Tells the delegate that the window has left version browsing

### Instance Methods
- `previewRepresentableActivityItems(for:)` - A collection of Preview-representable activity items, used for sharing and collaboration
- `windowForSharingRequest(from:)` - Method called to get the window to share once sharing is confirmed

## Inheritance

Conforms to `NSObjectProtocol`

## See Also

### Windows
- `NSWindow` - A window that an app displays on the screen
- `NSPanel` - A special kind of window that typically performs an auxiliary function
- `NSWindowTab` - A tab associated with a window that is part of a tabbing group
- `NSWindowTabGroup` - A group of windows that display together as a single tabbed window
