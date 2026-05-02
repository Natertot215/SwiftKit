---
url: https://developer.apple.com/documentation/swiftui/anyshape
framework: SwiftUI
category: Shapes
title: AnyShape
kind: struct
captured: 2026-05-02
---

# AnyShape

A type-erased shape value.

## Declaration

```swift
@frozen struct AnyShape
```

### Overview

You can use this type to dynamically switch between shape types:

```swift
struct MyClippedView: View {
    var isCircular: Bool

    var body: some View {
        OtherView().clipShape(isCircular ?
            AnyShape(Circle()) : AnyShape(Capsule()))
    }
}
```





## Relationships

**Conforms To**: `Animatable`, `Sendable`, `SendableMetatype`, `Shape`, `View`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Creating a shape

- `init(_:)`

## See Also

- `ShapeView`
- `Shape`
- `ShapeRole`
- `StrokeStyle`
- `StrokeShapeView`
- `StrokeBorderShapeView`
- `FillStyle`
- `FillShapeView`
