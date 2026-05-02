---
url: https://developer.apple.com/documentation/swiftui/scene/windowbackgrounddragbehavior(_:)
framework: SwiftUI
category: Windows
title: windowBackgroundDragBehavior(_:)
kind: method
captured: 2026-05-02
---

# windowBackgroundDragBehavior(_:)

Configures the behavior of dragging a window by its background.

## Declaration

```swift
nonisolated func windowBackgroundDragBehavior(_ behavior: WindowInteractionBehavior) -> some Scene

```

### Return Value

A scene configured with the specified behavior of dragging it by its background background.

### Discussion

By default, or when you apply the `WindowInteractionBehavior/automatic` behavior, the system will determine the best suitable behavior based on the configuration of the modified scene.

You can use this modifier to override the default behavior. For example, to always enable dragging a window by its background:

```swift
struct MyApp: App {
    var body: some Scene {
        Window("About MyApp", id: "about") {
            AboutView()
        }
        .windowBackgroundDragBehavior(.enabled)
    }
}
```

If you want to let your users drag your window by a specific view instead of (or in addition to) letting them drag it by its background, use `WindowDragGesture`.

Applying the `WindowInteractionBehavior/enabled` behavior is equivalent to adding a `WindowDragGesture` to the window’s background view.

## Parameters

- **behavior**: The behavior of dragging the modified window by its background.





## Availability

- macOS 15.0



## See Also

- `WindowManagerRole`
- `windowManagerRole(_:)`
- `WindowInteractionBehavior`
- `windowDismissBehavior(_:)`
- `windowFullScreenBehavior(_:)`
- `windowMinimizeBehavior(_:)`
- `windowResizeBehavior(_:)`
