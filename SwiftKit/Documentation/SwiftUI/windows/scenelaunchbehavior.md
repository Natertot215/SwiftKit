---
url: https://developer.apple.com/documentation/swiftui/scenelaunchbehavior
framework: SwiftUI
category: Windows
title: SceneLaunchBehavior
kind: struct
captured: 2026-05-02
---

# SceneLaunchBehavior

The launch behavior for a scene.

## Declaration

```swift
struct SceneLaunchBehavior
```

### Overview

Use the `Scene/defaultLaunchBehavior(_:)` modifier to apply a value of this type to a `Scene` you specify in your `App`. The value you specify determines how the system will present the scene in the absense of any previously restored scenes on launch of your application.

For example, you may wish to present a welcome window on launch of your app when there are no previous document windows being restored:

```swift
@main
struct MyApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: MyDocument()) { configuration in
            DocumentEditor(configuration.$document)
        }

        Window("Welcome to My App", id: "welcome") {
            WelcomeView()
        }
        .defaultLaunchBehavior(.presented)
    }
}
```





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- macOS 15.0
- visionOS 26.0

## Topics

### Type Properties

- `automatic`
- `presented`
- `suppressed`

## See Also

- `WindowVisibilityToggle`
- `defaultLaunchBehavior(_:)`
- `restorationBehavior(_:)`
- `SceneRestorationBehavior`
- `persistentSystemOverlays(_:)`
- `windowToolbarFullScreenVisibility(_:)`
- `WindowToolbarFullScreenVisibility`
