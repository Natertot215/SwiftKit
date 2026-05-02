---
url: https://developer.apple.com/documentation/swiftui/colormatrix
framework: SwiftUI
category: Drawing and graphics
title: ColorMatrix
kind: struct
captured: 2026-05-02
---

# ColorMatrix

A matrix to use in an RGBA color transformation.

## Declaration

```swift
@frozen struct ColorMatrix
```

### Overview

The matrix has five columns, each with a red, green, blue, and alpha component. You can use the matrix for tasks like creating a color transformation `GraphicsContext/Filter` for a `GraphicsContext` using the `GraphicsContext/Filter/colorMatrix(_:)` method.





## Relationships

**Conforms To**: `BitwiseCopyable`, `Copyable`, `Equatable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0

## Topics

### Creating an identity matrix

- `init()`

### First column

- `r1`
- `g1`
- `b1`
- `a1`

### Second column

- `r2`
- `g2`
- `b2`
- `a2`

### Third column

- `r3`
- `g3`
- `b3`
- `a3`

### Fourth column

- `r4`
- `g4`
- `b4`
- `a4`

### Fifth column

- `r5`
- `g5`
- `b5`
- `a5`

## See Also

- `blur(radius:opaque:)`
- `shadow(color:radius:x:y:)`
