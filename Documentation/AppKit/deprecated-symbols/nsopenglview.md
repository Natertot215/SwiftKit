---
url: https://developer.apple.com/documentation/appkit/nsopenglview
framework: AppKit
category: Deprecated symbols
title: NSOpenGLView
kind: class
captured: 2026-05-02
---

# NSOpenGLView

A view that displays OpenGL content in a view.

## Declaration

```swift
class NSOpenGLView
```

### Overview

An `NSOpenGLView` object maintains an `NSOpenGLPixelFormat` and `NSOpenGLContext` object into which OpenGL calls can be rendered. The view provides methods for accessing and managing the `NSOpenGLPixelFormat` and `NSOpenGLContext` objects, as well as notifications of visible region changes.

An `NSOpenGLView` object cannot have subviews. You can, however, divide a single `NSOpenGLView` into multiple rendering areas using the `glViewport` function.

When creating an `NSOpenGLView` object in Interface Builder, you use the inspector window to specify the pixel format attributes you want for the view. Only those attributes listed in the Interface Builder inspector are set when the view is instantiated.

> **NOTE:**  In versions of the Xcode Tools that shipped prior to OS X v10.4, the Interface Builder inspector does not list any pixel format attributes for `NSOpenGLView`.





## Relationships

**Inherits From**: `NSView`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.0 (deprecated 10.14)

## Topics

### Initializing an NSOpenGLView

- `init(frame:pixelFormat:)`

### Managing the NSOpenGLPixelFormat

- `defaultPixelFormat()`
- `pixelFormat`

### Managing the NSOpenGLContext

- `prepareOpenGL()`
- `clearGLContext()`
- `openGLContext`

### Managing the Visible Region

- `reshape()`
- `update()`

### Extended Dynamic Range

- `wantsExtendedDynamicRangeOpenGLSurface`

### Instance Properties

- `wantsBestResolutionOpenGLSurface`
- `wantsExtendedDynamicRangeOpenGLSurface`

## See Also

- `NSOpenGLContext`
- `NSOpenGLLayer`
- `NSOpenGLPixelFormat`
- `NSDrawer`
- `NSForm`
- `NSFormCell`
- `NSMenuItemCell`
