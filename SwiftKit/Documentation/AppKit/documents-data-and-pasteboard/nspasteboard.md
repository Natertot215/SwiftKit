---
url: https://developer.apple.com/documentation/appkit/nspasteboard
framework: AppKit
category: Documents, data, and pasteboard
title: NSPasteboard
kind: class
captured: 2026-05-02
---

# NSPasteboard

An object that transfers data to and from the pasteboard server.

## Declaration

```swift
class NSPasteboard
```

### Overview

The pasteboard server is shared by all running apps. It contains data that the user has cut or copied, as well as other data that one application wants to transfer to another. `NSPasteboard` objects are an application’s sole interface to the server and to all pasteboard operations.

An `NSPasteboard` object is also used to transfer data between apps and service providers listed in each application’s Services menu. The drag pasteboard is used to transfer data that is being dragged by the user.

A pasteboard can contain multiple items. You can directly write or read any object that implements the `NSPasteboardWriting` or `NSPasteboardReading` `https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/Protocol.html#//apple_ref/doc/uid/TP40008195-CH45` respectively. This allows you to write and read common items such as URLs, colors, images, strings, attributed strings, and sounds without an intermediary object. Your custom classes can also implement these protocols for use with the pasteboard.

Writing methods such as `NSPasteboard/setData(_:forType:)` provide a convenient means of writing to the first pasteboard item, without having to create the first pasteboard item. You can use code like this, for example:

```objc
[pboard clearContents];
[pboard setData:data forType:type];
```

The general pasteboard, available by way of the `NSPasteboard/general` class method, automatically participates with the Universal Clipboard feature in macOS 10.12 and later and in iOS 10.0 and later. There is no macOS API for interacting with this feature.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Creating and releasing a pasteboard

- `general`
- `init(byFilteringData:ofType:)`
- `init(byFilteringFile:)`
- `init(byFilteringTypesInPasteboard:)`
- `init(name:)`
- `NSPasteboard.Name`
- `withUniqueName()`
- `releaseGlobally()`

### Determining pasteboard access

- `accessBehavior`
- `accessBehavior`
- `NSPasteboard.AccessBehavior`

### Writing data

- `clearContents()`
- `writeObjects(_:)`
- `setData(_:forType:)`
- `setPropertyList(_:forType:)`
- `setString(_:forType:)`
- `NSPasteboard.PasteboardType`

### Reading data

- `readObjects(forClasses:options:)`
- `NSPasteboard.ReadingOptionKey`
- `NSPasteboard.ReadingOptions`
- `pasteboardItems`
- `index(of:)`
- `data(forType:)`
- `propertyList(forType:)`
- `string(forType:)`

### Validating contents

- `availableType(from:)`
- `canReadItem(withDataConformingToTypes:)`
- `canReadObject(forClasses:options:)`
- `types`
- `types(filterableTo:)`

### Detecting patterns and metadata in pasteboard items

- `detectedPatterns(for:)`
- `detectedValues(for:)`
- `NSPasteboard.DetectedValues`
- `Pasteboard detection patterns`
- `detectedMetadata(for:)`
- `NSPasteboard.DetectedMetadata`
- `Pasteboard detection metadata types`

### Preparing the pasteboard for content

- `prepareForNewContents(with:)`
- `NSPasteboard.ContentsOptions`

### Getting information about a pasteboard

- `name`
- `changeCount`

### Writing data (macOS 10.5 and earlier)

- `declareTypes(_:owner:)`
- `addTypes(_:owner:)`
- `writeFileContents(_:)`
- `write(_:)`

### Reading data (macOS 10.5 and earlier)

- `readFileContentsType(_:toFile:)`
- `readFileWrapper()`

### Structures

- `NSPasteboard.WritingOptions`

### Initializers

- `init(byFilteringTypesIn:)`

### Default Implementations

- `NSPasteboard Implementations`

## See Also

- `NSPasteboardItem`
- `NSPasteboardReading`
- `NSPasteboardWriting`
- `NSPasteboardItemDataProvider`
- `NSPasteboard.ContentsOptions`
- `NSPasteboardTypeOwner`
