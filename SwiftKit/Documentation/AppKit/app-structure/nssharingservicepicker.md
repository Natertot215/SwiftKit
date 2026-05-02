---
url: https://developer.apple.com/documentation/appkit/nssharingservicepicker
framework: AppKit
category: App structure
title: NSSharingServicePicker
kind: class
captured: 2026-05-01
---

# NSSharingServicePicker

## Declaration

```swift
class NSSharingServicePicker
```

## Abstract

A list of sharing services that the user can choose from.

## Overview

An `NSSharingServicePicker` object presents an interface for sharing one or more items using a specific service. In macOS 12 and earlier, this picker displays a menu with a list of services that someone can use to share the item. In macOS 13 and later, the picker displays a popover with a preview of the item and the list of services. When someone chooses a service, the picker automatically shares the proposed item with that service.

Create a sharing service picker and configure it with a delegate object to monitor interactions. Your delegate must conform to the `NSSharingServicePickerDelegate` protocol. Present the picker from your interface using the `show(relativeTo:of:preferredEdge:)` method.

## Inheritance

Inherits from `NSObject`

## Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSObjectProtocol`

## Topics

### Creating a sharing service picker

- `init(items:)` - Creates a new sharing service picker for the selected items.

### Managing the sharing service picker

- `delegate` - The object for managing the sharing service picker.
- `NSSharingServicePickerDelegate` - An interface for managing content for the macOS share sheet.

### Displaying the sharing service picker

- `show(relativeTo:of:preferredEdge:)` - Shows the picker interface and populates it with the relevant sharing services.
- `close()` - Closes the picker interface.

### Retrieving the sharing menu item

- `standardShareMenuItem` - A menu item suitable to display the picker for the specified items.

### Classes

- `CollaborationModeRestriction` - Specifies whether a specific type of sharing should be disabled in the share picker, and if so, whether a reason should be provided for the disablement.

## Availability

- **macOS** 10.8+

## See Also

- `NSSharingService` - An object that facilitates the sharing of content with social media services, or with apps like Mail or Safari.
- `NSPreviewRepresentableActivityItem` - An interface you adopt in custom objects that you want to share using the macOS share sheet.
- `NSSharingServicePickerToolbarItem` - A toolbar item that displays the macOS share sheet.
- `NSServicesMenuRequestor` - A set of methods that support interaction with items users can share through a sharing service.
- `NSCloudSharingServiceDelegate` - A set of methods for responding to the life cycle events of the cloud-sharing service.
