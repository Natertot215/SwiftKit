---
url: https://developer.apple.com/documentation/appkit/nslayoutdimension
framework: AppKit
category: View layout
title: NSLayoutDimension
kind: class
captured: 2026-05-02
---

# NSLayoutDimension

A factory class for creating size-based layout constraint objects using a fluent API.

## Declaration

```swift
class NSLayoutDimension
```

### Overview

Use these constraints to programmatically define your layout using Auto Layout. All sizes are measured in points. In addition to providing size-specific methods for creating constraints, this class adds type information to the methods inherited from `NSLayoutAnchor`. Specifically, the generic methods declared by `NSLayoutAnchor` must now take a matching `NSLayoutDimension` object.

For more information on using layout anchors, see `NSLayoutAnchor`.





## Relationships

**Inherits From**: `NSLayoutAnchor`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.11

## Topics

### Building constraints

- `constraint(equalTo:multiplier:)`
- `constraint(equalTo:multiplier:constant:)`
- `constraint(equalToConstant:)`
- `constraint(greaterThanOrEqualTo:multiplier:)`
- `constraint(greaterThanOrEqualTo:multiplier:constant:)`
- `constraint(greaterThanOrEqualToConstant:)`
- `constraint(lessThanOrEqualTo:multiplier:)`
- `constraint(lessThanOrEqualTo:multiplier:constant:)`
- `constraint(lessThanOrEqualToConstant:)`

## See Also

- `NSLayoutGuide`
