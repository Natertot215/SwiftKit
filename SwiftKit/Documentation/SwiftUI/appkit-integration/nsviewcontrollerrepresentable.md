---
url: https://developer.apple.com/documentation/swiftui/nsviewcontrollerrepresentable
framework: SwiftUI
category: AppKit integration
title: NSViewControllerRepresentable
kind: protocol
captured: 2026-05-02
---

# NSViewControllerRepresentable

A wrapper that you use to integrate an AppKit view controller into your SwiftUI interface.

## Declaration

```swift
@MainActor @preconcurrency protocol NSViewControllerRepresentable : View where Self.Body == Never
```

### Overview

Use an `NSViewControllerRepresentable` instance to create and manage an `NSViewController` object in your SwiftUI interface. Adopt this protocol in one of your app’s custom instances, and use its methods to create, update, and tear down your view controller. The creation and update processes parallel the behavior of SwiftUI views, and you use them to configure your view controller with your app’s current state information. Use the teardown process to remove your view controller cleanly from your SwiftUI. For example, you might use the teardown process to notify other objects that the view controller is disappearing.

To add your view controller into your SwiftUI interface, create your `NSViewControllerRepresentable` instance and add it to your SwiftUI interface. The system calls the methods of your custom instance at appropriate times.

The system doesn’t automatically communicate changes occurring within your view controller to other parts of your SwiftUI interface. When you want your view controller to coordinate with other SwiftUI views, you must provide a `NSViewControllerRepresentable/Coordinator` instance to facilitate those interactions. For example, you use a coordinator to forward target-action and delegate messages from your view controller to any SwiftUI views.

> **WARNING:** SwiftUI fully controls the layout of the AppKit view controller’s view using the view’s `NSView/frame` and `NSView/bounds` properties. Don’t directly set these layout-related properties on the view managed by an `NSViewControllerRepresentable` instance from your own code because that conflicts with SwiftUI and results in undefined behavior.





## Relationships

**Inherits From**: `View`

## Availability

- macOS 10.15

## Topics

### Creating and updating the view controller

- `makeNSViewController(context:)`
- `updateNSViewController(_:context:)`
- `NSViewControllerRepresentable.Context`
- `NSViewControllerType`

### Specifying a size

- `sizeThatFits(_:nsViewController:context:)`

### Cleaning up the view controller

- `dismantleNSViewController(_:coordinator:)`

### Providing a custom coordinator object

- `makeCoordinator()`
- `Coordinator`

### Performing layout

- `NSViewControllerRepresentable.LayoutOptions`

## See Also

- `NSViewRepresentable`
- `NSViewRepresentableContext`
- `NSViewControllerRepresentableContext`
