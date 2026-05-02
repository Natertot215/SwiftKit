---
url: https://developer.apple.com/documentation/appkit/nsgraphicscontext
framework: AppKit
category: Drawing
title: NSGraphicsContext
kind: class
captured: 2026-05-02
---

# NSGraphicsContext

An object that represents a graphics context.

## Declaration

```swift
class NSGraphicsContext
```

### Overview

You can think of a graphics context as a destination to which drawing and graphics state operations are sent for execution. Each graphics context contains its own graphics environment and state.

The `NSGraphicsContext` class is an abstract superclass for destination-specific graphics contexts. You obtain instances of concrete subclasses with the class methods `NSGraphicsContext/current`, `NSGraphicsContext/init(attributes:)`, `NSGraphicsContext/init(bitmapImageRep:)`, `NSGraphicsContext/init(cgContext:flipped:)-9cbad`, and `NSGraphicsContext/init(window:)`.

At any time there is the notion of the current context. The current context for the current thread may be set using `NSGraphicsContext/current`.

Graphics contexts are maintained on a stack. You push a graphics context onto the stack by sending it a `NSGraphicsContext/saveGraphicsState()-swift.method` message, and pop it off the stack by sending it a `NSGraphicsContext/restoreGraphicsState()-swift.method` message. By sending `NSGraphicsContext/restoreGraphicsState()-swift.method` to a graphics context object you remove it from the stack, and the next graphics context on the stack becomes the current graphics context.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Creating a Graphics Context

- `init(attributes:)`
- `init(bitmapImageRep:)`
- `init(cgContext:flipped:)`
- `init(window:)`
- `init(graphicsPort:flipped:)`

### Managing the Current Context

- `current`
- `cgContext`
- `graphicsPort`

### Managing the Graphics State

- `restoreGraphicsState()`
- `restoreGraphicsState()`
- `saveGraphicsState()`
- `saveGraphicsState()`
- `setGraphicsState(_:)`

### Testing the Drawing Destination

- `currentContextDrawingToScreen()`
- `isDrawingToScreen`

### Getting Information About the Context

- `attributes`
- `NSGraphicsContext.AttributeKey`
- `NSGraphicsContext.RepresentationFormatName`
- `isFlipped`

### Flushing Graphics to the Context

- `flushGraphics()`

### Configuring Rendering Options

- `compositingOperation`
- `NSCompositingOperation`
- `imageInterpolation`
- `NSImageInterpolation`
- `shouldAntialias`
- `patternPhase`

### Getting the Context for Rendering Core Image Objects

- `ciContext`

### Managing Color Rendering

- `colorRenderingIntent`
- `NSColorRenderingIntent`

### Initializers

- `init(CGContext:flipped:)`
