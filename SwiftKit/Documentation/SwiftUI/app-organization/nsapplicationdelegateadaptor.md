---
url: https://developer.apple.com/documentation/swiftui/nsapplicationdelegateadaptor
framework: SwiftUI
category: App organization
title: NSApplicationDelegateAdaptor
kind: struct
captured: 2026-05-02
---

# NSApplicationDelegateAdaptor

A property wrapper type that you use to create an AppKit app delegate.

## Declaration

```swift
@MainActor @preconcurrency @propertyWrapper
struct NSApplicationDelegateAdaptor<DelegateType> where DelegateType : NSObject, DelegateType : NSApplicationDelegate
```

## Availability

- **macOS 11.0+**

## Overview

To handle app delegate callbacks in an app that uses the SwiftUI life cycle, define a type that conforms to the [`NSApplicationDelegate`](https://developer.apple.com/documentation/AppKit/NSApplicationDelegate) protocol, and implement the delegate methods that you need. For example, you can implement the [`application(_:didRegisterForRemoteNotificationsWithDeviceToken:)`](https://developer.apple.com/documentation/AppKit/NSApplicationDelegate/application(_:didRegisterForRemoteNotificationsWithDeviceToken:)) method to handle remote notification registration:

```swift
class MyAppDelegate: NSObject, NSApplicationDelegate, ObservableObject {
    func application(
        _ application: NSApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        // Record the device token.
    }
}
```

Then use the `NSApplicationDelegateAdaptor` property wrapper inside your [`App`](https://developer.apple.com/documentation/SwiftUI/App) declaration to tell SwiftUI about the delegate type:

```swift
@main
struct MyApp: App {
    @NSApplicationDelegateAdaptor private var appDelegate: MyAppDelegate
    var body: some Scene { ... }
}
```

SwiftUI instantiates the delegate and calls the delegate's methods in response to life cycle events. Define the delegate adaptor only in your [`App`](https://developer.apple.com/documentation/SwiftUI/App) declaration, and only once for a given app. If you declare it more than once, SwiftUI generates a runtime error.

If your app delegate conforms to the [`ObservableObject`](https://developer.apple.com/documentation/Combine/ObservableObject) protocol, as in the example above, then SwiftUI puts the delegate it creates into the [`Environment`](https://developer.apple.com/documentation/SwiftUI/Environment). You can access the delegate from any scene or view in your app using the [`EnvironmentObject`](https://developer.apple.com/documentation/SwiftUI/EnvironmentObject) property wrapper:

```swift
@EnvironmentObject private var appDelegate: MyAppDelegate
```

This enables you to use the dollar sign (`$`) prefix to get a binding to published properties that you declare in the delegate. For more information, see [`projectedValue`](https://developer.apple.com/documentation/SwiftUI/NSApplicationDelegateAdaptor/projectedValue).

> **Important:** Manage an app's life cycle events without using an app delegate whenever possible. For example, prefer to handle changes in [`ScenePhase`](https://developer.apple.com/documentation/SwiftUI/ScenePhase) instead of relying on delegate callbacks, like [`applicationDidFinishLaunching(_:)`](https://developer.apple.com/documentation/AppKit/NSApplicationDelegate/applicationDidFinishLaunching(_:)).

## Topics

### Creating a delegate adaptor
- [`init(_:)`](https://developer.apple.com/documentation/SwiftUI/NSApplicationDelegateAdaptor/init(_:)) — Creates an AppKit app delegate adaptor using an observable delegate.

### Getting the delegate adaptor
- [`projectedValue`](https://developer.apple.com/documentation/SwiftUI/NSApplicationDelegateAdaptor/projectedValue) — A projection of the observed object that provides bindings to its properties.
- [`wrappedValue`](https://developer.apple.com/documentation/SwiftUI/NSApplicationDelegateAdaptor/wrappedValue) — The underlying delegate.

## Conforms To

- [`DynamicProperty`](https://developer.apple.com/documentation/SwiftUI/DynamicProperty)
- `Sendable`
- `SendableMetatype`
