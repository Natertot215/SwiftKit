---
url: https://developer.apple.com/documentation/swiftui/pointerstyle
framework: SwiftUI
category: Input events
title: PointerStyle
kind: struct
captured: 2026-05-02
---

# PointerStyle

A style describing the appearance of the pointer (also called a cursor) when it’s hovered over a view.

## Declaration

```swift
struct PointerStyle
```

### Overview

Use the `View/pointerStyle(_:)` view modifier to set a view’s pointer style.

For guidance on choosing an appropriate pointer style, refer to `doc://com.apple.documentation/design/Human-Interface-Guidelines/pointing-devices` in the Human Interface Guidelines.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- macOS 15.0
- visionOS 2.0

## Topics

### Getting built-in pointer styles

- `default`
- `horizontalText`
- `verticalText`
- `rectSelection`
- `grabIdle`
- `grabActive`
- `link`
- `zoomIn`
- `zoomOut`
- `frameResize(position:directions:)`
- `columnResize(directions:)`
- `rowResize(directions:)`

### Creating custom pointer styles

- `image(_:hotSpot:)`
- `shape(_:eoFill:size:)`

### Supporting types

- `HorizontalDirection`
- `VerticalDirection`
- `FrameResizePosition`
- `FrameResizeDirection`

### Type Properties

- `columnResize`
- `rowResize`

## See Also

- `pointerStyle(_:)`
- `pointerVisibility(_:)`
