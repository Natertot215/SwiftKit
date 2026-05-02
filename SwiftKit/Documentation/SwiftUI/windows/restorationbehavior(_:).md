---
url: https://developer.apple.com/documentation/swiftui/scene/restorationbehavior(_:)
framework: SwiftUI
category: Windows
title: restorationBehavior(_:)
kind: method
captured: 2026-05-02
---

# restorationBehavior(_:)

Sets the restoration behavior for this scene.

## Declaration

```swift
nonisolated func restorationBehavior(_ behavior: SceneRestorationBehavior) -> some Scene

```

### Discussion

Use this scene modifier to apply a value of this type to a `Scene` you define in your `App` declaration. The value you specify determines how the system will restore windows from a previous run of your application.

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

The default value for all scenes if you do not apply the modifier is `SceneRestorationBehavior/automatic`. With that strategy, scenes will restore themselves depending on the default behavior for the platform.







## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `WindowVisibilityToggle`
- `defaultLaunchBehavior(_:)`
- `SceneLaunchBehavior`
- `SceneRestorationBehavior`
- `persistentSystemOverlays(_:)`
- `windowToolbarFullScreenVisibility(_:)`
- `WindowToolbarFullScreenVisibility`
