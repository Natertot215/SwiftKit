---
url: https://developer.apple.com/documentation/appkit/nsdrawdarkbezel(_:_:)
framework: AppKit
category: Drawing
title: NSDrawDarkBezel(_:_:)
kind: func
captured: 2026-05-02
---

# NSDrawDarkBezel(_:_:)

Draws a dark gray-filled rectangle with a bezel border.

## Declaration

```swift
func NSDrawDarkBezel(_ rect: NSRect, _ clipRect: NSRect)
```



## Parameters

- **rect**: The bounding rectangle (in the current coordinate system) in which to draw. Only those parts of `aRect` that lie within the `clipRect` are actually drawn.
- **clipRect**: The clipping rectangle to use during drawing.





## Availability

- macOS ?



## See Also

- `NSDrawTiledRects(_:_:_:_:_:)`

- `NSDrawGrayBezel(_:_:)`
- `NSDrawLightBezel(_:_:)`
- `NSDrawWhiteBezel(_:_:)`
