---
url: https://developer.apple.com/documentation/appkit/nspictimagerep
framework: AppKit
category: Images and PDF
title: NSPICTImageRep
kind: class
captured: 2026-05-02
---

# NSPICTImageRep

An object that renders an image from a PICT format data stream of version 1, version 2, and extended version 2.

## Declaration

```swift
class NSPICTImageRep
```

### Overview

> **WARNING:**  There is no guarantee that the image will render exactly the same as it would under QuickDraw because of the differences between the display medium and QuickDraw. In particular, some transfer modes and region operations may not be supported.





## Relationships

**Inherits From**: `NSImageRep`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Creating Representations of Images from PICT Data

- `init(data:)`

### Getting Data

- `boundingBox`
- `pictRepresentation`

## See Also

- `NSBitmapImageRep`
- `NSCIImageRep`
