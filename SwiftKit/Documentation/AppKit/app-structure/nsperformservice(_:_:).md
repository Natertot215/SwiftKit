---
url: https://developer.apple.com/documentation/appkit/nsperformservice(_:_:)
framework: AppKit
category: App structure
title: NSPerformService(_:_:)
kind: func
captured: 2026-05-02
---

# NSPerformService(_:_:)

Programmatically invokes a Services menu service.

## Declaration

```swift
func NSPerformService(_ itemName: String, _ pboard: NSPasteboard?) -> Bool
```

### Return Value

`true` if the service was successfully performed or `false` if it was not.

### Discussion

Use this function to programmatically invoke a service found in the application’s Services menu.

## Parameters

- **itemName**: Specifies a Services menu item, in any language. If the requested service is from a submenu of the Services menu, the value must contain a slash (for example, “Mail/Selection”).
- **pboard**: The pasteboard containing the data required by the service. This data must be present for the service to succeed. On output, this pasteboard contains the data returned by the service provider.





## Availability

- macOS ?
