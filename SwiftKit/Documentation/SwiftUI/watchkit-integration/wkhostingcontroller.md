---
url: https://developer.apple.com/documentation/swiftui/wkhostingcontroller
framework: SwiftUI
category: WatchKit integration
title: WKHostingController
kind: class
captured: 2026-05-02
---

# WKHostingController

A WatchKit interface controller that hosts a SwiftUI view hierarchy.

## Declaration

```swift
@MainActor @preconcurrency class WKHostingController<Body> where Body : View
```

### Overview

A `WKHostingController` presents and manages your app’s main interface using SwiftUI views. You must subclass `WKHostingController` and override the `WKHostingController/body` property to provide the set of SwiftUI views you want to display. Display the content of your hosting controller as you would any other `WKInterfaceController` object. For example, you can include it as one of your app’s root interface controllers, or present it modally.





## Relationships

**Inherits From**: `WKInterfaceController`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- watchOS 6.0

## Topics

### Creating a hosting controller object

- `init()`

### Getting the root view

- `body`

### Updating the root view

- `updateBodyIfNeeded()`
- `setNeedsBodyUpdate()`

## See Also

- `WKUserNotificationHostingController`
