---
url: https://developer.apple.com/documentation/appkit/nspasteboarditem
framework: AppKit
category: Documents, data, and pasteboard
title: NSPasteboardItem
kind: class
captured: 2026-05-02
---

# NSPasteboardItem

An item on a pasteboard.

## Declaration

```swift
class NSPasteboardItem
```

### Overview

There are three main uses for an `NSPasteboardItem` object:

- Providing data on the pasteboard.

You can create one or more pasteboard items, set data or data providers for types, and write them to the pasteboard.

- Customizing data already on the pasteboard.

As a delegate or subclass, you can retrieve the pasteboard items currently on the pasteboard, read the existing types and data, and set new data and data providers for types as necessary.

- Retrieving data from the pasteboard.

You can retrieve pasteboard items from the pasteboard and then read the data for types you’re interested in.

A pasteboard item can be associated with a single pasteboard. When you create an item, you can write it to any pasteboard. When you pass an item to a pasteboard in `NSPasteboard/writeObjects(_:)`, that item becomes bound to the pasteboard it writes to. When you retrieve items from a pasteboard using `NSPasteboard/pasteboardItems` or `NSPasteboard/readObjects(forClasses:options:)`, the returned items are associated with the messaged pasteboard. Passing an item that is already associated with a pasteboard into `NSPasteboard/writeObjects(_:)` causes an exception.

Use pasteboard items during a single pasteboard interaction, rather than retaining and reusing them. A pasteboard item is only valid until the owner of the pasteboard changes.

> **IMPORTANT:**  When a pasteboard item’s owner changes, it becomes stale and its methods return an empty array, `nil`, or `false`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `NSPasteboardReading`, `NSPasteboardWriting`

## Availability

- macOS 10.6

## Topics

### Getting types

- `types`
- `availableType(from:)`

### Setting the data provider

- `setDataProvider(_:forTypes:)`

### Setting values

- `setData(_:forType:)`
- `setString(_:forType:)`
- `setPropertyList(_:forType:)`

### Getting values

- `data(forType:)`
- `string(forType:)`
- `propertyList(forType:)`

### Detecting patterns and metadata in pasteboard items

- `detectedPatterns(for:)`
- `detectedValues(for:)`
- `NSPasteboardItem.DetectedValues`
- `detectedMetadata(for:)`
- `NSPasteboardItem.DetectedMetadata`

### Initializers

- `init(pasteboardPropertyList:ofType:)`

### Instance Properties

- `collaborationMetadata`

## See Also

- `NSPasteboard`
- `NSPasteboardReading`
- `NSPasteboardWriting`
- `NSPasteboardItemDataProvider`
- `NSPasteboard.ContentsOptions`
- `NSPasteboardTypeOwner`
