---
url: https://developer.apple.com/documentation/appkit/nsgradient
framework: AppKit
category: Drawing
title: NSGradient
kind: class
captured: 2026-05-02
---

# NSGradient

An object that can draw gradient fill colors

## Declaration

```swift
class NSGradient
```

### Overview

This class provides convenience methods for drawing radial or linear (axial) gradients for rectangles and `NSBezierPath` objects. It also supports primitive methods that let you customize the shape of the gradient fill. A gradient consists of two or more color changes over the range of the gradient shape. When creating a gradient object, you specify the colors and their locations relative to the start and end of the gradient. This combination of color and location is known as a *color stop*color stop. During drawing, the `NSGradient` object uses the color stop information to compute color changes for you and passes that information to the Quartz shading functions.

Because the `NSGradient` class uses Quartz shadings, drawing is handled by computing the colors at a given point mathematically. This technique results in smooth gradients regardless of the resolution of the target device.

For more information about gradients and their appearance, see `https://developer.apple.com/library/archive/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/dq_shadings/dq_shadings.html#//apple_ref/doc/uid/TP30001066-CH207` in `https://developer.apple.com/library/archive/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/Introduction/Introduction.html#//apple_ref/doc/uid/TP30001066`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSSecureCoding`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.5

## Topics

### Creating a Gradient

- `init(starting:ending:)`
- `init(colors:)`
- `init(colorsAndLocations:)`
- `init(colors:atLocations:colorSpace:)`
- `init(coder:)`

### Drawing a Linear Gradient

- `draw(from:to:options:)`
- `draw(in:angle:)`
- `draw(in:angle:)`

### Drawing a Radial Gradient

- `draw(fromCenter:radius:toCenter:radius:options:)`
- `draw(in:relativeCenterPosition:)`
- `draw(in:relativeCenterPosition:)`

### Getting Gradient Properties

- `colorSpace`
- `numberOfColorStops`
- `getColor(_:location:at:)`
- `interpolatedColor(atLocation:)`

### Constants

- `NSGradient.DrawingOptions`

### Initializers

- `init(startingColor:endingColor:)`
