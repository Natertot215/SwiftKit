---
url: https://developer.apple.com/documentation/swiftui/nsviewrepresentable
framework: SwiftUI
category: AppKit integration
title: NSViewRepresentable
kind: protocol
captured: 2026-05-02
---

# NSViewRepresentable

A wrapper that you use to integrate an AppKit view into your SwiftUI view hierarchy.

## Declaration

```swift
@MainActor @preconcurrency protocol NSViewRepresentable : View where Self.Body == Never
```

### Overview

Use an `NSViewRepresentable` instance to create and manage an `NSView` object in your SwiftUI interface. Adopt this protocol in one of your app’s custom instances, and use its methods to create, update, and tear down your view. The creation and update processes parallel the behavior of SwiftUI views, and you use them to configure your view with your app’s current state information. Use the teardown process to remove your view cleanly from your SwiftUI. For example, you might use the teardown process to notify other objects that the view is disappearing.

To add your view into your SwiftUI interface, create your `NSViewRepresentable` instance and add it to your SwiftUI interface. The system calls the methods of your representable instance at appropriate times to create and update the view. The following example shows the inclusion of a custom `MyRepresentedCustomView` struct in the view hierarchy.

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

The system doesn’t automatically communicate changes occurring within your view controller to other parts of your SwiftUI interface. When you want your view controller to coordinate with other SwiftUI views, you must provide a `NSViewControllerRepresentable/Coordinator` object to facilitate those interactions. For example, you use a coordinator to forward target-action and delegate messages from your view controller to any SwiftUI views.

> **WARNING:** SwiftUI fully controls the layout of the AppKit view using the view’s `NSView/frame` and `NSView/bounds` properties. Don’t directly set these layout-related properties on the view managed by an `NSViewRepresentable` instance from your own code because that conflicts with SwiftUI and results in undefined behavior.





## Relationships

**Inherits From**: `View`

## Availability

- macOS 10.15

## Topics

### Creating and updating the view

- `makeNSView(context:)`
- `updateNSView(_:context:)`
- `NSViewRepresentable.Context`
- `NSViewType`

### Specifying a size

- `sizeThatFits(_:nsView:context:)`

### Cleaning up the view

- `dismantleNSView(_:coordinator:)`

### Providing a custom coordinator object

- `makeCoordinator()`
- `Coordinator`

### Performing layout

- `NSViewRepresentable.LayoutOptions`

## See Also

- `NSViewRepresentableContext`
- `NSViewControllerRepresentable`
- `NSViewControllerRepresentableContext`
