---
url: https://developer.apple.com/documentation/appkit/nsworkspace/openconfiguration
framework: AppKit
category: App structure
title: NSWorkspace.OpenConfiguration
kind: class
captured: 2026-05-01
---

# NSWorkspace.OpenConfiguration

## Overview
A class that provides configuration options for opening URLs or launching apps in macOS.

## Declaration
```swift
class OpenConfiguration
```

## Abstract
The configuration options for opening URLs or launching apps.

## Discussion
Create an `NSWorkspace.OpenConfiguration` object before launching an app or opening a URL using the shared `NSWorkspace` object. Use the properties of this object to customize the behavior of the launched app or the handling of URLs. For example, you might tell the app to hide itself immediately after launch.

## Properties

### Handling URLs
- **`requiresUniversalLinks`** (`Bool`) - A Boolean value indicating whether you require the URL to have an associated universal link.
- **`isForPrinting`** (`Bool`) - A Boolean value indicating whether you want to print the contents of documents and URLs instead of opening them.

### Specifying App-Related Behaviors
- **`activates`** (`Bool`) - A Boolean value indicating whether the system activates the app and brings it to the foreground.
- **`addsToRecentItems`** (`Bool`) - A Boolean value indicating whether to add the app or documents to the Recent Items menu.
- **`allowsRunningApplicationSubstitution`** (`Bool`) - A Boolean value that indicates whether to use a running instance of an application even if it's at a different URL.
- **`createsNewApplicationInstance`** (`Bool`) - A Boolean value indicating whether you want the system to launch a new instance of the app.
- **`hides`** (`Bool`) - A Boolean value indicating whether you want the app to hide itself after it launches.
- **`hidesOthers`** (`Bool`) - A Boolean value indicating whether you want to hide all apps except the one that launched.

### Prompting the User
- **`promptsUserIfNeeded`** (`Bool`) - A Boolean value indicating whether to display errors, authentication requests, or other UI elements to the user.

### Specifying Launch Attributes
- **`appleEvent`** (`NSAppleEventDescriptor?`) - The first Apple event to send to the new app.
- **`arguments`** (`[String]`) - The set of command-line arguments to pass to a new app instance at launch time.
- **`environment`** (`[String: String]`) - The set of environment variables to set in a new app instance.
- **`architecture`** (`cpu_type_t`) - The architecture version of the app to launch.

## Inheritance
Inherits from: `NSObject`

## Conformances
- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSCopying`
- `NSObject`

## Availability
- **macOS** 10.15+

## See Also
- `NSWorkspace` - A workspace that can launch other apps and perform a variety of file-handling services.
- `NSAppKitVersion` - Constants for determining which version of AppKit is available.
- `LSMinimumSystemVersion` - The minimum version of the operating system required for the app to run in macOS.
