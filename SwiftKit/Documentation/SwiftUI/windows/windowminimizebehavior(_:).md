---
url: https://developer.apple.com/documentation/swiftui/view/windowminimizebehavior(_:)
framework: SwiftUI
category: Windows
title: windowMinimizeBehavior(_:)
kind: method
captured: 2026-05-02
---

# windowMinimizeBehavior(_:)

Configures the minimize functionality for the window enclosing `self`.

## Declaration

```swift
nonisolated func windowMinimizeBehavior(_ behavior: WindowInteractionBehavior) -> some View

```

### Discussion

On macOS, windows which support being minimized will move into the Dock when the minimize button is clicked, or the corresponding menu item is selected.

By default, the window minimize functionality is determined by the scene, as well as any modifiers applied to it.

You can use this modifier to override the default behavior.

For example, you can create a custom “About” window which disables the minimize functionality:

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
- `windowResizeBehavior(_:)`
- `windowBackgroundDragBehavior(_:)`
