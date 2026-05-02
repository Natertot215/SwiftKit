---
url: https://developer.apple.com/documentation/appkit/nsfilepromiseproviderdelegate
framework: AppKit
category: Documents, data, and pasteboard
title: NSFilePromiseProviderDelegate
kind: protocol
captured: 2026-05-02
---

# NSFilePromiseProviderDelegate

A set of methods that provides the name of the promised file and writes the file to the destination directory when the file promise is fulfilled.

## Declaration

```swift
protocol NSFilePromiseProviderDelegate : NSObjectProtocol
```







## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Handling File Promises

- `filePromiseProvider(_:fileNameForType:)`
- `filePromiseProvider(_:writePromiseTo:completionHandler:)`
- `operationQueue(for:)`

## See Also

- `Supporting Drag and Drop Through File Promises`
- `Supporting Table View Drag and Drop Through File Promises`
- `Supporting Collection View Drag and Drop Through File Promises`
- `NSFilePromiseProvider`
- `NSFilePromiseReceiver`
