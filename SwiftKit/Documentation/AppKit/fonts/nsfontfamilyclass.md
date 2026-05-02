---
url: https://developer.apple.com/documentation/appkit/nsfontfamilyclass
framework: AppKit
category: Fonts
title: NSFontFamilyClass
kind: typealias
captured: 2026-05-02
---

# NSFontFamilyClass

Constants that classify certain stylistic qualities of the font.

## Declaration

```swift
typealias NSFontFamilyClass = UInt32
```

### Discussion

These values correspond closely to the font class values in the OpenType OS/2 table. The class values are bundled in the upper four bits of `NSFontSymbolicTraits` and can be accessed via `NSFontFamilyClassMask`. For more information about the specific meaning of each identifier, refer to the OpenType specification.







## Availability

- macOS ?

## Topics

### Constants

- `NSFontUnknownClass`
- `NSFontOldStyleSerifsClass`
- `NSFontTransitionalSerifsClass`
- `NSFontModernSerifsClass`
- `NSFontClarendonSerifsClass`
- `NSFontSlabSerifsClass`
- `NSFontFreeformSerifsClass`
- `NSFontSansSerifClass`
- `NSFontOrnamentalsClass`
- `NSFontScriptsClass`
- `NSFontSymbolicClass`

## See Also

- `NSFont`
- `NSFontDescriptor`
- `NSFontTraitMask`
- `NSFontDescriptor.SymbolicTraits`
- `NSFontAssetRequest`
- `NSFontSymbolicTraits`
