---
url: https://developer.apple.com/documentation/appkit/nsreadpixel(_:)
framework: AppKit
category: Deprecated symbols
title: NSReadPixel(_:)
kind: func
captured: 2026-05-02
---

# NSReadPixel(_:)

Reads the color of the pixel at the specified location.

## Declaration

```swift
func NSReadPixel(_ passedPoint: NSPoint) -> NSColor?
```

### Return Value

The color of the pixel at the specified location.

### Discussion

Because the `passedPoint` parameter is relative to the current coordinate system, if you wish to read a pixel from a specific view, you must convert points in the view’s coordinate system to the current coordinate system before calling this function. Alternatively, you can lock focus on the view and then specify the pixel coordinate in the view’s coordinate system.

When mapping the specified point to pixel boundaries, this method rounds to the nearest pixel.

## Parameters

- **passedPoint**: The pixel location to read, specified in the current coordinate system.





## Availability

- macOS 10.0 (deprecated 10.14)



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
- `NSGetWindowServerMemory(_:_:_:_:)`
- `fileContentsType(forPathExtension:)`
- `fileNameType(forPathExtension:)`
- `representedPathExtension`
- `representedPathExtensions(from:)`
