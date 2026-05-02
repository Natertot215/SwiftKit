---
url: https://developer.apple.com/documentation/swiftui/windowmanagerrole
framework: SwiftUI
category: Windows
title: WindowManagerRole
kind: struct
captured: 2026-05-02
---

# WindowManagerRole

Options for defining how a scene’s windows behave when used within a managed window context, such as full screen mode and Stage Manager.

## Declaration

```swift
struct WindowManagerRole
```

### Overview

Use values of this type in conjunction with the `Scene/windowManagerRole(_:)` modifier to override the default system behavior.

For example, you can specify that a secondary `Window` scene should use the principal role for full screen and Stage Manager:

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





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Type Properties

- `associated`
- `automatic`
- `principal`

## See Also

- `windowManagerRole(_:)`
- `WindowInteractionBehavior`
- `windowDismissBehavior(_:)`
- `windowFullScreenBehavior(_:)`
- `windowMinimizeBehavior(_:)`
- `windowResizeBehavior(_:)`
- `windowBackgroundDragBehavior(_:)`
