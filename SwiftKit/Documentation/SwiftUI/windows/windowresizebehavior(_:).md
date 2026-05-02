---
url: https://developer.apple.com/documentation/swiftui/view/windowresizebehavior(_:)
framework: SwiftUI
category: Windows
title: windowResizeBehavior(_:)
kind: method
captured: 2026-05-02
---

# windowResizeBehavior(_:)

Configures the resize functionality for the window enclosing `self`.

## Declaration

```swift
nonisolated func windowResizeBehavior(_ behavior: WindowInteractionBehavior) -> some View

```

### Discussion

By default, the window resizability functionality is determined by the scene, as well as any modifiers applied to it. Additionally, when using the `Scene/windowResizability(_:)` modifier, the minimum and maximum size of the window’s contents will also determine the resizability behavior.

You can use this modifier to override the default behavior.

For example, you can create a custom “About” window which only allows for dismissal:

```swift
struct MyApp: App {
    var body: some Scene {
        ...
        Window("About MyApp", id: "about") {
            AboutView()
                .windowResizeBehavior(.disabled)
                .windowMinimizeBehavior(.disabled)
        }
        .windowResizability(.contentSize)
    }
}
```

## Parameters

- **behavior**: The resize behavior.





## Availability

- macOS 15.0



## See Also

- `WindowManagerRole`
- `windowManagerRole(_:)`
- `WindowInteractionBehavior`
- `windowDismissBehavior(_:)`
- `windowFullScreenBehavior(_:)`
- `windowMinimizeBehavior(_:)`
- `windowBackgroundDragBehavior(_:)`
