---
url: https://developer.apple.com/documentation/appkit/nspasteboard/pasteboardtype/filecontentstype(forpathextension:)
framework: AppKit
category: Deprecated symbols
title: fileContentsType(forPathExtension:)
kind: method
captured: 2026-05-02
---

# fileContentsType(forPathExtension:)

Returns a pasteboard type based on the passed file type.

## Declaration

```swift
static func fileContentsType(forPathExtension fileType: String) -> NSPasteboard.PasteboardType!
```

### Discussion

Returns an `NSString` to a pasteboard type representing a file’s contents based on the supplied string `fileType`. `fileType` should generally be the extension part of a filename. The conversion from a named file type to a pasteboard type is simple; no mapping to standard pasteboard types is attempted.







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
- `fileNameType(forPathExtension:)`
- `representedPathExtension`
- `representedPathExtensions(from:)`
