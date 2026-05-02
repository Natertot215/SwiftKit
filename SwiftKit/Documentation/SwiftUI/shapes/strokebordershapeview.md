---
url: https://developer.apple.com/documentation/swiftui/strokebordershapeview
framework: SwiftUI
category: Shapes
title: StrokeBorderShapeView
kind: struct
captured: 2026-05-02
---

# StrokeBorderShapeView

A shape provider that strokes the border of its shape.

## Declaration

```swift
@frozen struct StrokeBorderShapeView<Content, Style, Background> where Content : InsettableShape, Style : ShapeStyle, Background : View
```

### Overview

You don’t create this type directly; it’s the return type of `Shape.strokeBorder`.





## Relationships

**Conforms To**: `ShapeView`, `View`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Creating a stroke border shape view

- `init(shape:style:strokeStyle:isAntialiased:background:)`

### Getting shape view properties

- `background`
- `isAntialiased`
- `shape`
- `strokeStyle`
- `style`

## See Also

- `ShapeView`
- `Shape`
- `AnyShape`
- `ShapeRole`
- `StrokeStyle`
- `StrokeShapeView`
- `FillStyle`
- `FillShapeView`
