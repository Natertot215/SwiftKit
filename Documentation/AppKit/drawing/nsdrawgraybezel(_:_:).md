---
url: https://developer.apple.com/documentation/appkit/nsdrawgraybezel(_:_:)
framework: AppKit
category: Drawing
title: NSDrawGrayBezel(_:_:)
kind: func
captured: 2026-05-02
---

# NSDrawGrayBezel(_:_:)

Draws a gray-filled rectangle with a bezel border.

## Declaration

```swift
func NSDrawGrayBezel(_ rect: NSRect, _ clipRect: NSRect)
```



## Parameters

- **rect**: The bounding rectangle (in the current coordinate system) in which to draw. Only those parts of `aRect` that lie within the `clipRect` are actually drawn.
- **clipRect**: The clipping rectangle to use during drawing.





## Availability

- macOS ?



## See Also

- `NSDrawTiledRects(_:_:_:_:_:)`

- `NSDrawDarkBezel(_:_:)`
- `NSDrawLightBezel(_:_:)`
- `NSDrawWhiteBezel(_:_:)`
