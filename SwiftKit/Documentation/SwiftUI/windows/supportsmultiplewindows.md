---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/supportsmultiplewindows
framework: SwiftUI
category: Windows
title: supportsMultipleWindows
kind: property
captured: 2026-05-02
---

# supportsMultipleWindows

A Boolean value that indicates whether the current platform supports opening multiple windows.

## Declaration

```swift
var supportsMultipleWindows: Bool { get }
```

### Discussion

Read this property from the environment to determine if your app can use the `EnvironmentValues/openWindow` action to open new windows:

```swift
struct NewMailViewerButton: View {
    @Environment(\.supportsMultipleWindows) private var supportsMultipleWindows
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        Button("Open New Window") {
            openWindow(id: "mail-viewer")
        }
        .disabled(!supportsMultipleWindows)
    }
}
```

The reported value depends on both the platform and how you configure your app:

- In macOS, this property returns `true` for any app that uses the SwiftUI app lifecycle.
- In iPadOS, this property returns `true` for any app that uses the SwiftUI app lifecycle and has the Information Property List key `Information-Property-List/UIApplicationSceneManifest/UIApplicationSupportsMultipleScenes` set to `true`.
- For all other platforms and configurations, the value returns `false`.

If the value is false and you try to open a window, SwiftUI ignores the action and logs a runtime error.







## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `Presenting windows and spaces`
- `openWindow`
- `OpenWindowAction`
- `PushWindowAction`
