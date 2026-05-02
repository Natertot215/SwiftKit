---
url: https://developer.apple.com/documentation/appkit/nsepsimagerep
framework: AppKit
category: Images and PDF
title: NSEPSImageRep
kind: class
captured: 2026-05-02
---

# NSEPSImageRep

An object that can render an image from encapsulated PostScript (EPS) code.

## Declaration

```swift
class NSEPSImageRep
```







## Relationships

**Inherits From**: `NSImageRep`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.0 (deprecated 14.0)

## Topics

### Creating Representations of Images from EPS Data

- `init(data:)`

### Getting Data

- `boundingBox`
- `epsRepresentation`

### Drawing Images

- `prepareGState()`

## See Also

- `NSPDFImageRep`
- `NSPDFInfo`
