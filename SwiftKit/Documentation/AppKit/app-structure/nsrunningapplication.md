---
url: https://developer.apple.com/documentation/appkit/nsrunningapplication
framework: AppKit
category: App structure
title: NSRunningApplication
kind: class
captured: 2026-05-01
---

# NSRunningApplication

## Declaration

```swift
class NSRunningApplication
```

## Abstract

An object that can manipulate and provide information for a single instance of an app.

## Overview

Some properties of an app are fixed, such as the bundle identifier. Other properties may vary over time, such as whether the app is hidden. Properties that vary can be observed with key-value observing, in which case the description comment for the method notes this capability.

Properties that vary over time are inherently race-prone. For example, a hidden app may unhide itself at any time. To ameliorate this, properties persist until the next turn of the main run loop in a common mode. For example, if you repeatedly poll an unhidden app for its hidden property without allowing the run loop to run, it will continue to return `false`, even if the app hides, until the next turn of the run loop.

`NSRunningApplication` is thread safe, in that its properties are returned atomically. However, it is still subject to the main run loop policy described above. If you access an instance of `NSRunningApplication` from a background thread, be aware that its time-varying properties may change from under you as the main run loop runs (or not).

An `NSRunningApplication` instance remains valid after the app exits. However, most properties lose their significance, and some properties may not be available on a terminated application.

To access the list of all running apps, use the `runningApplications` method in `NSWorkspace`.

## Availability

- **macOS** 10.6+

## Inheritance

Inherits from `NSObject`

## Conformances

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSObjectProtocol`
- `Sendable`
- `SendableMetatype`

## Topics

### Getting running application instances
- `init(processIdentifier:)`
- `runningApplications(withBundleIdentifier:)`
- `current`

### Activating applications
- `activate(options:)`
- `activate(from:options:)`
- `isActive`
- `NSApplication.ActivationOptions`
- `activationPolicy`
- `NSApplication.ActivationPolicy`

### Hiding and unhiding applications
- `hide()`
- `unhide()`
- `isHidden`

### Application information
- `localizedName`
- `icon`
- `bundleIdentifier`
- `bundleURL`
- `executableArchitecture`
- `executableURL`
- `launchDate`
- `isFinishedLaunching`
- `processIdentifier`
- `ownsMenuBar`

### Terminating applications
- `forceTerminate()`
- `terminate()`
- `isTerminated`
- `terminateAutomaticallyTerminableApplications()`

## See Also

### Life Cycle
- `NSApplication`
- `NSApplicationDelegate`
- `NSApplicationMain(_:_:)`
