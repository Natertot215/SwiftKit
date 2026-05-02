---
url: https://developer.apple.com/documentation/swiftui/scenerestorationbehavior
framework: SwiftUI
category: Windows
title: SceneRestorationBehavior
kind: struct
captured: 2026-05-02
---

# SceneRestorationBehavior

The restoration behavior for a scene.

## Declaration

```swift
struct SceneRestorationBehavior
```

### Overview

Use the `Scene/restorationBehavior(_:)` scene modifier to apply a value of this type to a `Scene` you define in your `App` declaration. The value you specify determines how the system will restore windows from a previous run of your application.

For example, you may have a scene that you do not wish to be restored on launch:

```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        Window(id: "network-test", "Network Connection Test") {
            NetworkTestView()
        }
        .restorationBehavior(.disabled)
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

- `automatic`
- `disabled`

## See Also

- `WindowVisibilityToggle`
- `defaultLaunchBehavior(_:)`
- `restorationBehavior(_:)`
- `SceneLaunchBehavior`
- `persistentSystemOverlays(_:)`
- `windowToolbarFullScreenVisibility(_:)`
- `WindowToolbarFullScreenVisibility`
