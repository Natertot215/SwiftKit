---
url: https://developer.apple.com/documentation/swiftui/fillshapeview
framework: SwiftUI
category: Shapes
title: FillShapeView
kind: struct
captured: 2026-05-02
---

# FillShapeView

A shape provider that fills its shape.

## Declaration

```swift
@frozen struct FillShapeView<Content, Style, Background> where Content : Shape, Style : ShapeStyle, Background : View
```

### Overview

You do not create this type directly, it is the return type of `Shape.fill`.





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

### Creating a stroke shape view

- `init(shape:style:fillStyle:background:)`

### Getting shape view properties

- `background`
- `fillStyle`
- `shape`
- `style`

## See Also

- `ShapeView`
- `Shape`
- `AnyShape`
- `ShapeRole`
- `StrokeStyle`
- `StrokeShapeView`
- `StrokeBorderShapeView`
- `FillStyle`
