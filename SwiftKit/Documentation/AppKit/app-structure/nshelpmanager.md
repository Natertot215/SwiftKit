---
url: https://developer.apple.com/documentation/appkit/nshelpmanager
framework: AppKit
category: App structure
title: NSHelpManager
kind: class
captured: 2026-05-02
---

# NSHelpManager

An object for displaying online help for an app.

## Declaration

```swift
@MainActor class NSHelpManager
```

### Overview

The `NSHelpManager` class provides an approach to displaying online help. An app contains one `NSHelpManager` object.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS ?

## Topics

### Getting the Help Manager

- `shared`

### Displaying Help

- `find(_:inBook:)`
- `openHelpAnchor(_:inBook:)`
- `NSHelpManager.AnchorName`
- `NSHelpManager.BookName`

### Dynamically Adding Help Books

- `registerBooks(in:)`

### Configuring Context-Sensitive Help

- `setContextHelp(_:for:)`
- `removeContextHelp(for:)`

### Displaying Context-Sensitive Help

- `contextHelp(for:)`
- `showContextHelp(for:locationHint:)`
- `NSHelpManager.ContextHelpKey`
- `isContextHelpModeActive`

### Notifications

- `contextHelpModeDidActivateNotification`
- `contextHelpModeDidDeactivateNotification`

## See Also

- `NSUserInterfaceItemSearching`
