---
url: https://developer.apple.com/documentation/appkit/nspdfinfo
framework: AppKit
category: Images and PDF
title: NSPDFInfo
kind: class
captured: 2026-05-02
---

# NSPDFInfo

An object that stores information associated with the creation of a PDF file, such as its URL, tag names, page orientation, and paper size.

## Declaration

```swift
class NSPDFInfo
```

### Overview

Typically, a PDF panel—that is, a panel created by an `NSPDFPanel` object—displays the information supplied by an `NSPDFInfo` object when the user wants to export content as a PDF file. A PDF panel can also update a PDF info object with information it receives from the user.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`

## Availability

- macOS 10.9

## Topics

### Specifying PDF Information

- `url`
- `isFileExtensionHidden`
- `tagNames`
- `orientation`
- `paperSize`
- `attributes`

### Initializers

- `init(coder:)`

## See Also

- `NSPDFImageRep`
- `NSEPSImageRep`
