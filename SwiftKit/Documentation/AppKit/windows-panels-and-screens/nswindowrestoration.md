---
url: https://developer.apple.com/documentation/appkit/nswindowrestoration
framework: AppKit
category: Windows, panels, and screens
title: NSWindowRestoration
kind: protocol
captured: 2026-05-02
---

# NSWindowRestoration

A set of methods that restoration classes must implement to handle the recreation of windows.

## Declaration

```swift
protocol NSWindowRestoration : NSObjectProtocol
```

### Overview

At launch time, the application object retrieves the restoration class and uses its `NSWindowRestoration/restoreWindow(withIdentifier:state:completionHandler:)` method to obtain a new window whose type matches the type that was preserved previously. Classes that adopt this protocol can use the provided information to create (or obtain a reference to) the window in the new application. As part of creating the window, the class should also create any related objects, such as window controllers, normally used to manage the window.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSDocumentController`

## Availability

- macOS ?

## Topics

### Handling Window Restoration

- `restoreWindow(withIdentifier:state:completionHandler:)`

## See Also

- `Restoring your app’s state with AppKit`
- `NSUserInterfaceItemIdentification`
