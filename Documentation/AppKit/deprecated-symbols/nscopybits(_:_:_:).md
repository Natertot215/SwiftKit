---
url: https://developer.apple.com/documentation/appkit/nscopybits(_:_:_:)
framework: AppKit
category: Deprecated symbols
title: NSCopyBits(_:_:_:)
kind: func
captured: 2026-05-02
---

# NSCopyBits(_:_:_:)

Copies a bitmap image to the location specified by a destination point.

## Declaration

```swift
func NSCopyBits(_ srcGState: Int, _ srcRect: NSRect, _ destPoint: NSPoint)
```

### Discussion

Copies the pixels in the rectangle specified by `srcRect` to the location specified by `destPoint`. The source rectangle is defined in the graphics state designated by `srcGState`. If `srcGState` is `NSNullObject`, the current graphics state is assumed. The `destPoint` destination is defined in the current graphics state.







## Availability

- macOS 10.0 (deprecated 10.10)



## See Also

- `NSConvertGlyphsToPackedGlyphs(_:_:_:_:)`
- `raiseBadArgumentException(_:_:_:)`
- `NSReleaseAlertPanel(_:)`
- `NSDisableScreenUpdates()`
- `NSEnableScreenUpdates()`
- `NSDrawColorTiledRects(_:_:_:_:_:)`
- `NSSetShowsServicesMenuItem(_:_:)`
- `NSShowsServicesMenuItem(_:)`
- `NSDottedFrameRect(_:)`
- `NSReadPixel(_:)`
- `NSGetWindowServerMemory(_:_:_:_:)`
- `fileContentsType(forPathExtension:)`
- `fileNameType(forPathExtension:)`
- `representedPathExtension`
- `representedPathExtensions(from:)`
