---
url: https://developer.apple.com/documentation/swiftui/scene/defaultlaunchbehavior(_:)
framework: SwiftUI
category: Windows
title: defaultLaunchBehavior(_:)
kind: method
captured: 2026-05-02
---

# defaultLaunchBehavior(_:)

Sets the default launch behavior for this scene.

## Declaration

```swift
nonisolated func defaultLaunchBehavior(_ behavior: SceneLaunchBehavior) -> some Scene

```

### Discussion

This behavior can be used to define if a scene is shown on application launch in the absence of any previously saved state.

On platforms that do not support multiple windows, this value is ignored.

On platforms other than macOS, there must be at least one scene that presents itself. If no scenes are defined to present, the first scene will be presented, regardless of the value provided to this modifier.

> **NOTE:** During app launch, on platforms other than macOS, the system will only consider scenes whose role matches the `Information-Property-List/UIApplicationPreferredDefaultSceneSessionRole` key in the application scene manifest of the `Info.plist` file. For instance, a volumetric window would need the `UIWindowSceneSessionRoleVolumetricApplication` role.

On macOS, this behavior will also be used to determine which scene is presented when clicking on the icon of a running application with no visible windows.

On visionOS, the system may background the last dismissed scene instead of closing it. Thus, the suppressed behavior additionally specifies that the scene should not be presented when tapping on the application icon with no visible windows.

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

The default value for all scenes if you do not apply this modifier is `SceneLaunchBehavior/automatic`. With that strategy, a scene will only present itself if it is the first scene defined by the app, and no other scenes have presented themselves.







## Availability

- macOS 15.0
- visionOS 26.0



## See Also

- `WindowVisibilityToggle`
- `restorationBehavior(_:)`
- `SceneLaunchBehavior`
- `SceneRestorationBehavior`
- `persistentSystemOverlays(_:)`
- `windowToolbarFullScreenVisibility(_:)`
- `WindowToolbarFullScreenVisibility`
