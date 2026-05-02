---
url: https://developer.apple.com/documentation/appkit/nspasteboardreading
framework: AppKit
category: Documents, data, and pasteboard
title: NSPasteboardReading
kind: protocol
captured: 2026-05-02
---

# NSPasteboardReading

A set of methods that defines the interface for initializing an object from a pasteboard.

## Declaration

```swift
protocol NSPasteboardReading : NSObjectProtocol
```

### Overview

The Cocoa framework classes `NSString`, `NSAttributedString`, `NSURL`, `NSColor`, `NSSound`, `NSImage`, and `NSPasteboardItem` implement this protocol. You can make your custom class conform to this protocol so that you can read instances from a pasteboard using the `NSPasteboard/readObjects(forClasses:options:)` method of `NSPasteboard`.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSColor`, `NSFilePromiseReceiver`, `NSImage`, `NSPasteboardItem`, `NSSound`, `NSTextStorage`

## Availability

- macOS ?

## Topics

### Initializing the Pasteboard

- `init(pasteboardPropertyList:ofType:)`

### Reading From the Pasteboard

- `readableTypes(for:)`
- `readingOptions(forType:pasteboard:)`
- `NSPasteboard.ReadingOptions`

## See Also

- `NSPasteboard`
- `NSPasteboardItem`
- `NSPasteboardWriting`
- `NSPasteboardItemDataProvider`
- `NSPasteboard.ContentsOptions`
- `NSPasteboardTypeOwner`
