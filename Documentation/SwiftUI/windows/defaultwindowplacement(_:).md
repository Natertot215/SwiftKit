---
url: https://developer.apple.com/documentation/swiftui/scene/defaultwindowplacement(_:)
framework: SwiftUI
category: Windows
title: defaultWindowPlacement(_:)
kind: method
captured: 2026-05-02
---

# defaultWindowPlacement(_:)

Defines a function used for determining the default placement of windows.

## Declaration

```swift
nonisolated func defaultWindowPlacement(_ makePlacement: @escaping (WindowLayoutRoot, WindowPlacementContext) -> WindowPlacement) -> some Scene

```

### Discussion

Use this scene modifier to indicate a default initial size and position for a new window that the system creates from a `Scene` declaration.

On macOS, you can use the screen’s bounds to place the window. For example, you can specify that the window is always placed 140 points from the bottom of the screen:

```swift
struct MyApp: App {
    var body: some Scene {
        ...

        Window("Status", id: "status") {
            StatusView()
        }
        .windowResizability(.contentSize)
        .defaultWindowPlacement { content, context in
            let displayBounds = context.defaultDisplay.visibleRect
            let size = content.sizeThatFits(.unspecified)
            let position = CGPoint(
                x: displayBounds.midX - (size.width / 2),
                y: displayBounds.maxY - size.height - 140)
            return WindowPlacement(position: position, size: size)
        }
    }
}
```

On visionOS, the system always places the first window relative to where the person is looking. The system ignores calls to `defaultWindowPlacement(_:)`.

You can place any subsequent windows relative to existing ones by returning one of the methods defined by `WindowPlacement/Position` with the existing window. For example, you can align the new window with the trailing edge of the `Content` window:

```swift
struct MyApp: App {
    @Environment(\.openWindow) private var openWindow

    var body: some Scene {
        WindowGroup("Content", id: "content") {
            Button("Open status window") {
                openWindow(id: "status")
            }
        }

        WindowGroup("Status", id: "status") {
            StatusView()
        }
        .windowResizability(.contentSize)
        .defaultWindowPlacement { content, context in
            if let contentWindow = context.windows.first(
            where: { $0.id == "content" }) {
                WindowPlacement(.trailing(contentWindow))
            } else {
                WindowPlacement()
            }
        }
    }
}
```

The placement that your function returns acts as a default for when the window first appears. People can later resize and move the window using interface controls that the system provides. Also, during state restoration, the system restores the window to it’s most recent size and position, rather than the default placement.

For more information on configuring how scenes behave with state restoration, see `Scene.stateRestoration(_:)`.

## Parameters

- **makePlacement**: A closure to generate the default window placement.

**content**: A proxy for the contents of the window.

**context**: An instance of a `WindowPlacementContext` that provides contextual information used to size and position windows.





## Availability

- macOS 15.0
- visionOS 2.0



## See Also

- `defaultPosition(_:)`
- `WindowLevel`
- `windowLevel(_:)`
- `WindowLayoutRoot`
- `WindowPlacement`
- `windowIdealPlacement(_:)`
- `WindowPlacementContext`
- `WindowProxy`
- `DisplayProxy`
