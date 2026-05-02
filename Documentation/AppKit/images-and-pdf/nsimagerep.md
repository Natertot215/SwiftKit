---
url: https://developer.apple.com/documentation/appkit/nsimagerep
framework: AppKit
category: Images and PDF
title: NSImageRep
kind: class
captured: 2026-05-02
---

# NSImageRep

A semiabstract superclass that provides subclasses that you use to draw an image from a particular type of source data.

## Declaration

```swift
class NSImageRep
```

### Overview

The `NSImageRep` class is called “semiabstract” because it has some instance variables and implementation of its own, in addition to defining subclasses. Although an `NSImageRep` subclass can be used directly, it is typically accessed through an `NSImage` object, which manages a group of image representations, choosing the best one for the current output device.





## Relationships

**Inherits From**: `NSObject`

**Inherited By**: `NSBitmapImageRep`, `NSCIImageRep`, `NSCustomImageRep`, `NSEPSImageRep`, `NSPDFImageRep`, `NSPICTImageRep`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Creating Representations of Images

- `imageReps(withContentsOfFile:)`
- `imageReps(with:)`
- `imageReps(withContentsOf:)`
- `init(contentsOfFile:)`
- `init(pasteboard:)`
- `init(contentsOf:)`
- `init()`
- `init(coder:)`

### Determining Types for Images

- `canInit(with:)`
- `canInit(with:)`
- `imageTypes`
- `imageUnfilteredTypes`
- `imageFileTypes()`
- `imagePasteboardTypes()`
- `imageUnfilteredFileTypes()`
- `imageUnfilteredPasteboardTypes()`

### Accessing Size of Images

- `size`

### Specifying Information About the Representation

- `bitsPerSample`
- `colorSpaceName`
- `hasAlpha`
- `isOpaque`
- `pixelsHigh`
- `pixelsWide`
- `layoutDirection`
- `Device-Specific Value`

### Getting Core Graphics Images

- `cgImage(forProposedRect:context:hints:)`

### Drawing Images

- `draw()`
- `draw(at:)`
- `draw(in:)`
- `draw(in:from:operation:fraction:respectFlipped:hints:)`
- `NSImageRep.HintKey`

### Managing Representation Subclasses of Images

- `class(forType:)`
- `class(for:)`
- `registeredClasses`
- `registerClass(_:)`
- `unregisterClass(_:)`
- `class(forFileType:)`
- `class(forPasteboardType:)`

### Notifications

- `registryDidChangeNotification`

### Initializers

- `init(contentsOfURL:)`

## See Also

- `Providing images for different appearances`
- `Supporting Continuity Camera in Your Mac App`
- `Supporting HDR images in your app`
- `Applying Apple HDR effect to your photos`
- `NSImage`
- `NSImageDelegate`
