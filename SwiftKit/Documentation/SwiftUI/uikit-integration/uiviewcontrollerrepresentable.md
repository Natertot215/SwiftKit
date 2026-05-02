---
url: https://developer.apple.com/documentation/swiftui/uiviewcontrollerrepresentable
framework: SwiftUI
category: UIKit integration
title: UIViewControllerRepresentable
kind: protocol
captured: 2026-05-02
---

# UIViewControllerRepresentable

A view that represents a UIKit view controller.

## Declaration

```swift
@MainActor @preconcurrency protocol UIViewControllerRepresentable : View where Self.Body == Never
```

### Overview

Use a `UIViewControllerRepresentable` instance to create and manage a `UIViewController` object in your SwiftUI interface. Adopt this protocol in one of your app’s custom instances, and use its methods to create, update, and tear down your view controller. The creation and update processes parallel the behavior of SwiftUI views, and you use them to configure your view controller with your app’s current state information. Use the teardown process to remove your view controller cleanly from your SwiftUI. For example, you might use the teardown process to notify other objects that the view controller is disappearing.

To add your view controller into your SwiftUI interface, create your `UIViewControllerRepresentable` instance and add it to your SwiftUI interface. The system calls the methods of your custom instance at appropriate times.

The system doesn’t automatically communicate changes occurring within your view controller to other parts of your SwiftUI interface. When you want your view controller to coordinate with other SwiftUI views, you must provide a `NSViewControllerRepresentable/Coordinator` instance to facilitate those interactions. For example, you use a coordinator to forward target-action and delegate messages from your view controller to any SwiftUI views.

> **WARNING:** SwiftUI fully controls the layout of the UIKit view controller’s view using the view’s `UIView/center`, `UIView/bounds`, `UIView/frame`, and `UIView/transform` properties. Don’t directly set these layout-related properties on the view managed by a `UIViewControllerRepresentable` instance from your own code because that conflicts with SwiftUI and results in undefined behavior.





## Relationships

**Inherits From**: `View`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- tvOS 13.0
- visionOS 1.0

## Topics

### Creating and updating the view controller

- `makeUIViewController(context:)`
- `updateUIViewController(_:context:)`
- `UIViewControllerRepresentable.Context`
- `UIViewControllerType`

### Specifying a size

- `sizeThatFits(_:uiViewController:context:)`

### Cleaning up the view controller

- `dismantleUIViewController(_:coordinator:)`

### Providing a custom coordinator object

- `makeCoordinator()`
- `Coordinator`

### Performing layout

- `UIViewControllerRepresentable.LayoutOptions`

## See Also

- `UIViewRepresentable`
- `UIViewRepresentableContext`
- `UIViewControllerRepresentableContext`
