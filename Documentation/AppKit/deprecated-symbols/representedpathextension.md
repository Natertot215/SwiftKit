---
url: https://developer.apple.com/documentation/appkit/nspasteboard/pasteboardtype/representedpathextension
framework: AppKit
category: Deprecated symbols
title: representedPathExtension
kind: property
captured: 2026-05-02
---

# representedPathExtension

A file type based on the passed pasteboard type.

## Declaration

```swift
var representedPathExtension: String? { get }
```

### Discussion

This function is the inverse of both `NSPasteboard/PasteboardType/fileContentsType(forPathExtension:)` and `NSPasteboard/PasteboardType/fileNameType(forPathExtension:)`. When passed a pasteboard type as returned by those functions, it returns the extension or filename from which the type was derived. It returns `nil` if `pboardType` isn’t a pasteboard type created by those functions.







## Availability

- macOS ?



## See Also

- `NSConvertGlyphsToPackedGlyphs(_:_:_:_:)`
- `raiseBadArgumentException(_:_:_:)`
- `NSReleaseAlertPanel(_:)`
- `NSDisableScreenUpdates()`
- `NSEnableScreenUpdates()`
- `NSDrawColorTiledRects(_:_:_:_:_:)`
- `NSSetShowsServicesMenuItem(_:_:)`
- `NSCopyBits(_:_:_:)`
- `NSShowsServicesMenuItem(_:)`
- `NSDottedFrameRect(_:)`
- `NSReadPixel(_:)`
- `NSGetWindowServerMemory(_:_:_:_:)`
- `fileContentsType(forPathExtension:)`
- `fileNameType(forPathExtension:)`
- `representedPathExtensions(from:)`
