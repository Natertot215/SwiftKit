---
url: https://developer.apple.com/documentation/appkit/nssharingservicepickertoolbaritem
framework: AppKit
category: App structure
title: NSSharingServicePickerToolbarItem
kind: class
captured: 2026-05-02
---

# NSSharingServicePickerToolbarItem

A toolbar item that displays the macOS share sheet.

## Declaration

```swift
class NSSharingServicePickerToolbarItem
```

### Overview

An `NSSharingServicePickerToolbarItem` object is a standard item you add to your window’s toolbar. When someone clicks it, the item displays the macOS share sheet. Use this item to share the selected or focal content from the current window. For example, you might share the photo someone is viewing, the currently selected text, or the window’s associated document.

Provide the items to share using the associated `NSSharingServicePickerToolbarItem/delegate` object. For an app built using Mac Catalyst, provide the items from the object in the `NSSharingServicePickerToolbarItem/activityItemsConfiguration` property.





## Relationships

**Inherits From**: `NSToolbarItem`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSMenuItemValidation`, `NSObjectProtocol`, `NSValidatedUserInterfaceItem`, `Sendable`, `SendableMetatype`

## Availability

- iOS 10.13
- iPadOS 10.13
- Mac Catalyst 13.1
- macOS 10.15

## Topics

### Getting the Toolbar Items

- `delegate`
- `NSSharingServicePickerToolbarItemDelegate`
- `activityItemsConfiguration`

## See Also

- `NSSharingService`
- `NSSharingServicePicker`
- `NSPreviewRepresentableActivityItem`
- `NSServicesMenuRequestor`
- `NSCloudSharingServiceDelegate`
- `Services Functions`
