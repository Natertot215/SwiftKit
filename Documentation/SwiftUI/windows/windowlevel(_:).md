---
url: https://developer.apple.com/documentation/swiftui/scene/windowlevel(_:)
framework: SwiftUI
category: Windows
title: windowLevel(_:)
kind: method
captured: 2026-05-02
---

# windowLevel(_:)

Sets the window level of this scene.

## Declaration

```swift
nonisolated func windowLevel(_ level: WindowLevel) -> some Scene

```

### Discussion

```swift
Window("Utility Window", id: "...") {
    UtilityContent()
}
.windowLevel(.floating)
```

## Parameters

- **level**: The desired window level





## Availability

- macOS 15.0



## See Also

- `defaultPosition(_:)`
- `WindowLevel`
- `WindowLayoutRoot`
- `WindowPlacement`
- `defaultWindowPlacement(_:)`
- `windowIdealPlacement(_:)`
- `WindowPlacementContext`
- `WindowProxy`
- `DisplayProxy`
