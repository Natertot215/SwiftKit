---
url: https://developer.apple.com/documentation/appkit/nsaccessibility-swift.struct/screenpoint(fromview:point:)
framework: AppKit
category: Accessibility for AppKit
title: screenPoint(fromView:point:)
kind: method
captured: 2026-05-02
---

# screenPoint(fromView:point:)

Returns the point in screen coordinates.

## Declaration

```swift
static func screenPoint(fromView parentView: NSView, point: NSPoint) -> NSPoint
```

### Discussion

Given a point in the specified view’s coordinates, it returns the same point in the screen’s coordinates.







## Availability

- macOS 10.10



## See Also

- `screenRect(fromView:rect:)`
