---
url: https://developer.apple.com/documentation/appkit/nscolorspace
framework: AppKit
category: Color
title: NSColorSpace
kind: class
captured: 2026-05-02
---

# NSColorSpace

An object that represents a custom color space.

## Declaration

```swift
class NSColorSpace
```

### Overview

You can make custom color spaces from ColorSync profiles or from ICC profiles. `NSColorSpace` also has factory methods that return objects representing the system color spaces.

You can use the `NSColor/init(colorSpace:components:count:)` method of the `NSColor` class to create color objects using custom `NSColorSpace` objects. You can also send the `NSColor/usingColorSpace(_:)` message to an `NSColor` object to convert it between two color spaces, either of which may be a custom color space.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `NSSecureCoding`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Getting a Named Color Space

- `deviceRGB`
- `genericRGB`
- `deviceCMYK`
- `genericCMYK`
- `deviceGray`
- `genericGray`
- `sRGB`
- `extendedSRGB`
- `displayP3`
- `genericGamma22Gray`
- `extendedGenericGamma22Gray`
- `adobeRGB1998`

### Getting the Color Spaces Available On the System

- `availableColorSpaces(with:)`

### Initializing a Custom Color Space Object

- `init(cgColorSpace:)`
- `init(colorSyncProfile:)`
- `init(iccProfileData:)`

### Accessing Color Space Data and Attributes

- `cgColorSpace`
- `colorSpaceModel`
- `NSColorSpace.Model`
- `colorSyncProfile`
- `iccProfileData`
- `localizedName`
- `numberOfColorComponents`

### Initializers

- `init(CGColorSpace:)`
- `init(ICCProfileData:)`
- `init(coder:)`

## See Also

- `NSColor`
- `NSColorList`
