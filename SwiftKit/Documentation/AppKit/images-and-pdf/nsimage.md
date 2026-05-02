---
url: https://developer.apple.com/documentation/appkit/nsimage
framework: AppKit
category: Images and PDF
title: NSImage
kind: class
captured: 2026-05-02
---

# NSImage

A high-level interface for manipulating image data.

## Declaration

```swift
class NSImage
```

### Overview

You use instances of `NSImage` to load existing images, create new images, and draw the resulting image data into your views. Although you use this class predominantly for image-related operations, the class itself knows little about the underlying image data. Instead, it works in conjunction with one or more image representation objects (subclasses of `NSImageRep`) to manage and render the image data. For the most part, these interactions are transparent.

The  class serves many purposes, providing support for the following tasks:

- Loading images stored on disk or at a specified URL.
- Drawing images into a view or graphics context.
- Providing the contents of a `CALayer` object.
- Creating new images based on a series of captured drawing commands.
- Producing versions of the image in a different format.

The `NSImage` class itself is capable of managing image data in a variety of formats. The specific list of formats is dependent on the version of the operating system but includes many standard formats such as TIFF, JPEG, GIF, PNG, and PDF among others. AppKit manages each format using a specific type of image representation object, whose job is to manage the actual image data. You can get a list of supported formats using the methods described in Determining Supported Types of Images.

#### Using Images with Core Animation Layers

Although you can assign an `NSImage` object directly to the `CALayer/contents` property of a `CALayer` object, doing so may not always yield the best results. Instead of using your image object, you can use the `NSImage/layerContents(forContentsScale:)` method to obtain an object that you can use for your layer’s contents. The image created by that method serves as the contents of a layer, which also supports all of the layer’s gravity modes. By contrast, the `NSImage` class supports only the `CALayerContentsGravity/resize`, `CALayerContentsGravity/resizeAspect`, and `CALayerContentsGravity/resizeAspectFill` modes.

Before calling the `NSImage/layerContents(forContentsScale:)` method, use the `NSImage/recommendedLayerContentsScale(_:)` method to get the recommended scale factor for the resulting image. The code listing below shows a typical example that uses the scale factor of a window’s backing store as the desired scale factor. From that scale factor, the code gets the scale factor for the specified image object and creates an object that you assign to the layer. You might use this code for images that fit the layer bounds precisely or for which you rely on the `CALayer/contentsGravity` property of the layer to position or scale the image.

Listing 1. Assigning an image to a layer

```objc
static void updateLayerWithImageInWindow1(NSImage *image, CALayer *layer, NSWindow *window) {
   CGFloat desiredScaleFactor = [window backingScaleFactor];
   CGFloat actualScaleFactor = [image recommendedLayerContentsScale:desiredScaleFactor];
 
   id layerContents = [image layerContentsForContentsScale:actualScaleFactor];
 
   [layer setContents:layerContents];
   [layer setContentsScale:actualScaleFactor];
}
```





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `Copyable`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `NSCoding`, `NSCopying`, `NSItemProviderReading`, `NSItemProviderWriting`, `NSObjectProtocol`, `NSPasteboardReading`, `NSPasteboardWriting`, `NSSecureCoding`, `Sendable`, `SendableMetatype`, `Testing.AttachableAsImage`, `Transferable`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.1
- macOS ?

## Topics

### Creating Images by Name

- `Configuring and displaying symbol images in your UI`
- `init(named:)`
- `init(systemSymbolName:accessibilityDescription:)`
- `init(systemSymbolName:variableValue:accessibilityDescription:)`
- `init(symbolName:variableValue:)`
- `init(symbolName:bundle:variableValue:)`
- `init(resource:)`
- `setName(_:)`
- `name()`
- `NSImage.Name`
- `init(imageLiteralResourceName:)`

### Creating Dynamically Drawn Images

- `init(size:flipped:drawingHandler:)`

### Creating Images from Resource Files

- `init(byReferencingFile:)`
- `init(byReferencing:)`
- `init(contentsOfFile:)`
- `init(contentsOf:)`

### Creating Images from Existing Data

- `init(data:)`
- `init(dataIgnoringOrientation:)`
- `init(cgImage:size:)`
- `init(pasteboard:)`
- `init(coder:)`

### Creating Empty Images

- `init(size:)`

### Creating Symbol Images

- `withSymbolConfiguration(_:)`
- `NSImage.SymbolConfiguration`

### Getting the Symbol Image Configuration

- `symbolConfiguration`

### Managing Loading and Drawing of Images

- `delegate`
- `NSImageDelegate`

### Setting Attributes of Images

- `size`
- `isTemplate`
- `isTemplate`

### Determining Supported Types of Images

- `canInit(with:)`
- `imageTypes`
- `imageUnfilteredTypes`

### Working with Representations of Images

- `addRepresentation(_:)`
- `addRepresentations(_:)`
- `representations`
- `removeRepresentation(_:)`
- `bestRepresentation(for:context:hints:)`
- `NSImageRep.HintKey`
- `NSImage.LayoutDirection`

### Setting the Representation Selection Criteria for Images

- `prefersColorMatch`
- `usesEPSOnResolutionMismatch`
- `matchesOnMultipleResolution`

### Drawing Images

- `draw(in:)`
- `draw(at:from:operation:fraction:)`
- `draw(in:from:operation:fraction:)`
- `draw(in:from:operation:fraction:respectFlipped:hints:)`
- `drawRepresentation(_:in:)`
- `NSCompositingOperation`

### Managing Drawing Options

- `isValid`
- `backgroundColor`
- `capInsets`
- `resizingMode`
- `NSImage.ResizingMode`

### Working with Alignment Metadata

- `alignmentRect`

### Managing Caching Options

- `cacheMode`
- `recache()`
- `NSImage.CacheMode`

### Producing TIFF Data for Images

- `tiffRepresentation`
- `tiffRepresentation(using:factor:)`

### Producing Core Graphics Images

- `cgImage(forProposedRect:context:hints:)`

### Hit-Testing Images

- `hitTest(_:withDestinationRect:context:hints:flipped:)`

### Managing Image Accessibility

- `accessibilityDescription`

### Using Images with Core Animation

- `layerContents(forContentsScale:)`
- `recommendedLayerContentsScale(_:)`

### Managing Axis Matching

- `matchesOnlyOnBestFittingAxis`

### Localizing Images

- `withLocale(_:)`
- `locale`

### Deprecated

- `Deprecated Symbols`

### Enumerations

- `NSImage.DynamicRange`

### Initializers

- `init(CGImage:size:)`
- `init(byReferencingURL:)`
- `init(contentsOfURL:)`

### Default Implementations

- `NSPasteboardReading Implementations`

## See Also

- `Providing images for different appearances`
- `Supporting Continuity Camera in Your Mac App`
- `Supporting HDR images in your app`
- `Applying Apple HDR effect to your photos`
- `NSImageDelegate`
- `NSImageRep`
