---
url: https://developer.apple.com/documentation/appkit/nsenablescreenupdates()
framework: AppKit
category: Deprecated symbols
title: NSEnableScreenUpdates()
kind: func
captured: 2026-05-02
---

# NSEnableScreenUpdates()

Enables screen updates.

## Declaration

```swift
func NSEnableScreenUpdates()
```

### Discussion

Reenables, for all windows of a process, the flushing of drawing operations to the screen that was previously disabled by `NSDisableScreenUpdates()`. Successive calls to `NSDisableScreenUpdates()` are placed on a stack and must be popped off that stack by matching calls to this function.







## Availability

- macOS 10.0 (deprecated 10.11)



## See Also

- `NSConvertGlyphsToPackedGlyphs(_:_:_:_:)`
- `raiseBadArgumentException(_:_:_:)`
- `NSReleaseAlertPanel(_:)`
- `NSDisableScreenUpdates()`
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
- `representedPathExtensions(from:)`
