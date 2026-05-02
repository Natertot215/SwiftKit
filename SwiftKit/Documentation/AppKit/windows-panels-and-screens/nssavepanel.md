---
url: https://developer.apple.com/documentation/appkit/nssavepanel
framework: AppKit
category: Windows, panels, and screens
title: NSSavePanel
kind: class
captured: 2026-05-02
---

# NSSavePanel

A panel that prompts the user for information about where to save a file.

## Declaration

```swift
@MainActor class NSSavePanel
```

### Overview

The Save panel provides an interface for specifying the location to save a file and the name of that file. You present this panel when the user attempts to save a new document, or when the user saves a copy of an existing document to a new location. The panel includes UI for browsing the file system, selecting a directory, and specifying the new name for the file. You can also add custom UI for your app using an accessory view.

An `NSSavePanel` object reports user interactions to its associated `NSSavePanel/delegate` object, which must adopt the `NSOpenSavePanelDelegate` protocol. Use your delegate object to validate the user’s selection and respond to user interactions with the panel.

In macOS 10.15, the system always displays the Save dialog in a separate process, regardless of whether the app is sandboxed. When the user saves the document, macOS adds the saved file to the app’s sandbox (if necessary) so that the app can write to the file. Prior to macOS 10.15, the system used a separate process only for sandboxed apps.





## Relationships

**Inherits From**: `NSPanel`

**Inherited By**: `NSOpenPanel`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSMenuItemValidation`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `NSUserInterfaceValidations`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Responding to User Interactions

- `delegate`
- `NSOpenSavePanelDelegate`

### Showing the Panel

- `beginSheetModal(for:completionHandler:)`
- `begin(completionHandler:)`
- `runModal()`
- `validateVisibleColumns()`

### Getting the Selected Item

- `url`

### Configuring the Panel’s Appearance

- `title`
- `prompt`
- `message`
- `nameFieldLabel`
- `nameFieldStringValue`
- `directoryURL`
- `accessoryView`
- `showsTagField`
- `tagNames`

### Configuring the Panel’s Behavior

- `canCreateDirectories`
- `canSelectHiddenExtension`
- `showsHiddenFiles`
- `isExtensionHidden`
- `isExpanded`
- `Button tags`

### Configuring the File Types

- `allowedContentTypes`
- `allowsOtherFileTypes`
- `treatsFilePackagesAsDirectories`

### Handling Actions

- `ok(_:)`
- `cancel(_:)`

### Deprecated

- `Deprecated Symbols`

### Instance Properties

- `identifier`
- `currentContentType`
- `showsContentTypes`

## See Also

- `NSOpenPanel`
- `NSOpenSavePanelDelegate`
