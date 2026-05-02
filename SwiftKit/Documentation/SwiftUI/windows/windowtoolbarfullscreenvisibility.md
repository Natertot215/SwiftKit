---
url: https://developer.apple.com/documentation/swiftui/windowtoolbarfullscreenvisibility
framework: SwiftUI
category: Windows
title: WindowToolbarFullScreenVisibility
kind: struct
captured: 2026-05-02
---

# WindowToolbarFullScreenVisibility

The visibility of the window toolbar with respect to full screen mode.

## Declaration

```swift
struct WindowToolbarFullScreenVisibility
```

### Overview

Use values of this type in conjunction with the `View/windowToolbarFullScreenVisibility(_:)` modifier to configure how the window toolbar displays itself when the window enters full screen mode.

For example, you can specify that the window toolbar should be hidden by default, and only show when the mouse moves into the area occupied by the menu bar:

```swift
struct RootView: View {
    var body: some View {
        ContentView()
            .toolbar {
                ...
            }
            .windowToolbarFullScreenVisibility(.onHover)
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
- `onHover`
- `visible`

## See Also

- `WindowVisibilityToggle`
- `defaultLaunchBehavior(_:)`
- `restorationBehavior(_:)`
- `SceneLaunchBehavior`
- `SceneRestorationBehavior`
- `persistentSystemOverlays(_:)`
- `windowToolbarFullScreenVisibility(_:)`
