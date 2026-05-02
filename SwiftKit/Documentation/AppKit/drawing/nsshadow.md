---
url: https://developer.apple.com/documentation/appkit/nsshadow
framework: AppKit
category: Drawing
title: NSShadow
kind: class
captured: 2026-05-02
---

# NSShadow

An object you use to specify attributes to create and style a drop shadow during drawing operations.

## Declaration

```swift
class NSShadow
```

### Overview

When you create shadows, the system draws them in the default user coordinate space, where coordinates are independent from the pixel values of any particular device. Rotations, translations, and other transformations of the current transformation matrix (CTM) don’t affect the shadow or the apparent position of the shadow’s light source.

A shadow has two positional parameters: an x-offset and a y-offset. Express these values with a single size data type (`CGSize` in iOS, `NSSize` in macOS), using the units of the default user coordinate space. Positive values for these offsets extend down and to the right from the user’s perspective.

In addition to its positional parameters, a shadow also contains a blur radius, which specifies how much the system blurs a drawn object’s image mask before compositing the image onto the destination. A value of `0` produces no blur. Larger values produce an increasingly large blurred shadow.

You can use an `NSShadow` object in one of two ways. First, you can set it, like a color or a font, where `NSShadow` attributes apply to everything you draw until you apply another shadow or restore a previous graphics state. Second, you can use an `NSShadow` instance as the value for the `NSAttributedString/Key/shadow` text attribute, so the system applies the shadow to the glyphs corresponding to the characters bearing this attribute.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSSecureCoding`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.0

## Topics

### Creating a shadow

- `init()`

### Managing a shadow

- `shadowOffset`
- `shadowBlurRadius`
- `shadowColor`

### Setting a shadow

- `set()`

### Initializers

- `init(coder:)`
