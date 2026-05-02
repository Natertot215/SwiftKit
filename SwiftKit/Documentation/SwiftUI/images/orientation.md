---
url: https://developer.apple.com/documentation/swiftui/image/orientation
framework: SwiftUI
category: Images
title: Image.Orientation
kind: enum
captured: 2026-05-02
---

# Image.Orientation

The orientation of an image.

## Declaration

```swift
@frozen enum Orientation
```

### Overview

Many image formats such as JPEG include orientation metadata in the image data. In other cases, you can specify image orientation in code. Properly specifying orientation is often important both for displaying the image and for certain kinds of image processing.

In SwiftUI, you provide an orientation value when initializing an `Image` from an existing `CGImage`.





## Relationships

**Conforms To**: `BitwiseCopyable`, `CaseIterable`, `Copyable`, `Equatable`, `Escapable`, `Hashable`, `RawRepresentable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting image orientations

- `Image.Orientation.up`
- `Image.Orientation.down`
- `Image.Orientation.left`
- `Image.Orientation.right`

### Getting mirrored image orientation

- `Image.Orientation.upMirrored`
- `Image.Orientation.downMirrored`
- `Image.Orientation.leftMirrored`
- `Image.Orientation.rightMirrored`

## See Also

- `Fitting images into available space`
- `imageScale(_:)`
- `imageScale`
- `Image.Scale`
- `Image.ResizingMode`
