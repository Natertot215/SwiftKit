---
url: https://developer.apple.com/documentation/appkit/nsbezierpath
framework: AppKit
category: Drawing
title: NSBezierPath
kind: class
captured: 2026-05-02
---

# NSBezierPath

An object that can create paths using PostScript-style commands.

## Declaration

```swift
class NSBezierPath
```

### Overview

Paths consist of straight and curved line segments joined together. Paths can form recognizable shapes such as rectangles, ovals, arcs, and glyphs; they can also form complex polygons using either straight or curved line segments. A single path can be closed by connecting its two endpoints, or it can be left open.

An `NSBezierPath` object can contain multiple disconnected paths, whether they are closed or open. Each of these paths is referred to as a subpath. The subpaths of a Bézier path object must be manipulated as a group. The only way to manipulate subpaths individually is to create separate `NSBezierPath` objects for each.

For a given `NSBezierPath` object, you can stroke the path’s outline or fill the region occupied by the path. You can also use the path as a clipping region for views or other regions. Using methods of `NSBezierPath`, you can also perform hit detection on the filled or stroked path. Hit detection is needed to implement interactive graphics, as in rubber banding and dragging operations.

The current graphics context is automatically saved and restored for all drawing operations involving Bézier path objects, so your application does not need to worry about the graphics settings changing across invocations.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSSecureCoding`

## Availability

- macOS ?

## Topics

### Creating a Bézier Path

- `init(ovalIn:)`
- `init(rect:)`
- `init(roundedRect:xRadius:yRadius:)`
- `init(cgPath:)`
- `flattened`
- `reversed`

### Constructing a Path

- `move(to:)`
- `line(to:)`
- `curve(to:controlPoint1:controlPoint2:)`
- `curve(to:controlPoint:)`
- `close()`
- `relativeMove(to:)`
- `relativeLine(to:)`
- `relativeCurve(to:controlPoint1:controlPoint2:)`
- `relativeCurve(to:controlPoint:)`

### Appending Common Shapes to a Path

- `append(_:)`
- `appendPoints(_:count:)`
- `appendOval(in:)`
- `appendArc(from:to:radius:)`
- `appendArc(withCenter:radius:startAngle:endAngle:)`
- `appendArc(withCenter:radius:startAngle:endAngle:clockwise:)`
- `appendRect(_:)`
- `appendRoundedRect(_:xRadius:yRadius:)`
- `append(withCGGlyph:in:)`
- `append(withCGGlyphs:count:in:)`
- `appendGlyph(_:in:)`
- `appendGlyphs(_:count:in:)`
- `appendPackedGlyphs(_:)`

### Accessing a Path’s Attributes

- `windingRule`
- `lineCapStyle`
- `lineJoinStyle`
- `lineWidth`
- `miterLimit`
- `flatness`
- `getLineDash(_:count:phase:)`
- `setLineDash(_:count:phase:)`

### Configuring Default Path Attributes

- `defaultWindingRule`
- `defaultLineCapStyle`
- `defaultLineJoinStyle`
- `defaultLineWidth`
- `defaultMiterLimit`
- `defaultFlatness`

### Drawing a Path

- `stroke()`
- `fill()`
- `fill(_:)`
- `stroke(_:)`
- `strokeLine(from:to:)`
- `drawPackedGlyphs(_:at:)`

### Specifying a Clipping Path

- `addClip()`
- `setClip()`
- `clip(_:)`

### Performing Hit-Testing

- `contains(_:)`

### Querying a Path

- `bounds`
- `controlPointBounds`
- `currentPoint`
- `isEmpty`

### Applying Transformations

- `transform(using:)`

### Accessing Elements of a Path

- `cgPath`
- `elementCount`
- `element(at:)`
- `element(at:associatedPoints:)`
- `removeAllPoints()`
- `setAssociatedPoints(_:at:)`

### Constants

- `NSBezierPath.ElementType`
- `NSBezierPath.LineJoinStyle`
- `NSBezierPath.LineCapStyle`
- `NSBezierPath.WindingRule`

### Initializers

- `init(CGPath:)`
- `init(coder:)`
- `init(ovalInRect:)`

## See Also

- `Convenience Functions`
