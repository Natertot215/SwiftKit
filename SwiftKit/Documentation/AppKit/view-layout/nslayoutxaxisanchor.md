---
url: https://developer.apple.com/documentation/appkit/nslayoutxaxisanchor
framework: AppKit
category: View layout
title: NSLayoutXAxisAnchor
kind: class
captured: 2026-05-02
---

# NSLayoutXAxisAnchor

A factory class for creating horizontal layout constraint objects using a fluent API.

## Declaration

```swift
class NSLayoutXAxisAnchor
```

### Overview

`NSLayoutXAxisAnchor` adds type information to the methods inherited from `NSLayoutAnchor`. Specifically, the generic methods declared by `NSLayoutAnchor` must now take a matching `NSLayoutXAxisAnchor` object.

For more information on using layout anchors, see `NSLayoutAnchor`.





## Relationships

**Inherits From**: `NSLayoutAnchor`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.11

## Topics

### Building system spacing constraints

- `constraint(equalToSystemSpacingAfter:multiplier:)`
- `constraint(greaterThanOrEqualToSystemSpacingAfter:multiplier:)`
- `constraint(lessThanOrEqualToSystemSpacingAfter:multiplier:)`
- `Creating self-sizing table view cells`

### Creating a layout dimension

- `anchorWithOffset(to:)`

## See Also

- `NSLayoutConstraint`
- `Auto Layout Guide`

- `NSLayoutAnchor`
- `NSLayoutYAxisAnchor`
