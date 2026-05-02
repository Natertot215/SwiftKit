---
url: https://developer.apple.com/documentation/swiftui/scene/windowidealplacement(_:)
framework: SwiftUI
category: Windows
title: windowIdealPlacement(_:)
kind: method
captured: 2026-05-02
---

# windowIdealPlacement(_:)

Provides a function which determines a placement to use when windows of a scene zoom.

## Declaration

```swift
nonisolated func windowIdealPlacement(_ makePlacement: @escaping (WindowLayoutRoot, WindowPlacementContext) -> WindowPlacement) -> some Scene

```

### Discussion

The default behavior will size the window to its maximum size, or the bounds of the display, whichever is smaller. By overriding this behavior, you can provide a size that is appropriate for the contents of your window.

This modifier’s closure takes two parameters. `content` provides a proxy for the root content of the window. `context` is an instance of a `WindowPlacementContext` that provides contextual information used to size and position windows.

For example, you can provide a placement with a height equal to the display bounds, and a width based on your content’s ideal width:

```swift
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowIdealPlacement { content, context in
            let displayBounds = context.defaultDisplay.visibleRect
            let proposal = ProposedViewSize(
                width: nil, height: displayBounds.height)
            let contentSize = content.sizeThatFits(proposal)
            return .init(
                width: contentSize.width,
                height: contentSize.height)
        }
    }
}
```

## Parameters

- **makePlacement**: A closure which returns the ideal placement for a window derived from this scene.

**content**: A proxy for the contents of the window.

**context**: An instance of a `WindowPlacementContext` that provides contextual information used to size and position windows.





## Availability

- macOS 15.0



## See Also

- `defaultPosition(_:)`
- `WindowLevel`
- `windowLevel(_:)`
- `WindowLayoutRoot`
- `WindowPlacement`
- `defaultWindowPlacement(_:)`
- `WindowPlacementContext`
- `WindowProxy`
- `DisplayProxy`
