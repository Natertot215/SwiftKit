---
url: https://developer.apple.com/documentation/swiftui/windowlayoutroot
framework: SwiftUI
category: Windows
title: WindowLayoutRoot
kind: struct
captured: 2026-05-02
---

# WindowLayoutRoot

A proxy which represents the root contents of a window.

## Declaration

```swift
struct WindowLayoutRoot
```

### Overview

This type acts like a proxy for the contents of the window defined by a SwiftUI `Scene`. The `Scene.defaultWindowPlacement(_:)` modifier receives an instance of this type, representing the contents of the window being created.

Use this proxy to get information about the window’s contents, like it’s size.







## Availability

- macOS 15.0
- visionOS 2.0

## Topics

### Instance Methods

- `sizeThatFits(_:)`

## See Also

- `defaultPosition(_:)`
- `WindowLevel`
- `windowLevel(_:)`
- `WindowPlacement`
- `defaultWindowPlacement(_:)`
- `windowIdealPlacement(_:)`
- `WindowPlacementContext`
- `WindowProxy`
- `DisplayProxy`
