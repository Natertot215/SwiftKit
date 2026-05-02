---
url: https://developer.apple.com/documentation/appkit/nspreviewrepresentableactivityitem
framework: AppKit
category: App structure
title: NSPreviewRepresentableActivityItem
kind: protocol
captured: 2026-05-02
---

# NSPreviewRepresentableActivityItem

An interface you adopt in custom objects that you want to share using the macOS share sheet.

## Declaration

```swift
protocol NSPreviewRepresentableActivityItem : NSObjectProtocol
```

### Overview

Adopt the `NSPreviewRepresentableActivityItem` interface in custom types your app makes available for sharing. Use this protocol to specify the item itself and a title and image the share sheet can use to create a preview for your item. To share the item from your app, initialize the `NSSharingServicePicker` object with the object that adopts this protocol.

> **NOTE:**  If your data consists of standard types like strings or images, use an `NSPreviewRepresentingActivityItem` object to specify metadata for those types. If your data consists of URLs, pass them directly to the sharing service picker instead of creating a custom preview item.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSPreviewRepresentingActivityItem`

## Availability

- macOS 13.0

## Topics

### Providing the Item to Share

- `item`

### Providing Metadata About the Item

- `title`
- `imageProvider`
- `iconProvider`

## See Also

- `NSSharingService`
- `NSSharingServicePicker`
- `NSSharingServicePickerToolbarItem`
- `NSServicesMenuRequestor`
- `NSCloudSharingServiceDelegate`
- `Services Functions`
