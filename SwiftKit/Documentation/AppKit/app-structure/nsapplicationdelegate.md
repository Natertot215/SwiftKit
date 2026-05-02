---
url: https://developer.apple.com/documentation/appkit/nsapplicationdelegate
framework: AppKit
category: App structure
title: NSApplicationDelegate
kind: protocol
captured: 2026-05-01
---

# NSApplicationDelegate

## Declaration

```swift
protocol NSApplicationDelegate : NSObjectProtocol
```

## Abstract

A set of methods that manage your app's life cycle and its interaction with common system services.

## Overview

The `NSApplicationDelegate` protocol defines optional methods that you implement to manage your app's initialization, termination, and interaction with system services on macOS.

## Topics

### Launching Applications
- `applicationWillFinishLaunching(_:)` - Tells the delegate that the app's initialization is about to complete.
- `applicationDidFinishLaunching(_:)` - Tells the delegate that the app's initialization is complete but it hasn't received its first event.
- NSApplicationDidFinishLaunching User Info Keys

### Managing Active Status
- `applicationWillBecomeActive(_:)` - Tells the delegate that the app is about to become active.
- `applicationDidBecomeActive(_:)` - Tells the delegate that the app is now active.
- `applicationWillResignActive(_:)` - Tells the delegate that the app is about to become inactive and will lose focus.
- `applicationDidResignActive(_:)` - Tells the delegate that the app is no longer active and doesn't have focus.

### Terminating Applications
- `applicationShouldTerminate(_:)` - Returns a value that indicates if the app should terminate.
- `NSApplication.TerminateReply` - Constants that determine whether an app should terminate.
- `applicationShouldTerminateAfterLastWindowClosed(_:)` - Returns a Boolean value that indicates if the app terminates once the last window closes.
- `applicationWillTerminate(_:)` - Tells the delegate that the app is about to terminate.

### Hiding Applications
- `applicationWillHide(_:)` - Tells the delegate that the app is about to be hidden.
- `applicationDidHide(_:)` - Tells the delegate that the app is now hidden.
- `applicationWillUnhide(_:)` - Tells the delegate that the app is about to become visible.
- `applicationDidUnhide(_:)` - Tells the delegate that the app is now visible.

### Managing Windows
- `applicationWillUpdate(_:)` - Tells the delegate that the app is about to update its windows.
- `applicationDidUpdate(_:)` - Tells the delegate that the app's windows did update.
- `applicationShouldHandleReopen(_:hasVisibleWindows:)` - Returns a Boolean value that indicates if the app responds to reopen AppleEvents.

### Managing the Dock Menu
- `applicationDockMenu(_:)` - Returns the app's dock menu.

### Localizing Keyboard Shortcuts
- `applicationShouldAutomaticallyLocalizeKeyEquivalents(_:)` - Returns a Boolean value that tells the system whether to remap menu shortcuts to support localized keyboards.

### Displaying Errors
- `application(_:willPresentError:)` - Returns an error for the app to display to the user.

### Managing the Screen
- `applicationDidChangeScreenParameters(_:)` - Tells the delegate about changes to the configuration of any attached displays.

### Continuing User Activities
- `application(_:willContinueUserActivityWithType:)` - Returns a Boolean value that indicates if the app can continue the specified activity.
- `application(_:continue:restorationHandler:)` - Returns a Boolean value that indicates if the app successfully recreates the specified activity.
- `application(_:didFailToContinueUserActivityWithType:error:)` - Tells the delegate that the app couldn't continue the specified activity.
- `application(_:didUpdate:)` - Tells the delegate that there are changes to the specified activity.

### Handling Push Notifications
- `application(_:didRegisterForRemoteNotificationsWithDeviceToken:)` - Tells the delegate that the app registered for Apple Push Services.
- `application(_:didFailToRegisterForRemoteNotificationsWithError:)` - Tells the delegate that the app was unable to register for Apple Push Services.
- `application(_:didReceiveRemoteNotification:)` - Tells the delegate when the app receives a remote notification.

### Handling CloudKit Invitations
- `application(_:userDidAcceptCloudKitShareWith:)` - Tells the delegate when the user accepts a CloudKit sharing invitation.

### Handling SiriKit Intents
- `application(_:handlerFor:)` - Returns an intent handler that's capable of handling the specified intent.

### Opening Files
- `application(_:open:)` - Tells the delegate to open the resource at the specified URL.
- `application(_:openFile:)` - Returns a Boolean value that indicates if the app opens the specified file.
- `application(_:openFileWithoutUI:)` - Returns a Boolean value that indicates if the app opens the specified file without showing its user interface.
- `application(_:openTempFile:)` - Returns a Boolean value that indicates if the app opens the specified temporary file.
- `application(_:openFiles:)` - Tells the delegate to open the specified files.
- `applicationShouldOpenUntitledFile(_:)` - Returns a Boolean value that indicates if the app can open an untitled file.
- `applicationOpenUntitledFile(_:)` - Returns a Boolean value that indicates if the app opens an untitled file.

### Printing
- `application(_:printFile:)` - Returns a Boolean value that indicates if the app prints the specified file in its entirety.
- `application(_:printFiles:withSettings:showPrintPanels:)` - Returns a value that indicates if the app prints the specified files.
- `NSApplication.PrintReply` - Constants that indicate the outcome of a print request.

### Restoring Application State
- `applicationSupportsSecureRestorableState(_:)` - Returns a Boolean value that indicates if the app supports secure state restoration.
- `applicationProtectedDataDidBecomeAvailable(_:)` - Tells the delegate that protected data is now available.
- `applicationProtectedDataWillBecomeUnavailable(_:)` - Tells the delegate that protected data is about to become unavailable.
- `application(_:willEncodeRestorableState:)` - Tells the delegate that the app is about to encode its restorable state.
- `application(_:didDecodeRestorableState:)` - Tells the delegate when the app finished decoding its restorable state.

### Handling Changes to the Occlusion State
- `applicationDidChangeOcclusionState(_:)` - Tells the delegate about changes to the app's occlusion state.

### Scripting Your App
- `application(_:delegateHandlesKey:)` - Returns a Boolean value that indicates if the app supports the specified scripting key.

### Type Methods
- `main()` - Provides the top-level entry point for the app.

## Inheritance

Inherits from `NSObjectProtocol`

## See Also

### Life Cycle
- `NSApplication` - An object that manages an app's main event loop and resources used by all of that app's objects.
- `NSRunningApplication` - An object that can manipulate and provide information for a single instance of an app.
- `NSApplicationMain(_:_:)` - Called by the main function to create and run the application.

## Availability

- **macOS** - Available
