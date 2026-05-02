---
url: https://developer.apple.com/documentation/appkit/nsdrawcolortiledrects(_:_:_:_:_:)
framework: AppKit
category: Deprecated symbols
title: NSDrawColorTiledRects(_:_:_:_:_:)
kind: func
captured: 2026-05-02
---

# NSDrawColorTiledRects(_:_:_:_:_:)

Draws a single-color, bordered rectangle.

## Declaration

```swift
func NSDrawColorTiledRects(_ boundsRect: NSRect, _ clipRect: NSRect, _ sides: UnsafePointer<NSRectEdge>, _ colors: AutoreleasingUnsafeMutablePointer<NSColor>, _ count: Int) -> NSRect
```

### Return Value

The rectangle that lies within the resulting border.

### Discussion

Behaves the same as `NSDrawTiledRects(_:_:_:_:_:)` except it draws its border using colors from the `colors` array.

## Parameters

- **boundsRect**: The bounding rectangle (in the current coordinate system) in which to draw. Since this function is often used to draw the border of a view, this rectangle will typically be that view’s bounds rectangle. Only those parts of `boundsRect` that lie within the `clipRect` are actually drawn.
- **clipRect**: The clipping rectangle to use during drawing.
- **sides**: The sides of the rectangle for which you want to specify custom colors. Each side must have a corresponding entry in the `colors` parameter.
- **colors**: The colors to draw for each of the edges listed in the `sides` parameter.
- **count**: The number of 1.0-unit-wide slices to draw on the specified sides.





## Availability

- macOS ?



## See Also

- `NSConvertGlyphsToPackedGlyphs(_:_:_:_:)`
- `raiseBadArgumentException(_:_:_:)`
- `NSReleaseAlertPanel(_:)`
- `NSDisableScreenUpdates()`
- `NSEnableScreenUpdates()`
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
