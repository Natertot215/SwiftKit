---
url: https://developer.apple.com/documentation/swiftui/wkusernotificationhostingcontroller
framework: SwiftUI
category: WatchKit integration
title: WKUserNotificationHostingController
kind: class
captured: 2026-05-02
---

# WKUserNotificationHostingController

A WatchKit user notification interface controller that hosts a SwiftUI view hierarchy.

## Declaration

```swift
@MainActor @preconcurrency class WKUserNotificationHostingController<Body> where Body : View
```

### Overview

A `WKUserNotificationHostingController` presents and manages your app’s notification interface using SwiftUI views. You must subclass `WKUserNotificationHostingController` and override the `WKUserNotificationHostingController/body` property to provide the set of SwiftUI views you want to display. In the storyboard of your watch app, specify the name of your custom class for your dynamic interactive interface.





## Relationships

**Inherits From**: `WKUserNotificationInterfaceController`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- watchOS 6.0

## Topics

### Creating a hosting controller object

- `init()`

### Getting the root view

- `body`

### Configuring the notification

- `coalescedDescriptionFormat`
- `isInteractive`
- `sashColor`
- `subtitleColor`
- `titleColor`
- `wantsSashBlur`

## See Also

- `WKHostingController`
