---
url: https://developer.apple.com/documentation/appkit/nsfontsymbolictraits
framework: AppKit
category: Fonts
title: NSFontSymbolicTraits
kind: typealias
captured: 2026-05-02
---

# NSFontSymbolicTraits

A symbolic description of stylistic aspects of a font.

## Declaration

```swift
typealias NSFontSymbolicTraits = UInt32
```

### Discussion

The upper 16 bits is used to describe appearance of the font (see `NSFontFamilyClass`) whereas the lower 16 bits is used for typeface information (see `typeface-information`). The font appearance information represented by the upper 16 bits can be used for stylistic font matching. The symbolic traits supersede the existing `NSFontTraitMask` type used by `NSFontManager`. The corresponding values are kept compatible between `NSFontTraitMask` and `NSFontSymbolicTraits`.







## Availability

- macOS ?



## See Also

- `NSFont`
- `NSFontDescriptor`
- `NSFontTraitMask`
- `NSFontFamilyClass`
- `NSFontDescriptor.SymbolicTraits`
- `NSFontAssetRequest`
