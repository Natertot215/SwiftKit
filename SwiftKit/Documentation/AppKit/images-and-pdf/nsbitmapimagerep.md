---
url: https://developer.apple.com/documentation/appkit/nsbitmapimagerep
framework: AppKit
category: Images and PDF
title: NSBitmapImageRep
kind: class
captured: 2026-05-02
---

# NSBitmapImageRep

An object that renders an image from bitmap data.

## Declaration

```swift
class NSBitmapImageRep
```

### Overview

Supported bitmap data formats include GIF, JPEG, TIFF, PNG, and various permutations of raw bitmap data.

#### Alpha Premultiplication and Bitmap Formats

When creating a bitmap using a premultiplied format, if a coverage (alpha) plane exists, the bitmap’s color components are premultiplied with it. In this case, if you modify the contents of the bitmap, you are therefore responsible for premultiplying the data. Note that premultiplying generally has negligible effect on output quality. For floating-point image data, premultiplying color components is a lossless operation, but for fixed-point image data, premultiplication can introduce small rounding errors. In either case, more rounding errors may appear when compositing many premultiplied images; however, such errors are generally not readily visible.

For this reason, you should not use an `NSBitmapImageRep` object if you want to manipulate image data. To work with data that is not premultiplied, use the Core Graphics framework instead. (Specifically, create images using the `CGImage/init(width:height:bitsPerComponent:bitsPerPixel:bytesPerRow:space:bitmapInfo:provider:decode:shouldInterpolate:intent:)` function and `CGImageAlphaInfo/last` parameter.) Alternatively, include the `NSAlphaNonpremultipliedBitmapFormat` flag when creating the bitmap.

> **NOTE:**  Use the `bitmapFormat` parameter to the `NSBitmapImageRep/init(bitmapDataPlanes:pixelsWide:pixelsHigh:bitsPerSample:samplesPerPixel:hasAlpha:isPlanar:colorSpaceName:bitmapFormat:bytesPerRow:bitsPerPixel:)` method to specify the format for creating a bitmap. When creating or retrieving a bitmap with other methods, the bitmap format depends on the original source of the image data. Check the `NSBitmapImageRep/bitmapFormat` property before working with image data.





## Relationships

**Inherits From**: `NSImageRep`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSSecureCoding`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Creating Bitmap Representations of Images

- `imageReps(with:)`
- `colorize(byMappingGray:to:blackMapping:whiteMapping:)`
- `init(bitmapDataPlanes:pixelsWide:pixelsHigh:bitsPerSample:samplesPerPixel:hasAlpha:isPlanar:colorSpaceName:bitmapFormat:bytesPerRow:bitsPerPixel:)`
- `init(bitmapDataPlanes:pixelsWide:pixelsHigh:bitsPerSample:samplesPerPixel:hasAlpha:isPlanar:colorSpaceName:bytesPerRow:bitsPerPixel:)`
- `init(cgImage:)`
- `init(ciImage:)`
- `init(data:)`
- `init(forIncrementalLoad:)`
- `init(focusedViewRect:)`

### Getting Information About Images

- `bitmapFormat`
- `NSBitmapImageRep.Format`
- `bitsPerPixel`
- `bytesPerPlane`
- `bytesPerRow`
- `isPlanar`
- `numberOfPlanes`
- `samplesPerPixel`

### Getting the Bitmap Data

- `bitmapData`
- `getBitmapDataPlanes(_:)`

### Producing Other Representations of Images

- `tiffRepresentationOfImageReps(in:)`
- `tiffRepresentationOfImageReps(in:using:factor:)`
- `tiffRepresentation`
- `tiffRepresentation(using:factor:)`
- `representationOfImageReps(in:using:properties:)`
- `representation(using:properties:)`
- `NSDrawBitmap(_:_:_:_:_:_:_:_:_:_:_:)`

### Managing Compression Types

- `getTIFFCompressionTypes(_:count:)`
- `localizedName(forTIFFCompressionType:)`
- `canBeCompressed(using:)`
- `setCompression(_:factor:)`
- `getCompression(_:factor:)`
- `setProperty(_:withValue:)`
- `value(forProperty:)`
- `NSBitmapImageRep.TIFFCompression`
- `NSBitmapImageRep.PropertyKey`

### Loading Images Incrementally

- `incrementalLoad(from:complete:)`
- `NSBitmapImageRep.LoadStatus`

### Managing Pixel Values

- `setColor(_:atX:y:)`
- `colorAt(x:y:)`
- `setPixel(_:atX:y:)`
- `getPixel(_:atX:y:)`

### Getting Core Graphics Images

- `cgImage`

### Managing Color Spaces

- `converting(to:renderingIntent:)`
- `retagging(with:)`
- `colorSpace`

### Constants

- `NSBitmapImageRep.FileType`

### Initializers

- `init(CGImage:)`
- `init(CIImage:)`

## See Also

- `NSCIImageRep`
- `NSPICTImageRep`
