---
url: https://developer.apple.com/documentation/swiftui/shapestyle
framework: SwiftUI
category: Drawing and graphics
title: ShapeStyle
kind: protocol
captured: 2026-05-02
---

# ShapeStyle

A color or pattern to use when rendering a shape.

## Declaration

```swift
protocol ShapeStyle : Sendable
```

### Overview

You create custom shape styles by declaring a type that conforms to the `ShapeStyle` protocol and implementing the required `resolve` function to return a shape style that represents the desired appearance based on the current environment.

For example this shape style reads the current color scheme from the environment to choose the blend mode its color will be composited with:

```swift
struct MyShapeStyle: ShapeStyle {
    func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        if environment.colorScheme == .light {
            return Color.red.blendMode(.lighten)
        } else {
            return Color.red.blendMode(.darken)
        }
    }
}
```

In addition to creating a custom shape style, you can also use one of the concrete styles that SwiftUI defines. To indicate a specific color or pattern, you can use `Color` or the style returned by `ShapeStyle/image(_:sourceRect:scale:)`, or one of the gradient types, like the one returned by `ShapeStyle/radialGradient(_:center:startRadius:endRadius:)`. To set a color that’s appropriate for a given context on a given platform, use one of the semantic styles, like `ShapeStyle/background` or `ShapeStyle/primary`.

You can use a shape style by:

- Filling a shape with a style with the `Shape/fill(_:style:)` modifier:

```swift
Path { path in
    path.move(to: .zero)
    path.addLine(to: CGPoint(x: 50, y: 0))
    path.addArc(
        center: .zero,
        radius: 50,
        startAngle: .zero,
        endAngle: .degrees(90),
        clockwise: false)
}
.fill(.radialGradient(
    Gradient(colors: [.yellow, .red]),
    center: .topLeading,
    startRadius: 15,
    endRadius: 80))
```
- Tracing the outline of a shape with a style with either the `Shape/stroke(_:lineWidth:)` or the `Shape/stroke(_:style:)` modifier:

```swift
RoundedRectangle(cornerRadius: 10)
    .stroke(.mint, lineWidth: 10)
    .frame(width: 200, height: 50)
```
- Styling the foreground elements in a view with the `View/foregroundStyle(_:)` modifier:

```swift
VStack(alignment: .leading) {
    Text("Primary")
        .font(.title)
    Text("Secondary")
        .font(.caption)
        .foregroundStyle(.secondary)
}
```





## Relationships

**Inherits From**: `Sendable`, `SendableMetatype`

**Conforming Types**: `AngularGradient`, `AnyGradient`, `AnyShapeStyle`, `BackgroundStyle`, `Color`, `Color.Resolved`, `Color.ResolvedHDR`, `EllipticalGradient`, `FillShapeStyle`, `ForegroundStyle`, `Gradient`, `HierarchicalShapeStyle`, `HierarchicalShapeStyleModifier`, `ImagePaint`, `LinearGradient`, `LinkShapeStyle`, `Material`, `MeshGradient`, `PlaceholderTextShapeStyle`, `RadialGradient`, `SelectionShapeStyle`, `SeparatorShapeStyle`, `Shader`, `TintShapeStyle`, `WindowBackgroundShapeStyle`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### System colors

- `black`
- `blue`
- `brown`
- `clear`
- `cyan`
- `gray`
- `green`
- `indigo`
- `mint`
- `orange`
- `pink`
- `purple`
- `red`
- `teal`
- `white`
- `yellow`

### Angular gradients

- `angularGradient(_:center:startAngle:endAngle:)`
- `angularGradient(colors:center:startAngle:endAngle:)`
- `angularGradient(stops:center:startAngle:endAngle:)`

### Conic gradients

- `conicGradient(_:center:angle:)`
- `conicGradient(colors:center:angle:)`
- `conicGradient(stops:center:angle:)`

### Elliptical gradients

- `ellipticalGradient(_:center:startRadiusFraction:endRadiusFraction:)`
- `ellipticalGradient(colors:center:startRadiusFraction:endRadiusFraction:)`
- `ellipticalGradient(stops:center:startRadiusFraction:endRadiusFraction:)`

### Linear gradients

- `linearGradient(_:startPoint:endPoint:)`
- `linearGradient(colors:startPoint:endPoint:)`
- `linearGradient(stops:startPoint:endPoint:)`

### Radial gradients

- `radialGradient(_:center:startRadius:endRadius:)`
- `radialGradient(colors:center:startRadius:endRadius:)`
- `radialGradient(stops:center:startRadius:endRadius:)`

### Materials

- `ultraThinMaterial`
- `thinMaterial`
- `regularMaterial`
- `thickMaterial`
- `ultraThickMaterial`
- `bar`

### Image paint styles

- `image(_:sourceRect:scale:)`

### Hierarchical styles

- `secondary`
- `tertiary`
- `quaternary`
- `quinary`
- `primary`
- `secondary`
- `tertiary`
- `quaternary`
- `quinary`

### Semantic styles

- `foreground`
- `background`
- `selection`
- `separator`
- `tint`
- `placeholder`
- `link`
- `fill`
- `windowBackground`

### Modifying a shape style

- `blendMode(_:)`
- `opacity(_:)`
- `shadow(_:)`

### Configuring the default shape style

- `blendMode(_:)`
- `opacity(_:)`
- `shadow(_:)`

### Mapping to absolute coordinates

- `in(_:)`

### Resolving a shape style in an environment

- `resolve(in:)`
- `Resolved`

### Using a shape style as a view

- `body`

### Supporting types

- `AngularGradient`
- `EllipticalGradient`
- `LinearGradient`
- `RadialGradient`
- `Material`
- `ImagePaint`
- `HierarchicalShapeStyle`
- `HierarchicalShapeStyleModifier`
- `ForegroundStyle`
- `BackgroundStyle`
- `SelectionShapeStyle`
- `SeparatorShapeStyle`
- `TintShapeStyle`
- `FillShapeStyle`
- `LinkShapeStyle`
- `PlaceholderTextShapeStyle`
- `WindowBackgroundShapeStyle`

### Instance Methods

- `materialActiveAppearance(_:)`

## See Also

- `border(_:width:)`
- `foregroundStyle(_:)`
- `foregroundStyle(_:_:)`
- `foregroundStyle(_:_:_:)`
- `backgroundStyle(_:)`
- `backgroundStyle`
- `AnyShapeStyle`
- `Gradient`
- `MeshGradient`
- `AnyGradient`
- `ShadowStyle`
- `Glass`
