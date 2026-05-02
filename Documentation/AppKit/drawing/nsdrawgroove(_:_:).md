---
url: https://developer.apple.com/documentation/appkit/nsdrawgroove(_:_:)
framework: AppKit
category: Drawing
title: NSDrawGroove(_:_:)
kind: func
captured: 2026-05-02
---

# NSDrawGroove(_:_:)

Draws a gray-filled rectangle with a groove border.

## Declaration

```swift
func NSDrawGroove(_ rect: NSRect, _ clipRect: NSRect)
```



## Parameters

- **rect**: The bounding rectangle (in the current coordinate system) in which to draw. Only those parts of `aRect` that lie within the `clipRect` are actually drawn.
- **clipRect**: The clipping rectangle to use during drawing.





## Availability

- macOS ?



## See Also

- `NSEraseRect(_:)`
- `NSDrawTiledRects(_:_:_:_:_:)`
