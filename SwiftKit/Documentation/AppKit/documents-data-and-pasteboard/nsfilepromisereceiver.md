---
url: https://developer.apple.com/documentation/appkit/nsfilepromisereceiver
framework: AppKit
category: Documents, data, and pasteboard
title: NSFilePromiseReceiver
kind: class
captured: 2026-05-02
---

# NSFilePromiseReceiver

An object that receives a file promise from the pasteboard.

## Declaration

```swift
class NSFilePromiseReceiver
```

### Overview

Because `NSFilePromiseReceiver` implements the `NSPasteboardReading` protocol, you receive all file promises on the drag pasteboard as follows:

Likewise, you can enumerate dragged items by calling the following:

> **NOTE:**  A non-item-based drag source may promise multiple files on the same pasteboard item. To be compatible with these drag sources, many `NSFilePromiseReceiver` methods return an array of values. Multiple-file item-based promises result in one `NSFilePromiseReceiver` per promised file.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `NSPasteboardReading`

## Availability

- macOS 10.12

## Topics

### Instance Properties

- `fileNames`
- `fileTypes`

### Instance Methods

- `receivePromisedFiles(atDestination:options:operationQueue:reader:)`

### Type Properties

- `readableDraggedTypes`

### Initializers

- `init(pasteboardPropertyList:ofType:)`

## See Also

- `Supporting Drag and Drop Through File Promises`
- `Supporting Table View Drag and Drop Through File Promises`
- `Supporting Collection View Drag and Drop Through File Promises`
- `NSFilePromiseProvider`
- `NSFilePromiseProviderDelegate`
