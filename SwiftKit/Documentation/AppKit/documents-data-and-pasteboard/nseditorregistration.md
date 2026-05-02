---
url: https://developer.apple.com/documentation/appkit/nseditorregistration
framework: AppKit
category: Documents, data, and pasteboard
title: NSEditorRegistration
kind: protocol
captured: 2026-05-02
---

# NSEditorRegistration

A set of methods that controllers can implement to enable an editor view to inform the controller when it has uncommitted changes.

## Declaration

```swift
protocol NSEditorRegistration : NSObjectProtocol
```

### Overview

An implementor is responsible for tracking which editors have uncommitted changes, and sending those editors `NSObject-swift.class/commitEditing` and `NSObject-swift.class/discardEditing` messages, as appropriate, to force the editor to submit, or discard, their values.

`NSController` provides an implementation of this informal protocol. You would implement this protocol if you wanted to provide your own controller class without subclassing `NSController`.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSArrayController`, `NSController`, `NSDictionaryController`, `NSDocument`, `NSObjectController`, `NSPersistentDocument`, `NSTreeController`, `NSUserDefaultsController`

## Availability

- macOS ?

## Topics

### Instance Methods

- `objectDidBeginEditing(_:)`
- `objectDidEndEditing(_:)`

## See Also

- `NSAccessibility`
- `NSInputServiceProvider`
- `NSInputServerMouseTracker`
- `NSDrawerDelegate`
