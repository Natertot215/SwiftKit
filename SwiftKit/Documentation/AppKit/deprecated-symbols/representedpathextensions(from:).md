---
url: https://developer.apple.com/documentation/appkit/nspasteboard/pasteboardtype/representedpathextensions(from:)
framework: AppKit
category: Deprecated symbols
title: representedPathExtensions(from:)
kind: method
captured: 2026-05-02
---

# representedPathExtensions(from:)

Returns an array of file types based on the passed pasteboard types.

## Declaration

```swift
static func representedPathExtensions(from pboardTypes: [NSPasteboard.PasteboardType]) -> [String]?
```

### Discussion

Accepts a null-terminated array of pointers to pasteboard types and returns a null-terminated array of the unique extensions and filenames from the file content and filename types found in the input array. It returns `nil` if the input array contains no file content or filename types. The returned array is allocated and must be freed by the caller. The pointers in the return array point into strings passed in the input array.







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
- `representedPathExtension`
