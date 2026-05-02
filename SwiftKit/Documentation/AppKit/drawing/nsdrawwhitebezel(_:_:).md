---
url: https://developer.apple.com/documentation/appkit/nsdrawwhitebezel(_:_:)
framework: AppKit
category: Drawing
title: NSDrawWhiteBezel(_:_:)
kind: func
captured: 2026-05-02
---

# NSDrawWhiteBezel(_:_:)

Draws a white-filled rectangle with a bezel border.

## Declaration

```swift
func NSDrawWhiteBezel(_ rect: NSRect, _ clipRect: NSRect)
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
- `NSDrawLightBezel(_:_:)`
