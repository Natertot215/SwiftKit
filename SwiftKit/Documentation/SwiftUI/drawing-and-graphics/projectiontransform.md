---
url: https://developer.apple.com/documentation/swiftui/projectiontransform
framework: SwiftUI
category: Drawing and graphics
title: ProjectionTransform
kind: struct
captured: 2026-05-02
---

# ProjectionTransform


## Declaration

```swift
@frozen struct ProjectionTransform
```







## Relationships

**Conforms To**: `BitwiseCopyable`, `Copyable`, `Equatable`, `Escapable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a transform

- `init()`
- `init(_:)`

### Getting transform characteristics

- `isAffine`
- `isIdentity`

### Manipulating transforms

- `invert()`
- `inverted()`
- `concatenating(_:)`

### Accessing the transform’s coefficients

- `m11`
- `m12`
- `m13`
- `m21`
- `m22`
- `m23`
- `m31`
- `m32`
- `m33`

## See Also

- `scaledToFill()`
- `scaledToFit()`
- `scaleEffect(_:anchor:)`
- `scaleEffect(_:anchor:)`
- `scaleEffect(x:y:anchor:)`
- `scaleEffect(x:y:z:anchor:)`
- `aspectRatio(_:contentMode:)`
- `rotationEffect(_:anchor:)`
- `rotation3DEffect(_:axis:anchor:anchorZ:perspective:)`
- `perspectiveRotationEffect(_:axis:anchor:anchorZ:perspective:)`
- `rotation3DEffect(_:anchor:)`
- `rotation3DEffect(_:axis:anchor:)`
- `transformEffect(_:)`
- `transform3DEffect(_:)`
- `projectionEffect(_:)`
