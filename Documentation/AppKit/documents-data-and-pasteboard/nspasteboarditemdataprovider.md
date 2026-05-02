---
url: https://developer.apple.com/documentation/appkit/nspasteboarditemdataprovider
framework: AppKit
category: Documents, data, and pasteboard
title: NSPasteboardItemDataProvider
kind: protocol
captured: 2026-05-02
---

# NSPasteboardItemDataProvider

A set of methods implemented by the data provider of a pasteboard item to provide the data for a particular UTI type.

## Declaration

```swift
protocol NSPasteboardItemDataProvider : NSObjectProtocol
```

### Overview

You can specify an object as a pasteboard data provider for a pasteboard item using `NSPasteboardItem`’s `NSPasteboardItem/setDataProvider(_:forTypes:)` method. The data provider must implement this protocol to provide data upon request.





## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Providing Data

- `pasteboard(_:item:provideDataForType:)`
- `pasteboardFinishedWithDataProvider(_:)`

## See Also

- `NSPasteboard`
- `NSPasteboardItem`
- `NSPasteboardReading`
- `NSPasteboardWriting`
- `NSPasteboard.ContentsOptions`
- `NSPasteboardTypeOwner`
