---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/backgroundmaterial
framework: SwiftUI
category: Environment values
title: backgroundMaterial
kind: property
captured: 2026-05-02
---

# backgroundMaterial

The material underneath the current view.

## Declaration

```swift
var backgroundMaterial: Material? { get set }
```

### Discussion

This value is `nil` if the current background isn’t one of the standard materials. If you set a material, the standard content styles enable their vibrant rendering modes.

You set this value by calling one of the background modifiers that takes a `ShapeStyle`, like `View/background(_:ignoresSafeAreaEdges:)` or `View/background(_:in:fillStyle:)`, and passing in a `Material`. You can also set the value manually, using `nil` to disable vibrant rendering, or a `Material` instance to enable the vibrancy style associated with the specified material.







## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `Adding a background to your view`
- `ZStack`
- `zIndex(_:)`
- `background(alignment:content:)`
- `background(_:ignoresSafeAreaEdges:)`
- `background(ignoresSafeAreaEdges:)`
- `background(_:in:fillStyle:)`
- `background(in:fillStyle:)`
- `overlay(alignment:content:)`
- `overlay(_:ignoresSafeAreaEdges:)`
- `overlay(_:in:fillStyle:)`
- `containerBackground(_:for:)`
- `containerBackground(for:alignment:content:)`
- `ContainerBackgroundPlacement`
