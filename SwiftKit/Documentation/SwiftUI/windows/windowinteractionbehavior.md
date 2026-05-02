---
url: https://developer.apple.com/documentation/swiftui/windowinteractionbehavior
framework: SwiftUI
category: Windows
title: WindowInteractionBehavior
kind: struct
captured: 2026-05-02
---

# WindowInteractionBehavior

Options for enabling and disabling window interaction behaviors.

## Declaration

```swift
struct WindowInteractionBehavior
```

### Overview

Use values of this type in conjunction with the following view and scene modifiers to adjust the supported functionality for the window:

- `View/windowDismissBehavior(_:)`
- `View/windowMinimizeBehavior(_:)`
- `View/windowFullScreenBehavior(_:)`
- `View/windowResizeBehavior(_:)`
- `Scene/windowBackgroundDragBehavior(_:)`

For example, you can create a custom “About” window which only allows for dismissal:

```swift
struct MyApp: App {
    var body: some Scene {
        ...
        Window("About MyApp", id: "about") {
            AboutView()
                .windowMinimizeBehavior(.disabled)
                .windowResizeBehavior(.disabled)
        }
        .windowResizability(.contentSize)
    }
}
```





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- macOS 15.0

## Topics

### Type Properties

- `automatic`
- `disabled`
- `enabled`

## See Also

- `WindowManagerRole`
- `windowManagerRole(_:)`
- `windowDismissBehavior(_:)`
- `windowFullScreenBehavior(_:)`
- `windowMinimizeBehavior(_:)`
- `windowResizeBehavior(_:)`
- `windowBackgroundDragBehavior(_:)`
