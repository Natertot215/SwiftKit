---
url: https://developer.apple.com/documentation/swiftui/image/scale
framework: SwiftUI
category: Images
title: Image.Scale
kind: enum
captured: 2026-05-02
---

# Image.Scale

A scale to apply to vector images relative to text.

## Declaration

```swift
enum Scale
```

### Overview

Use this type with the `View/imageScale(_:)` modifier, or the `EnvironmentValues/imageScale` environment key, to set the image scale.

The following example shows the three `Scale` values as applied to a system symbol image, each set against a text view:

```swift
HStack { Image(systemName: "swift").imageScale(.small); Text("Small") }
HStack { Image(systemName: "swift").imageScale(.medium); Text("Medium") }
HStack { Image(systemName: "swift").imageScale(.large); Text("Large") }
```





## Relationships

**Conforms To**: `Equatable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 11.0
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting image scales

- `Image.Scale.small`
- `Image.Scale.medium`
- `Image.Scale.large`

## See Also

- `Fitting images into available space`
- `imageScale(_:)`
- `imageScale`
- `Image.Orientation`
- `Image.ResizingMode`
