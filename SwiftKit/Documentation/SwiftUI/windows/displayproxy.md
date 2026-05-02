---
url: https://developer.apple.com/documentation/swiftui/displayproxy
framework: SwiftUI
category: Windows
title: DisplayProxy
kind: struct
captured: 2026-05-02
---

# DisplayProxy

A type which provides information about display hardware.

## Declaration

```swift
struct DisplayProxy
```

### Overview

You can use this type with your custom window layouts to size and position windows relative to a display’s bounds.

For example, your custom window layout can position a window 140 points from the bottom of the screen’s visible area:

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

## Topics

### Instance Properties

- `bounds`
- `safeAreaInsets`
- `visibleRect`

## See Also

- `defaultPosition(_:)`
- `WindowLevel`
- `windowLevel(_:)`
- `WindowLayoutRoot`
- `WindowPlacement`
- `defaultWindowPlacement(_:)`
- `windowIdealPlacement(_:)`
- `WindowPlacementContext`
- `WindowProxy`
