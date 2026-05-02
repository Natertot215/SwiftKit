---
url: https://developer.apple.com/documentation/appkit/nslayoutyaxisanchor
framework: AppKit
category: View layout
title: NSLayoutYAxisAnchor
kind: class
captured: 2026-05-02
---

# NSLayoutYAxisAnchor

A factory class for creating vertical layout constraint objects using a fluent API.

## Declaration

```swift
class NSLayoutYAxisAnchor
```

### Overview

`NSLayoutYAxisAnchor` adds type information to the methods inherited from `NSLayoutAnchor`. Specifically, the generic methods declared by `NSLayoutAnchor` must now take a matching `NSLayoutYAxisAnchor` object.

For more information on using layout anchors, see `NSLayoutAnchor`.





## Relationships

**Inherits From**: `NSLayoutAnchor`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.11

## Topics

### Building system spacing constraints

- `constraint(equalToSystemSpacingBelow:multiplier:)`
- `constraint(greaterThanOrEqualToSystemSpacingBelow:multiplier:)`
- `constraint(lessThanOrEqualToSystemSpacingBelow:multiplier:)`
- `Creating self-sizing table view cells`

### Creating a layout dimension

- `anchorWithOffset(to:)`

## See Also

- `NSLayoutConstraint`
- `Auto Layout Guide`

- `NSLayoutAnchor`
- `NSLayoutXAxisAnchor`
