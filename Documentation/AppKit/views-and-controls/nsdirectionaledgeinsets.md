---
url: https://developer.apple.com/documentation/appkit/nsdirectionaledgeinsets
framework: AppKit
category: Views and controls
title: NSDirectionalEdgeInsets
kind: struct
captured: 2026-05-02
---

# NSDirectionalEdgeInsets

The inset distances for views, taking the user interface layout direction into account.

## Declaration

```swift
struct NSDirectionalEdgeInsets
```







## Relationships

**Conforms To**: `BitwiseCopyable`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.15

## Topics

### Creating directional edge insets

- `init()`
- `init(top:leading:bottom:trailing:)`

### Getting the edge values

- `bottom`
- `leading`
- `top`
- `trailing`

### Converting to and from strings

- `string(for:)`
- `nsDirectionalEdgeInsets(for:)`

### Getting the empty edge insets

- `NSDirectionalEdgeInsetsZero`

### Initializers

- `init(_:)`

## See Also

- `NSRectAlignment`
- `NSDirectionalRectEdge`
