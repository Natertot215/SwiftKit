---
url: https://developer.apple.com/documentation/appkit/nstextlayoutorientationprovider
framework: AppKit
category: TextKit
title: NSTextLayoutOrientationProvider
kind: protocol
captured: 2026-05-02
---

# NSTextLayoutOrientationProvider

A set of methods that define the orientation of text for an object.

## Declaration

```swift
protocol NSTextLayoutOrientationProvider
```

### Overview

In macOS, the `NSTextContainer` and `NSTextView` classes adopt this protocol; in iOS, only the `NSTextContainer` class implements it. An `NSTextContainer` object returns the value from its associated text view when present; otherwise, it returns `NSLayoutManager/TextLayoutOrientation/horizontal` by default. If you define a custom `NSTextContainer` object, you can override this method and return `NSLayoutManager/TextLayoutOrientation/vertical` to support laying out text vertically.





## Relationships

**Conforming Types**: `NSTextContainer`, `NSTextView`

## Availability

- macOS ?

## Topics

### Getting layout orientation

- `layoutOrientation`
- `NSLayoutManager.TextLayoutOrientation`

## See Also

- `Using TextKit 2 to interact with text`
- `NSTextLayoutManager`
- `NSTextContainer`
- `NSTextLayoutFragment`
- `NSTextLineFragment`
- `NSTextViewportLayoutController`
