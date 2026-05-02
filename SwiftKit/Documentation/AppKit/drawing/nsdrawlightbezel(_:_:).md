---
url: https://developer.apple.com/documentation/appkit/nsdrawlightbezel(_:_:)
framework: AppKit
category: Drawing
title: NSDrawLightBezel(_:_:)
kind: func
captured: 2026-05-02
---

# NSDrawLightBezel(_:_:)

Draws a white-filled rectangle with a bezel border.

## Declaration

```swift
func NSDrawLightBezel(_ rect: NSRect, _ clipRect: NSRect)
```



## Parameters

- **rect**: The bounding rectangle (in the current coordinate system) in which to draw. Only those parts of `aRect` that lie within the `clipRect` are actually drawn.
- **clipRect**: The clipping rectangle to use during drawing.





## Availability

- macOS ?



## See Also

- `NSDrawTiledRects(_:_:_:_:_:)`

- `NSDrawDarkBezel(_:_:)`
- `NSDrawGrayBezel(_:_:)`
- `NSDrawWhiteBezel(_:_:)`
