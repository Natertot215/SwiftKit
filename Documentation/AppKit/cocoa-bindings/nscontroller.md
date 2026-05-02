---
url: https://developer.apple.com/documentation/appkit/nscontroller
framework: AppKit
category: Cocoa bindings
title: NSController
kind: class
captured: 2026-05-02
---

# NSController

An abstract class that implements the `NSEditor` and `NSEditorRegistration` informal protocols required for controller classes.

## Declaration

```swift
class NSController
```







## Relationships

**Inherits From**: `NSObject`

**Inherited By**: `NSObjectController`, `NSUserDefaultsController`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSEditor`, `NSEditorRegistration`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Managing editing

- `objectDidBeginEditing(_:)`
- `objectDidEndEditing(_:)`
- `commitEditing()`
- `commitEditing(withDelegate:didCommit:contextInfo:)`
- `discardEditing()`
- `isEditing`

### Initializers

- `init()`
- `init(coder:)`

## See Also

- `NSObjectController`
