---
url: https://developer.apple.com/documentation/swiftui/view/windowdismissbehavior(_:)
framework: SwiftUI
category: Windows
title: windowDismissBehavior(_:)
kind: method
captured: 2026-05-02
---

# windowDismissBehavior(_:)

Configures the dismiss functionality for the window enclosing `self`.

## Declaration

```swift
nonisolated func windowDismissBehavior(_ behavior: WindowInteractionBehavior) -> some View

```

### Discussion

By default, the window dismiss functionality is determined by the scene, as well as any modifiers applied to it.

You can use this modifier to override the default behavior.

For example, you can create a welcome workflow window which disables the dismiss functionality:

```swift
struct MyApp: App {
    var body: some Scene {
        ...
        Window("Welcome", id: "welcome") {
            WelcomeView()
                .windowDismissBehavior(.disabled)
        }
    }
}
```

## Parameters

- **behavior**: The dismiss behavior.





## Availability

- macOS 15.0



## See Also

- `WindowManagerRole`
- `windowManagerRole(_:)`
- `WindowInteractionBehavior`
- `windowFullScreenBehavior(_:)`
- `windowMinimizeBehavior(_:)`
- `windowResizeBehavior(_:)`
- `windowBackgroundDragBehavior(_:)`
