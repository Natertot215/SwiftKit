---
url: https://developer.apple.com/documentation/appkit/nsaccessibility-swift.struct/screenrect(fromview:rect:)
framework: AppKit
category: Accessibility for AppKit
title: screenRect(fromView:rect:)
kind: method
captured: 2026-05-02
---

# screenRect(fromView:rect:)

Returns the frame in screen coordinates.

## Declaration

```swift
static func screenRect(fromView parentView: NSView, rect frame: NSRect) -> NSRect
```

### Discussion

Given a frame in the specified view’s coordinates, it returns the same frame in the screen’s coordinates.







## Availability

- macOS 10.10



## See Also

- `screenPoint(fromView:point:)`
