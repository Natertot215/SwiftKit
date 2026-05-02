---
url: https://developer.apple.com/documentation/appkit/nspasteboardwriting
framework: AppKit
category: Documents, data, and pasteboard
title: NSPasteboardWriting
kind: protocol
captured: 2026-05-02
---

# NSPasteboardWriting

A set of methods that defines the interface for retrieving a representation of an object that can be written to a pasteboard.

## Declaration

```swift
protocol NSPasteboardWriting : NSObjectProtocol
```

### Overview

The Cocoa framework classes `NSString`, `NSAttributedString`, `NSURL`, `NSColor`, `NSSound`, `NSImage`, and `NSPasteboardItem` implement this protocol. You can make your custom class conform to this protocol so that you can write instances of the class to a pasteboard using the `NSPasteboard/writeObjects(_:)` method of `NSPasteboard`.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSColor`, `NSFilePromiseProvider`, `NSImage`, `NSPasteboardItem`, `NSSound`, `NSTextStorage`

## Availability

- macOS ?

## Topics

### Required Methods

- `writableTypes(for:)`
- `writingOptions(forType:pasteboard:)`
- `NSPasteboard.WritingOptions`

### Property List for Type

- `pasteboardPropertyList(forType:)`

### Constants

- `Pasteboard Writing Options`
- `NSPasteboard.WritingOptions`

## See Also

- `NSPasteboard`
- `NSPasteboardItem`
- `NSPasteboardReading`
- `NSPasteboardItemDataProvider`
- `NSPasteboard.ContentsOptions`
- `NSPasteboardTypeOwner`
