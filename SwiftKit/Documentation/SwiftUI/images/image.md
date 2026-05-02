---
url: https://developer.apple.com/documentation/swiftui/image
framework: SwiftUI
category: Images
title: Image
kind: struct
captured: 2026-05-02
---

# Image

A view that displays an image.

## Declaration

```swift
@frozen struct Image
```

### Overview

Use an `Image` instance when you want to add images to your SwiftUI app. You can create images from many sources:

- Image files in your app’s asset library or bundle. Supported types include PNG, JPEG, HEIC, and more.
- Instances of platform-specific image types, like `UIImage` and `NSImage`.
- A bitmap stored in a Core Graphics `CGImage` instance.
- System graphics from the SF Symbols set.

The following example shows how to load an image from the app’s asset library or bundle and scale it to fit within its container:

```swift
Image("Landscape_4")
    .resizable()
    .aspectRatio(contentMode: .fit)
Text("Water wheel")
```

You can use methods on the `Image` type as well as standard view modifiers to adjust the size of the image to fit your app’s interface. Here, the `Image` type’s `Image/resizable(capInsets:resizingMode:)` method scales the image to fit the current view. Then, the `View/aspectRatio(_:contentMode:)` view modifier adjusts this resizing behavior to maintain the image’s original aspect ratio, rather than scaling the x- and y-axes independently to fill all four sides of the view. The article `Fitting-Images-into-Available-Space` shows how to apply scaling, clipping, and tiling to `Image` instances of different sizes.

An `Image` is a late-binding token; the system resolves its actual value only when it’s about to use the image in an environment.

#### Making images accessible

To use an image as a control, use one of the initializers that takes a `label` parameter. This allows the system’s accessibility frameworks to use the label as the name of the control for users who use features like VoiceOver. For images that are only present for aesthetic reasons, use an initializer with the `decorative` parameter; the accessibility systems ignore these images.





## Relationships

**Conforms To**: `Copyable`, `Equatable`, `Escapable`, `JournalingSuggestionAsset`, `Sendable`, `SendableMetatype`, `Transferable`, `View`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating an image

- `init(_:bundle:)`
- `init(_:variableValue:bundle:)`
- `init(_:)`

### Creating an image for use as a control

- `init(_:bundle:label:)`
- `init(_:variableValue:bundle:label:)`
- `init(_:scale:orientation:label:)`

### Creating an image for decorative use

- `init(decorative:bundle:)`
- `init(decorative:variableValue:bundle:)`
- `init(decorative:scale:orientation:)`

### Creating a system symbol image

- `init(systemName:)`
- `init(systemName:variableValue:)`

### Creating an image from another image

- `init(uiImage:)`
- `init(nsImage:)`

### Creating an image from drawing instructions

- `init(size:label:opaque:colorMode:renderer:)`

### Resizing images

- `resizable(capInsets:resizingMode:)`

### Specifying rendering behavior

- `antialiased(_:)`
- `symbolRenderingMode(_:)`
- `renderingMode(_:)`
- `interpolation(_:)`
- `Image.TemplateRenderingMode`
- `Image.Interpolation`

### Specifying dynamic range

- `allowedDynamicRange(_:)`
- `allowedDynamicRange`
- `Image.DynamicRange`

### Instance Methods

- `symbolColorRenderingMode(_:)`
- `symbolVariableValueMode(_:)`
- `widgetAccentedRenderingMode(_:)`

### Enumerations

- `Image.Orientation`
- `Image.ResizingMode`
- `Image.Scale`
