---
url: https://developer.apple.com/documentation/swiftui/wkinterfaceobjectrepresentable
framework: SwiftUI
category: WatchKit integration
title: WKInterfaceObjectRepresentable
kind: protocol
captured: 2026-05-02
---

# WKInterfaceObjectRepresentable

A view that represents a WatchKit interface object.

## Declaration

```swift
@MainActor @preconcurrency protocol WKInterfaceObjectRepresentable : View where Self.Body == Never
```

### Overview

Use a `WKInterfaceObjectRepresentable` instance to create and manage a `WKInterfaceObject` in your SwiftUI interface. Adopt this protocol in one of your app’s custom instances, and use its methods to create, update, and tear down your interface object. The creation and update processes parallel the behavior of SwiftUI views, and you use them to configure your interface object with your app’s current state information. Use the teardown process to remove your interface object cleanly from your SwiftUI. For example, you might use the teardown process to notify other parts of your app that the interface object is disappearing.

To add your interface object into your SwiftUI interface, create your `WKInterfaceObjectRepresentable` instance and add it to your SwiftUI interface. The system calls the methods of your representable instance at appropriate times to create and update the interface object.

The system doesn’t automatically communicate changes occurring within your interface object to other parts of your SwiftUI interface. When you want your interface object to coordinate with other SwiftUI views, you must provide a `WKInterfaceObjectRepresentable/Coordinator` instance to facilitate those interactions. For example, you use a coordinator to forward target-action and delegate messages from your interface object to any SwiftUI views.





## Relationships

**Inherits From**: `View`

## Availability

- watchOS 6.0

## Topics

### Creating and updating the interface object

- `makeWKInterfaceObject(context:)`
- `updateWKInterfaceObject(_:context:)`
- `WKInterfaceObjectRepresentable.Context`

### Cleaning up the interface object

- `dismantleWKInterfaceObject(_:coordinator:)`

### Providing a custom coordinator object

- `makeCoordinator()`
- `Coordinator`
- `WKInterfaceObjectType`

## See Also

- `WKInterfaceObjectRepresentableContext`
