---
url: https://developer.apple.com/documentation/swiftui/uiviewrepresentable
framework: SwiftUI
category: UIKit integration
title: UIViewRepresentable
kind: protocol
captured: 2026-05-02
---

# UIViewRepresentable

A wrapper for a UIKit view that you use to integrate that view into your SwiftUI view hierarchy.

## Declaration

```swift
@MainActor @preconcurrency protocol UIViewRepresentable : View where Self.Body == Never
```

### Overview

Use a `UIViewRepresentable` instance to create and manage a `UIView` object in your SwiftUI interface. Adopt this protocol in one of your app’s custom instances, and use its methods to create, update, and tear down your view. The creation and update processes parallel the behavior of SwiftUI views, and you use them to configure your view with your app’s current state information. Use the teardown process to remove your view cleanly from your SwiftUI. For example, you might use the teardown process to notify other objects that the view is disappearing.

To add your view into your SwiftUI interface, create your `UIViewRepresentable` instance and add it to your SwiftUI interface. The system calls the methods of your representable instance at appropriate times to create and update the view. The following example shows the inclusion of a custom `MyRepresentedCustomView` structure in the view hierarchy.

```swift
struct ContentView: View {
   var body: some View {
      VStack {
         Text("Global Sales")
         MyRepresentedCustomView()
      }
   }
}
```

The system doesn’t automatically communicate changes occurring within your view to other parts of your SwiftUI interface. When you want your view to coordinate with other SwiftUI views, you must provide a `NSViewControllerRepresentable/Coordinator` instance to facilitate those interactions. For example, you use a coordinator to forward target-action and delegate messages from your view to any SwiftUI views.

> **WARNING:** SwiftUI fully controls the layout of the UIKit view’s `UIView/center`, `UIView/bounds`, `UIView/frame`, and `UIView/transform` properties. Don’t directly set these layout-related properties on the view managed by a `UIViewRepresentable` instance from your own code because that conflicts with SwiftUI and results in undefined behavior.





## Relationships

**Inherits From**: `View`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- tvOS 13.0
- visionOS 1.0

## Topics

### Creating and updating the view

- `makeUIView(context:)`
- `updateUIView(_:context:)`
- `UIViewRepresentable.Context`
- `UIViewType`

### Specifying a size

- `sizeThatFits(_:uiView:context:)`

### Cleaning up the view

- `dismantleUIView(_:coordinator:)`

### Providing a custom coordinator object

- `makeCoordinator()`
- `Coordinator`

### Performing layout

- `UIViewRepresentable.LayoutOptions`

## See Also

- `UIViewRepresentableContext`
- `UIViewControllerRepresentable`
- `UIViewControllerRepresentableContext`
