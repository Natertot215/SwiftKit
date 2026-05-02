---
url: https://developer.apple.com/documentation/appkit/nsservicesmenurequestor
framework: AppKit
category: App structure
title: NSServicesMenuRequestor
kind: protocol
captured: 2026-05-02
---

# NSServicesMenuRequestor

A set of methods that support interaction with items users can share through a sharing service.

## Declaration

```swift
protocol NSServicesMenuRequestor : NSObjectProtocol
```

### Overview

This informal protocol consists of two methods, `NSServicesMenuRequestor/writeSelection(to:types:)` and `NSServicesMenuRequestor/readSelection(from:)`. The first method provides data to a remote service, and the second receives any data the remote service might send back. Both respond to messages that are generated when the user chooses a command from the Services menu.





## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Working with Pasteboards

- `readSelection(from:)`
- `writeSelection(to:types:)`

## See Also

- `NSSharingService`
- `NSSharingServicePicker`
- `NSPreviewRepresentableActivityItem`
- `NSSharingServicePickerToolbarItem`
- `NSCloudSharingServiceDelegate`
- `Services Functions`
