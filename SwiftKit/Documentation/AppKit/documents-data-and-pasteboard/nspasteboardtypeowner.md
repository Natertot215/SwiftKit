---
url: https://developer.apple.com/documentation/appkit/nspasteboardtypeowner
framework: AppKit
category: Documents, data, and pasteboard
title: NSPasteboardTypeOwner
kind: protocol
captured: 2026-05-02
---

# NSPasteboardTypeOwner

An object that serves as a data provider for data types that use lazy data fulfillment from a pasteboard request.

## Declaration

```swift
protocol NSPasteboardTypeOwner : NSObjectProtocol
```







## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Fulfilling lazy data requests

- `pasteboard(_:provideDataForType:)`

### Changing pasteboard ownership

- `pasteboardChangedOwner(_:)`

## See Also

- `NSPasteboard`
- `NSPasteboardItem`
- `NSPasteboardReading`
- `NSPasteboardWriting`
- `NSPasteboardItemDataProvider`
- `NSPasteboard.ContentsOptions`
