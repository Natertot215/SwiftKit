---
url: https://developer.apple.com/documentation/appkit/nsopenglcontext
framework: AppKit
category: Deprecated symbols
title: NSOpenGLContext
kind: class
captured: 2026-05-02
---

# NSOpenGLContext

An object that represents an OpenGL graphics context, into which all OpenGL calls are rendered.

## Declaration

```swift
class NSOpenGLContext
```

### Overview

An OpenGL context is created using an `NSOpenGLPixelFormat`object that specifies the context’s buffer types and other attributes. A context can be full-screen, offscreen, or associated with an `NSView` object. A context draws into its *drawable object*drawable object, which is the frame buffer that is the target of OpenGL drawing operations.

Every `NSOpenGLContext` object wraps a low-level, platform-specific Core OpenGL (CGL) context. Your application can retrieve the CGL context by calling the `NSOpenGLContext/cglContextObj` method. For more information on the underling CGL context, see `CGL`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSLocking`, `NSObjectProtocol`

## Availability

- macOS 10.0 (deprecated 10.14)

## Topics

### Creating Contexts

- `init(format:share:)`
- `init(cglContextObj:)`

### Managing the Current Context

- `clearCurrentContext()`
- `current`
- `makeCurrentContext()`

### Managing the Drawable Object

- `view`
- `clearDrawable()`
- `update()`

### Flushing the Drawing Buffer

- `flushBuffer()`

### Context Parameter Handling

- `setValues(_:for:)`
- `getValues(_:for:)`

### Working with Virtual Screens

- `currentVirtualScreen`

### Getting the CGL Context Object

- `cglContextObj`

### Getting the Pixel Format

- `pixelFormat`

### Getting the OpenGL Version

- `openGLVersion`

### Constants

- `NSOpenGLContext.Parameter`

### Initializers

- `init(CGLContextObj:)`
- `init(format:shareContext:)`

## See Also

- `NSOpenGLView`
- `NSOpenGLLayer`
- `NSOpenGLPixelFormat`
- `NSDrawer`
- `NSForm`
- `NSFormCell`
- `NSMenuItemCell`
