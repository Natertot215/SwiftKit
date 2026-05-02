---
url: https://developer.apple.com/documentation/swiftui/view/windowfullscreenbehavior(_:)
framework: SwiftUI
category: Windows
title: windowFullScreenBehavior(_:)
kind: method
captured: 2026-05-02
---

# windowFullScreenBehavior(_:)

Configures the full screen functionality for the window enclosing `self`.

## Declaration

```swift
nonisolated func windowFullScreenBehavior(_ behavior: WindowInteractionBehavior) -> some View

```

### Discussion

By default, the window full screen functionality is determined by the scene, as well as any modifiers applied to it. Additionally, when using the `Scene/windowResizability(_:)` modifier, the maximum size of the window’s contents will also determine whether a window can be made full screen.

You can use this modifier to override the default behavior.

For example, you can specify that a window cannot enter full screen mode:

```swift
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .windowFullScreenBehavior(.disabled)
        }
    }
}
```

## Parameters

- **behavior**: The full screen behavior.





## Availability

- macOS 15.0



## See Also

- `WindowManagerRole`
- `windowManagerRole(_:)`
- `WindowInteractionBehavior`
- `windowDismissBehavior(_:)`
- `windowMinimizeBehavior(_:)`
- `windowResizeBehavior(_:)`
- `windowBackgroundDragBehavior(_:)`
