---
url: https://developer.apple.com/documentation/appkit/nsfilepromiseprovider
framework: AppKit
category: Documents, data, and pasteboard
title: NSFilePromiseProvider
kind: class
captured: 2026-05-02
---

# NSFilePromiseProvider

An object that provides a promise for the pasteboard.

## Declaration

```swift
class NSFilePromiseProvider
```

### Overview

A file promise is a possible future file of a specified type.  When you’re working with drag and drop, use promises to indicate intent for future action.  Avoid loading or performing any actions on the file until the promise completes.

Use the `NSFilePromiseProvider` class when creating file promises. Instantiate one `NSFilePromiseProvider` for each file promised. Set the `NSFilePromiseProvider/fileType` and `NSFilePromiseProvider/delegate` properties before writing any `NSFilePromiseProvider` to the pasteboard. The file type must be a Uniform Type Identifier (UTI) that ultimately conforms to `kUTTypeData` or `kUTTypeDirectory`. The `NSFilePromiseProviderDelegate` will write the promised file to the destination directory.

Optionally, you may attach a `userInfo` object of your choosing to the `NSFilePromiseProvider` to determine which promise is being referenced when promising multiple files under the same `NSFilePromiseProviderDelegate` instance.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `NSPasteboardWriting`

## Availability

- macOS 10.12

## Topics

### Initializers

- `init()`
- `init(fileType:delegate:)`

### Instance Properties

- `delegate`
- `fileType`
- `userInfo`

## See Also

- `Supporting Drag and Drop Through File Promises`
- `Supporting Table View Drag and Drop Through File Promises`
- `Supporting Collection View Drag and Drop Through File Promises`
- `NSFilePromiseProviderDelegate`
- `NSFilePromiseReceiver`
