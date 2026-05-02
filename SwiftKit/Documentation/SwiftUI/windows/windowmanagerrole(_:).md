---
url: https://developer.apple.com/documentation/swiftui/scene/windowmanagerrole(_:)
framework: SwiftUI
category: Windows
title: windowManagerRole(_:)
kind: method
captured: 2026-05-02
---

# windowManagerRole(_:)

Configures the role for windows derived from `self` when participating in a managed window context, such as full screen or Stage Manager.

## Declaration

```swift
nonisolated func windowManagerRole(_ role: WindowManagerRole) -> some Scene

```

### Discussion

By default, the type of `Scene` and its placement within the app’s definition will determine the behavior of its windows within a window management context.

You can use this modifier to override the default behaivor.

For example, you can specify that a secondary `Window` scene should use the principal behavior for full screen and Stage Manager:

```swift
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        Window("Organizer", id: "organizer") {
            OrganizerView()
        }
        .windowManagerRole(.principal)
    }
}
```







## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `WindowManagerRole`
- `WindowInteractionBehavior`
- `windowDismissBehavior(_:)`
- `windowFullScreenBehavior(_:)`
- `windowMinimizeBehavior(_:)`
- `windowResizeBehavior(_:)`
- `windowBackgroundDragBehavior(_:)`
