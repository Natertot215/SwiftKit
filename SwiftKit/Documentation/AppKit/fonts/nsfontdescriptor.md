---
url: https://developer.apple.com/documentation/appkit/nsfontdescriptor
framework: AppKit
category: Fonts
title: NSFontDescriptor
kind: class
captured: 2026-05-02
---

# NSFontDescriptor

A dictionary of attributes that describe a font.

## Declaration

```swift
class NSFontDescriptor
```

### Overview

A font descriptor can be used to create or modify an `NSFont` object. The system provides a font matching capability, so that you can partially describe a font by creating a font descriptor with, for example, just a family name. You can then find all the available fonts on the system with a matching family name using `NSFontDescriptor/matchingFontDescriptors(withMandatoryKeys:)`.

There are several ways to create a new `NSFontDescriptor` object. You can use `alloc` and  `NSFontDescriptor/init(fontAttributes:)`, `NSFontDescriptor/fontDescriptorWithFontAttributes:`, `NSFontDescriptor/init(name:matrix:)`, or `NSFontDescriptor/init(name:size:)`. to create a font descriptor based on either your custom attributes dictionary or on a specific font’s name and size. Alternatively you can use one of the `fontDescriptor…` instance methods (such as `NSFontDescriptor/withFace(_:)`) to create a modified version of an existing descriptor. The latter methods are useful if you have an existing descriptor and simply want to change one aspect.

All attributes in the attributes dictionary are optional.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSSecureCoding`

## Availability

- macOS ?

## Topics

### Creating a Font Descriptor

- `preferredFontDescriptor(forTextStyle:options:)`
- `init(name:matrix:)`
- `init(name:size:)`
- `init(fontAttributes:)`

### Modifying an Existing Font Descriptor

- `addingAttributes(_:)`
- `withFace(_:)`
- `withFamily(_:)`
- `withMatrix(_:)`
- `withSize(_:)`
- `withSymbolicTraits(_:)`
- `withDesign(_:)`
- `NSFontDescriptor.SystemDesign`

### Finding Fonts

- `matchingFontDescriptors(withMandatoryKeys:)`
- `matchingFontDescriptor(withMandatoryKeys:)`

### Getting the Font Attributes

- `fontAttributes`
- `object(forKey:)`
- `NSFontDescriptor.AttributeName`
- `NSFontDescriptor.SymbolicTraits`
- `matrix`
- `pointSize`
- `postscriptName`
- `NSFontDescriptor.FeatureKey`
- `NSFontFamilyClass`
- `NSFontFamilyClassMask`
- `Typeface Information`
- `NSFontDescriptor.VariationKey`

### Getting the Font Traits

- `symbolicTraits`
- `NSFontSymbolicTraits`
- `NSFontDescriptor.TraitKey`

### Requiring Font Assets

- `requiresFontAssetRequest`

### Initializers

- `init(coder:)`

## See Also

- `NSFont`
- `NSFontTraitMask`
- `NSFontFamilyClass`
- `NSFontDescriptor.SymbolicTraits`
- `NSFontAssetRequest`
- `NSFontSymbolicTraits`
