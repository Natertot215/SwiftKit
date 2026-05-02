---
url: https://developer.apple.com/documentation/appkit/nsopenglpixelformat
framework: AppKit
category: Deprecated symbols
title: NSOpenGLPixelFormat
kind: class
captured: 2026-05-02
---

# NSOpenGLPixelFormat

An object that specifies the types of buffers and other attributes of the OpenGL context.

## Declaration

```swift
class NSOpenGLPixelFormat
```

### Overview

To render with OpenGL into an `NSOpenGLContext`, you must specify the context’s pixel format.

Every `NSOpenGLPixelFormat` object wraps a low-level, platform-specific Core OpenGL (CGL) pixel format object. Your application can retrieve the CGL pixel format object by calling the `NSOpenGLPixelFormat/cglPixelFormatObj` method. For more information on the underling CGL pixel format object, see `CGL`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`

## Availability

- macOS 10.0 (deprecated 10.14)

## Topics

### Creating an OpenGL Pixel Format

- `init(cglPixelFormatObj:)`
- `init(attributes:)`

### Managing the Pixel Format

- `cglPixelFormatObj`
- `getValues(_:forAttribute:forVirtualScreen:)`
- `numberOfVirtualScreens`

### Constants

- `NSOpenGLPixelFormatAttribute`
- `OpenGL Pixel Format Attributes`
- `OpenGL Profiles`

### Initializers

- `init(CGLPixelFormatObj:)`
- `init(coder:)`

## See Also

- `NSOpenGLView`
- `NSOpenGLContext`
- `NSOpenGLLayer`
- `NSDrawer`
- `NSForm`
- `NSFormCell`
- `NSMenuItemCell`
