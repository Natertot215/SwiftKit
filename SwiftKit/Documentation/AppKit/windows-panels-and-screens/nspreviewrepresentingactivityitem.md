---
url: https://developer.apple.com/documentation/appkit/nspreviewrepresentingactivityitem
framework: AppKit
category: Windows, panels, and screens
title: NSPreviewRepresentingActivityItem
kind: class
captured: 2026-05-02
---

# NSPreviewRepresentingActivityItem

A type that adds metadata to an item you share using the macOS share sheet.

## Declaration

```swift
class NSPreviewRepresentingActivityItem
```

### Overview

An `NSPreviewRepresentingActivityItem` object provides a concrete implementation of the `NSPreviewRepresentableActivityItem` protocol. Use it to create shareable items for common types such as strings or images, or when you don’t want to adopt the `NSPreviewRepresentableActivityItem` protocol directly in your app’s objects. To share the item from your app, initialize the `NSSharingServicePicker` object with this object.

> **NOTE:**  If your data consists of a URL, pass that URL directly to the sharing service picker instead of using this class.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `NSPreviewRepresentableActivityItem`

## Availability

- macOS 13.0

## Topics

### Creating a Preview Activity Item

- `init(item:title:image:icon:)`
- `init(item:title:imageProvider:iconProvider:)`

## See Also

- `NSSharingServicePicker`
- `NSPreviewRepresentableActivityItem`
