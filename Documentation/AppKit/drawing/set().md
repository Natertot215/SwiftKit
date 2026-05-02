---
url: https://developer.apple.com/documentation/appkit/nsfocusringplacement/set()
framework: AppKit
category: Drawing
title: set()
kind: method
captured: 2026-05-02
---

# set()

Specifies how the system draws the focus ring.

## Declaration

```swift
func set()
```

### Discussion

Use `NSFocusRingPlacement/above` to draw the focus ring over an image, use `NSFocusRingPlacement/below` to draw the focus ring under text, and use `NSFocusRingPlacement/only` if you don’t have an image or text. For the `NSFocusRingPlacement/only` case, fills a shape to add the focus ring around the shape.

Note that the focus ring may actually be drawn outside the view but will be clipped to any clipping superview or the window content view.







## Availability

- macOS ?



## See Also

- `NSFocusRingPlacement`
- `NSFocusRingType`
