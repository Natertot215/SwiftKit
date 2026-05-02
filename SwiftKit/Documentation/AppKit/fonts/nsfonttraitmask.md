---
url: https://developer.apple.com/documentation/appkit/nsfonttraitmask
framework: AppKit
category: Fonts
title: NSFontTraitMask
kind: struct
captured: 2026-05-02
---

# NSFontTraitMask

Constants for isolating specific traits of a font.

## Declaration

```swift
struct NSFontTraitMask
```

### Overview

`NSFontManager` categorizes fonts according to a small set of traits. You can convert fonts by adding and removing individual traits, and you can get a font with a specific combination of traits.

These pairs of traits are mutually exclusive:

- `NSFontTraitMask/condensedFontMask` and  `NSFontTraitMask/expandedFontMask`
- `NSFontTraitMask/boldFontMask` and  `NSFontTraitMask/unboldFontMask`
- `NSFontTraitMask/italicFontMask` and  `NSFontTraitMask/unitalicFontMask`





## Relationships

**Conforms To**: `BitwiseCopyable`, `Equatable`, `ExpressibleByArrayLiteral`, `OptionSet`, `RawRepresentable`, `Sendable`, `SendableMetatype`, `SetAlgebra`

## Availability

- macOS ?

## Topics

### Trait Masks

- `boldFontMask`
- `compressedFontMask`
- `condensedFontMask`
- `expandedFontMask`
- `fixedPitchFontMask`
- `italicFontMask`
- `narrowFontMask`
- `nonStandardCharacterSetFontMask`
- `posterFontMask`
- `smallCapsFontMask`
- `unboldFontMask`
- `unitalicFontMask`

### Initializers

- `init(rawValue:)`

## See Also

- `NSFont`
- `NSFontDescriptor`
- `NSFontFamilyClass`
- `NSFontDescriptor.SymbolicTraits`
- `NSFontAssetRequest`
- `NSFontSymbolicTraits`
