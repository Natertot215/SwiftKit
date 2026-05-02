---
url: https://developer.apple.com/documentation/appkit/nsreleasealertpanel(_:)
framework: AppKit
category: Deprecated symbols
title: NSReleaseAlertPanel(_:)
kind: func
captured: 2026-05-02
---

# NSReleaseAlertPanel(_:)

Disposes of an alert panel.

## Declaration

```swift
func NSReleaseAlertPanel(_ panel: Any!)
```

### Discussion

When you’re finished with a panel created by a function such as `NSGetAlertPanel`, `NSGetCriticalAlertPanel`, or `NSGetInformationalAlertPanel`, you must dispose of it by passing it to this function.

Note that the alert panel may not be deallocated immediately because it may have internal references that are disposed of in a deferred way. You should not make the assumption that the alert panel is immediately removed from the application window list.







## Availability

- macOS 10.0 (deprecated 10.10)



## See Also

- `NSConvertGlyphsToPackedGlyphs(_:_:_:_:)`
- `raiseBadArgumentException(_:_:_:)`
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
- `representedPathExtensions(from:)`
