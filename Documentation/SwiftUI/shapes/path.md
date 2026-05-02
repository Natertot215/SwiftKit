---
url: https://developer.apple.com/documentation/swiftui/path
framework: SwiftUI
category: Shapes
title: Path
kind: struct
captured: 2026-05-02
---

# Path

The outline of a 2D shape.

## Declaration
```swift
@frozen struct Path
```

## Availability
- iOS 13.0+
- iPadOS 13.0+
- Mac Catalyst 13.0+
- macOS 10.15+
- tvOS 13.0+
- visionOS 1.0+
- watchOS 6.0+

## Creating a Path
- `init()` — Creates an empty path
- `init(_:)` — Creates an empty path and executes a closure to add initial elements
- `init(ellipseIn:)` — Creates a path as an ellipse within a rectangle
- `init(roundedRect:cornerRadius:style:)` — Creates a rounded rectangle with uniform corners
- `init(roundedRect:cornerSize:style:)` — Creates a rounded rectangle with corner size
- `init(roundedRect:cornerRadii:style:)` — Creates a rounded rectangle with uneven corner radii

## Path Characteristics
- **`boundingRect`** — A rectangle containing all path segments
- **`cgPath`** — An immutable CGPath representation
- **`contains(_:eoFill:)`** — Returns true if the path contains a point
- **`currentPoint`** — The last point in the path
- **`isEmpty`** — Boolean indicating if path contains zero elements

## Drawing Commands
- `move(to:)` — Begins a new subpath at a point
- `addLine(to:)` — Adds a straight line segment
- `addLines(_:)` — Adds connected straight-line segments
- `addCurve(to:control1:control2:)` — Adds a cubic Bézier curve
- `addQuadCurve(to:control:)` — Adds a quadratic Bézier curve
- `addArc(center:radius:startAngle:endAngle:clockwise:transform:)` — Adds an arc
- `addEllipse(in:transform:)` — Adds an ellipse
- `addRect(_:transform:)` — Adds a rectangle
- `addRoundedRect(in:cornerSize:style:transform:)` — Adds a rounded rectangle
- `addPath(_:transform:)` — Appends another path
- `closeSubpath()` — Closes and completes the current subpath

## Transforming
- `applying(_:)` — Applies a CGAffineTransform
- `offsetBy(dx:dy:)` — Translates all points
- `trimmedPath(from:to:)` — Returns a partial copy

## Boolean Operations
- `intersection(_:eoFill:)` — Filled regions common to both paths
- `union(_:eoFill:)` — Filled regions in either path
- `subtracting(_:eoFill:)` — Regions from this path not in the given path
- `symmetricDifference(_:eoFill:)` — Regions in one path but not both

## Conformance
- `Animatable`
- `Copyable`
- `CustomStringConvertible`
- `Equatable`
- `Escapable`
- `LosslessStringConvertible`
- `Sendable`
- `Shape`
- `View`

## See Also
- `Shape`
- `Canvas`
- `GraphicsContext`
