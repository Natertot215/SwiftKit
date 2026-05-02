---
url: https://developer.apple.com/documentation/appkit/nsuserdefaultscontroller
framework: AppKit
category: Documents, data, and pasteboard
title: NSUserDefaultsController
kind: class
captured: 2026-05-02
---

# NSUserDefaultsController

A controller that accesses user preference information for your app from the user’s defaults database.

## Declaration

```swift
class NSUserDefaultsController
```

### Overview

`NSUserDefaultsController` is a Cocoa bindings–compatible controller class. Properties of the shared instance of this class can be bound to user interface elements to access and modify values stored in `UserDefaults`.





## Relationships

**Inherits From**: `NSController`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSEditor`, `NSEditorRegistration`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Obtaining the shared instance

- `shared`

### Initializing a user defaults controller

- `init(defaults:initialValues:)`
- `init(coder:)`

### Managing user defaults values

- `defaults`
- `initialValues`
- `hasUnappliedChanges`
- `appliesImmediately`
- `values`
- `revert(_:)`
- `revertToInitialValues(_:)`
- `save(_:)`

## See Also

- `NSUbiquitousKeyValueStore`
