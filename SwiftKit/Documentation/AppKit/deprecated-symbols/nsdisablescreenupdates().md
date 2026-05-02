---
url: https://developer.apple.com/documentation/appkit/nsdisablescreenupdates()
framework: AppKit
category: Deprecated symbols
title: NSDisableScreenUpdates()
kind: func
captured: 2026-05-02
---

# NSDisableScreenUpdates()

Disables screen updates.

## Declaration

```swift
func NSDisableScreenUpdates()
```

### Discussion

Prevents drawing operations from being flushed to the screen for all windows belonging to the calling process. When you re-enable screen updates (with `NSEnableScreenUpdates()`) screen flushing for all windows belonging to the calling process appears to be simultaneous. You typically call this function so that operations on multiple windows appear atomic to the user. This is a technique particularly useful for synchronizing parent and child windows. Make sure that the period after calling this function and before reenabling updates is short; the system only allow updating to be disabled for a limited time (currently one second) before automatically reenabling updates. Successive calls to this function are placed on a stack and must be popped off that stack by matching `NSEnableScreenUpdates()` calls.







## Availability

- macOS 10.0 (deprecated 10.11)



## See Also

- `NSConvertGlyphsToPackedGlyphs(_:_:_:_:)`
- `raiseBadArgumentException(_:_:_:)`
- `NSReleaseAlertPanel(_:)`
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
- `representedPathExtensions(from:)`
