---
url: https://developer.apple.com/documentation/swiftui/windowplacement
framework: SwiftUI
category: Windows
title: WindowPlacement
kind: struct
captured: 2026-05-02
---

# WindowPlacement

A type which represents a preferred size and position for a window.

## Declaration

```swift
struct WindowPlacement
```

### Overview

When using the `Scene.defaultWindowPlacement(_:)` modifier, you return an instance of a `WindowPlacement` in the closure you provide.

When constructing a window placement, many initial parameters are optional. Any value not specified will fall back to the scene’s default behavior and configuration for sizing and positioning it’s windows.

For example, you can use this to position a window 140 points from the bottom of the visible area of the screen:

```swift
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
```





## Relationships

**Conforms To**: `Equatable`

## Availability

- macOS 15.0
- visionOS 2.0

## Topics

### Structures

- `WindowPlacement.Position`

### Initializers

- `init(_:)`
- `init(_:size3D:)`
- `init(_:size:)`
- `init(_:width:height:)`
- `init(_:width:height:depth:)`
- `init(x:y:width:height:)`

## See Also

- `defaultPosition(_:)`
- `WindowLevel`
- `windowLevel(_:)`
- `WindowLayoutRoot`
- `defaultWindowPlacement(_:)`
- `windowIdealPlacement(_:)`
- `WindowPlacementContext`
- `WindowProxy`
- `DisplayProxy`
