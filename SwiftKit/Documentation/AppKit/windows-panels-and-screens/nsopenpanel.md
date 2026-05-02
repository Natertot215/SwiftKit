---
url: https://developer.apple.com/documentation/appkit/nsopenpanel
framework: AppKit
category: Windows, panels, and screens
title: NSOpenPanel
kind: class
captured: 2026-05-02
---

# NSOpenPanel

A panel that prompts the user to select a file to open.

## Declaration

```swift
class NSOpenPanel
```

### Overview

Apps use the Open panel as a convenient way to query the user for the name of a file to open. In macOS 10.15 and later, the system always draws Open panels in a separate process, regardless of whether the app is sandboxed. When the user chooses a file to open, macOS adds that file to the app’s sandbox. Prior to macOS 10.15, the system drew the panels in a separate process only for sandboxed apps.





## Relationships

**Inherits From**: `NSSavePanel`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSMenuItemValidation`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `NSUserInterfaceValidations`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Configuring the Open Panel

- `canChooseFiles`
- `canChooseDirectories`
- `resolvesAliases`
- `allowsMultipleSelection`
- `isAccessoryViewDisclosed`

### Accessing User Selection

- `urls`

### Supporting iCloud Documents

- `canDownloadUbiquitousContents`
- `canResolveUbiquitousConflicts`

### Deprecated

- `Deprecated Symbols`

## See Also

- `NSSavePanel`
- `NSOpenSavePanelDelegate`
