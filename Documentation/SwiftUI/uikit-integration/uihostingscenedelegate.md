---
url: https://developer.apple.com/documentation/swiftui/uihostingscenedelegate
framework: SwiftUI
category: UIKit integration
title: UIHostingSceneDelegate
kind: protocol
captured: 2026-05-02
---

# UIHostingSceneDelegate

Extends `UIKit/UISceneDelegate` to bridge SwiftUI scenes.

## Declaration

```swift
protocol UIHostingSceneDelegate : UISceneDelegate
```

### Overview

Declare any SwiftUI scenes you wish to activate from UIKit in the static `rootScene` property of your conforming class:

```swift
class HostingSceneDelegate: UIHostingSceneDelegate {
    static var rootScene: some Scene {
        WindowGroup(id: "swiftui-window") {
            ContentView()
        }
    }

    // Add UISceneDelegate lifecycle callbacks here
}
```

Use a class conforming to `UIHostingSceneDelegate` to  activate a scene by its ID or presented value with `UISceneSessionActivationRequest`:

```swift
if let requestWithID = UISceneSessionActivationRequest(
    hostingDelegateClass: HostingSceneDelegate.self,
    id: "swiftui-window"
) {
    UIApplication.shared.activateSceneSession(for: requestWithID)
}

if let requestWithData = UISceneSessionActivationRequest(
    hostingDelegateClass: HostingSceneDelegate.self,
    value: FavoriteNumber(13)
) {
    UIApplication.shared.activateSceneSession(for: requestWithData)
}
```

When a SwiftUI scene declared in your `rootScene` property is activated, an instance of your conforming class will be created by SwiftUI and receive window scene lifecycle callbacks.

Your `UIHostingSceneDelegate` class can be used with a `UISceneConfiguration` in your app delegate’s `application(_:configurationForConnecting:options:)`method to activate a SwiftUI scene in response to an external event:

```swift
class AppDelegate: UIApplicationDelegate {

    func application(
        _ app: UIApplication,
        configurationForConnecting sceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let config = UISceneConfiguration(
            name: nil, sessionRole: sceneSession.role)
        config.delegateClass = HostingSceneDelegate.self
        return config
    }

}
```





## Relationships

**Inherits From**: `NSObjectProtocol`, `UISceneDelegate`

## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- tvOS 26.0
- visionOS 26.0

## Topics

### Associated Types

- `RootScene`

### Type Properties

- `rootScene`

## See Also

- `Using SwiftUI with UIKit`
- `Unifying your app’s animations`
- `UIHostingController`
- `UIHostingControllerSizingOptions`
- `UIHostingConfiguration`
