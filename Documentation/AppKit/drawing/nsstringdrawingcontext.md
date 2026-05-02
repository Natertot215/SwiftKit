---
url: https://developer.apple.com/documentation/appkit/nsstringdrawingcontext
framework: AppKit
category: Drawing
title: NSStringDrawingContext
kind: class
captured: 2026-05-02
---

# NSStringDrawingContext

An object that manages metrics for drawing attributed strings.

## Declaration

```swift
class NSStringDrawingContext
```

### Overview

Prior to drawing, you can create an instance of this class and use it to specify the minimum scale factor and tracking adjustments for a string. After drawing, you can retrieve the actual values that were used during drawing.

To use this class, allocate and initialize a new instance, set the minimum values, and pass your object to one of the corresponding `NSAttributedString` methods that take the context object as a parameter. Upon completion of drawing, you can use the actual drawing values to make adjustments or record where the string was actually drawn.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 10.11

## Topics

### Accessing the scale factors

- `minimumScaleFactor`
- `actualScaleFactor`

### Getting the drawing bounds

- `totalBounds`

## See Also

- `NSStringDrawingOptions`
