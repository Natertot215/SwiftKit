---
url: https://developer.apple.com/documentation/appkit/nsworkspace
framework: AppKit
category: App structure
title: NSWorkspace
kind: class
captured: 2026-05-01
---

# NSWorkspace

## Declaration

```swift
class NSWorkspace
```

## Abstract

A workspace that can launch other apps and perform a variety of file-handling services.

## Overview

There is one shared `NSWorkspace` object per app. You use the class method `shared` to access it. For example, the following statement uses an `NSWorkspace` object to request that a file be opened in the TextEdit app:

```swift
NSWorkspace.shared.openFile("/Myfiles/README", withApplication: "TextEdit")
```

```objc
[[NSWorkspace sharedWorkspace] openFile:@"/Myfiles/README" withApplication:@"TextEdit"];
```

You can use the workspace object to:

- Open, manipulate, and get information about files and devices.
- Track changes to the file system, devices, and the user database.
- Get and set Finder information for files.
- Launch apps.

## Availability

- **macOS** only

## Inheritance

Inherits from `NSObject`

## Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSObject`

## Key Members

### Accessing the Shared Workspace
- `shared` - Access the shared workspace instance

### Opening URLs
- `open(_:configuration:completionHandler:)` - Opens a URL asynchronously
- `open(_:withApplicationAt:configuration:completionHandler:)` - Opens URLs in a specified app
- `open(_:)` - Opens the location at the specified URL

### Launching and Hiding Apps
- `openApplication(at:configuration:completionHandler:)` - Launches the app at the specified URL
- `hideOtherApplications()` - Hides all applications other than the sender

### Manipulating Files
- `duplicate(_:completionHandler:)` - Duplicates specified URLs
- `recycle(_:completionHandler:)` - Moves URLs to the trash
- `activateFileViewerSelecting(_:)` - Activates the Finder with selected files
- `selectFile(_:inFileViewerRootedAtPath:)` - Selects a file

### Managing Icons
- `icon(forFile:)` - Returns icon for a file
- `icon(forFiles:)` - Returns icon for multiple files
- `icon(for:)` - Returns icon for a content type
- `setIcon(_:forFile:options:)` - Sets icon for a file

### Requesting Information
- `frontmostApplication` - The app that receives key events
- `runningApplications` - Array of running applications
- `menuBarOwningApplication` - App that owns the menu bar

### Desktop Management
- `desktopImageURL(for:)` - Gets desktop image for a screen
- `setDesktopImageURL(_:for:options:)` - Sets desktop image

### Notifications
The workspace posts numerous notifications for system events including application launches, termination, mounts/unmounts, and accessibility changes.

---

**Related Documentation:** Passing control from one app to another with cooperative activation
