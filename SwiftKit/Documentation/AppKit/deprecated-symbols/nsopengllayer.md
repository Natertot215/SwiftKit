---
url: https://developer.apple.com/documentation/appkit/nsopengllayer
framework: AppKit
category: Deprecated symbols
title: NSOpenGLLayer
kind: class
captured: 2026-05-02
---

# NSOpenGLLayer

A subclass of `CAOpenGLLayer` that is suitable for rendering OpenGL into layers.

## Declaration

```swift
class NSOpenGLLayer
```

### Overview

Unlike `CAOpenGLLayer`, `NSOpenGLLayer` uses AppKit types.





## Relationships

**Inherits From**: `CAOpenGLLayer`

**Conforms To**: `CAMediaTiming`, `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `NSSecureCoding`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.6 (deprecated 10.14)

## Topics

### Drawing the Content

- `canDraw(in:pixelFormat:forLayerTime:displayTime:)`
- `draw(in:pixelFormat:forLayerTime:displayTime:)`

### Managing the Pixel Format

- `openGLPixelFormat`
- `openGLPixelFormat(forDisplayMask:)`

### Managing the Rendering Context

- `openGLContext`
- `openGLContext(for:)`

### Accessing the Associated View

- `view`

## See Also

- `NSOpenGLView`
- `NSOpenGLContext`
- `NSOpenGLPixelFormat`
- `NSDrawer`
- `NSForm`
- `NSFormCell`
- `NSMenuItemCell`
