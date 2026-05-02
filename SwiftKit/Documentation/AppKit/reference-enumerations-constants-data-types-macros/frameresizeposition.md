---
url: https://developer.apple.com/documentation/appkit/nscursor/frameresizeposition
framework: AppKit
category: Reference (enumerations, constants, data types, macros)
title: NSCursor.FrameResizePosition
kind: enum
captured: 2026-05-02
---

# NSCursor.FrameResizePosition

The position along the perimeter of a rectangular frame (its edges and corners) from which it’s resized.

## Declaration

```swift
@frozen enum FrameResizePosition
```







## Relationships

**Conforms To**: `BitwiseCopyable`, `CaseIterable`, `Copyable`, `Equatable`, `Escapable`, `Hashable`, `RawRepresentable`, `Sendable`, `SendableMetatype`

## Availability

- Mac Catalyst 18.0
- macOS 15.0

## Topics

### Enumeration Cases

- `NSCursor.FrameResizePosition.bottom`
- `NSCursor.FrameResizePosition.bottomLeft`
- `NSCursor.FrameResizePosition.bottomRight`
- `NSCursor.FrameResizePosition.left`
- `NSCursor.FrameResizePosition.right`
- `NSCursor.FrameResizePosition.top`
- `NSCursor.FrameResizePosition.topLeft`
- `NSCursor.FrameResizePosition.topRight`

### Initializers

- `init(rawValue:)`

### Type Methods

- `bottomLeading(relativeTo:)`
- `bottomTrailing(relativeTo:)`
- `leading(relativeTo:)`
- `topLeading(relativeTo:)`
- `topTrailing(relativeTo:)`
- `trailing(relativeTo:)`

## See Also

- `NSHorizontalDirection`
- `NSSharingCollaborationMode`
- `NSImage.DynamicRange`
- `NSTextCursorAccessoryPlacement`
- `NSVerticalDirection`
- `NSWritingToolsBehavior`
- `NSWritingToolsResultOptions`
