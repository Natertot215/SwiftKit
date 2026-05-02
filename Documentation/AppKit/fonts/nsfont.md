---
url: https://developer.apple.com/documentation/appkit/nsfont
framework: AppKit
category: Fonts
title: NSFont
kind: class
captured: 2026-05-02
---

# NSFont

The representation of a font in an app.

## Declaration

```swift
class NSFont
```

### Overview

`NSFont` objects represent fonts to an app, providing access to characteristics of the font and assistance in laying out glyphs relative to one another. Font objects are also used to establish the current font for drawing text directly into a graphics context, using the `NSFont/set()` method.

You don’t create `NSFont` objects using the `alloc` and `init` methods. Instead, you use either `NSFont/init(descriptor:size:)` or `NSFont/init(name:size:)` to look up an available font and alter its size or matrix to your needs. These methods check for an existing font object with the specified characteristics, returning it if there is one. Otherwise, they look up the font data requested and create the appropriate object. `NSFont` also defines a number of methods for getting standard system fonts, such as `NSFont/systemFont(ofSize:)`, `NSFont/userFont(ofSize:)`, and `NSFont/messageFont(ofSize:)`. To request the default size for these standard fonts, pass a negative number or `0` as the font size. For more information on system fonts, see Human Interface Guidelines > `doc://com.apple.documentation/design/Human-Interface-Guidelines/typography`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSSecureCoding`

## Availability

- macOS ?

## Topics

### Creating Arbitrary Fonts

- `init(name:size:)`
- `init(descriptor:size:)`
- `init(descriptor:textTransform:)`
- `init(name:matrix:)`

### Creating User Fonts

- `userFont(ofSize:)`
- `userFixedPitchFont(ofSize:)`

### Creating System Fonts

- `preferredFont(forTextStyle:options:)`
- `systemFont(ofSize:)`
- `systemFont(ofSize:weight:)`
- `boldSystemFont(ofSize:)`
- `monospacedSystemFont(ofSize:weight:)`
- `monospacedDigitSystemFont(ofSize:weight:)`
- `systemFontSize`
- `smallSystemFontSize`
- `NSFont.Weight`
- `NSFont.TextStyle`
- `NSFont.TextStyleOptionKey`

### Creating UI Element Fonts

- `labelFont(ofSize:)`
- `messageFont(ofSize:)`
- `menuBarFont(ofSize:)`
- `menuFont(ofSize:)`
- `controlContentFont(ofSize:)`
- `titleBarFont(ofSize:)`
- `paletteFont(ofSize:)`
- `toolTipsFont(ofSize:)`
- `labelFontSize`
- `systemFontSize(for:)`

### Using a Font to Draw

- `set()`
- `set(in:)`

### Getting Font Metrics and Information

- `pointSize`
- `coveredCharacterSet`
- `fontDescriptor`
- `isFixedPitch`
- `mostCompatibleStringEncoding`
- `Advanced Font Metrics`

### Getting Information About Glyphs

- `numberOfGlyphs`
- `NSGlyph`
- `NSControlGlyph`
- `NSNullGlyph`

### Getting Font Names

- `displayName`
- `familyName`
- `fontName`

### Setting User Fonts

- `setUser(_:)`
- `setUserFixedPitch(_:)`

### Vertical Fonts

- `isVertical`
- `vertical`

### Responding to Font-Related Notifications

- `antialiasThresholdChangedNotification`
- `fontSetChangedNotification`

### Deprecated

- `Deprecated Symbols`

### Type Aliases

- `NSFont.Width`

### Instance Properties

- `printer`
- `renderingMode`
- `screen`

### Instance Methods

- `advancement(forGlyph:)`
- `boundingRect(forGlyph:)`
- `getAdvancements(_:forGlyphs:count:)`
- `getAdvancements(_:forPackedGlyphs:length:)`
- `getBoundingRects(_:forGlyphs:count:)`
- `glyph(withName:)`
- `screenFont(with:)`
- `withSize(_:)`

### Type Methods

- `systemFont(ofSize:weight:width:)`

### Initializers

- `init(coder:)`

## See Also

- `NSFontDescriptor`
- `NSFontTraitMask`
- `NSFontFamilyClass`
- `NSFontDescriptor.SymbolicTraits`
- `NSFontAssetRequest`
- `NSFontSymbolicTraits`
