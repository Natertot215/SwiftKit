---
url: https://developer.apple.com/documentation/appkit/nscolor
framework: AppKit
category: Color
title: NSColor
kind: class
captured: 2026-05-02
---

# NSColor

An object that stores color data and sometimes opacity (alpha value).

## Declaration

```swift
class NSColor
```

### Overview

Many methods in AppKit require you to specify color data using an `NSColor` object; when drawing you use them to set the current fill and stroke colors. Color objects are immutable and thread-safe. You can create color objects in many ways:

- Load colors from an asset catalog. Colors created from assets can adapt automatically to system appearance changes.
- Use the semantic colors for custom UI elements, so that they match the appearance of other AppKit views; see `ui-element-colors`.
- Use the adaptable system colors, such as `NSColor/systemBlue`, when you want a specific tint that looks correct in both light and dark environments.
- Create a color object from another object, such as a Core Graphics representation of a color, or a Core Image color.
- Create a color from an `NSImage` object, and paint a repeating pattern instead of using a solid color.
- Create a color by applying a transform to another `NSColor` object. For example, you might perform a blend operation between two colors, or you might create a color that represents the same color, but in a different color space.
- Create custom colors using raw component values, and a variety of color spaces, when you need to represent user-specified colors.

For user-specified colors, you can also display a color panel and let the user specify the color. For information about color panels, see `NSColorPanel`.

#### Color and color spaces

A color object is typically represented internally as a Core Graphics color (`CGColor`) in a Core Graphics color space (`CGColorSpace`). Colors can also be created in extended color spaces:

- `NSColorSpace/extendedSRGB`
- `NSColorSpace/extendedGenericGamma22Gray`

When you need to worry about color spaces, use extended color spaces as working color spaces. When you need to worry about representing that color as closely as possible in a specific color space, convert the color from the extended color space into the target color space.

When working in an extended color space, color values are not clamped to fit inside the color gamut, meaning that component values may be less than `0.0` or greater than `1.0`. When displayed on an sRGB display, such colors are outside the gamut and won’t render accurately. However, extended color spaces are useful as working color spaces when you want a pixel format and representation that other color spaces can be easily converted into. For example, a color in the Display P3 color space can convert to an extended sRGB format, even if it isn’t within the sRGB color gamut. While some of the converted color’s values are outside of the 0-1.0 range, the color renders correctly when viewed on a device with a P3 display gamut.

It is a programmer error to access color components of a color space that the `NSColor` object does not support. For example, you cannot access the `NSColor/redComponent` property and `NSColor/getRed(_:green:blue:alpha:)` method on a color that uses the CMYK color space. Further, the `NSColor/getComponents(_:)` method and `NSColor/numberOfComponents` property work only in color spaces that have individual components. As such, they return the components of color objects as individual floating-point values regardless of whether they’re based on `NSColorSpace` objects or named color spaces. However, older component-fetching methods such as `NSColor/getRed(_:green:blue:alpha:)` are effective only on color objects based on named color spaces.

If you have a color object in an unknown color space and you want to extract its components, convert the color object to a known color space and then use the component accessor methods of that color space.

For design guidance, see Human Interface Guidelines > `https://developer.apple.com/design/human-interface-guidelines/color/`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `Copyable`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `NSAccessibilityColor`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSPasteboardReading`, `NSPasteboardWriting`, `NSSecureCoding`, `Sendable`, `SendableMetatype`, `Transferable`

## Availability

- macOS ?

## Topics

### Getting and creating colors

- `UI element colors`
- `Standard colors`
- `Color creation`

### Applying specific appearances to colors

- `withSystemEffect(_:)`
- `NSColor.SystemEffect`

### Transforming existing color objects

- `usingColorSpace(_:)`
- `blended(withFraction:of:)`
- `withAlphaComponent(_:)`
- `highlight(withLevel:)`
- `shadow(withLevel:)`

### Copying and pasting color Information

- `init(from:)`
- `write(to:)`

### Retrieving component values from color objects

- `getCyan(_:magenta:yellow:black:alpha:)`
- `getHue(_:saturation:brightness:alpha:)`
- `getRed(_:green:blue:alpha:)`
- `getWhite(_:alpha:)`
- `numberOfComponents`
- `getComponents(_:)`

### Retrieving individual components

- `alphaComponent`
- `whiteComponent`
- `redComponent`
- `greenComponent`
- `blueComponent`
- `cyanComponent`
- `magentaComponent`
- `yellowComponent`
- `blackComponent`
- `hueComponent`
- `saturationComponent`
- `brightnessComponent`
- `catalogNameComponent`
- `localizedCatalogNameComponent`
- `colorNameComponent`
- `localizedColorNameComponent`

### Working with the color space

- `type`
- `usingType(_:)`
- `NSColor.ColorType`
- `colorSpace`
- `NSColorSpaceName`

### Supporting high dynamic range (HDR) colors

- `linearExposure`
- `standardDynamicRange`
- `applyingContentHeadroom(_:)`

### Retrieving core graphics color information

- `cgColor`

### Drawing with colors

- `drawSwatch(in:)`
- `set()`
- `setFill()`
- `setStroke()`

### Determining when colors change

- `systemColorsDidChangeNotification`

### Deprecated

- `ignoresAlpha`
- `colorSpaceName`
- `usingColorSpaceName(_:)`
- `usingColorSpaceName(_:device:)`
- `currentControlTintDidChangeNotification`

### Initializers

- `init(CGColor:)`
- `init(SRGBRed:green:blue:alpha:)`
- `init(ciColor:)`
- `init(forControlTint:)`
- `init(fromPasteboard:)`
- `init(pasteboardPropertyList:ofType:)`

### Default Implementations

- `NSColor Implementations`

## See Also

- `NSColorList`
- `NSColorSpace`
