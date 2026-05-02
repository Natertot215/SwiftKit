---
url: https://developer.apple.com/documentation/appkit/nstypesetter
framework: AppKit
category: TextKit
title: NSTypesetter
kind: class
captured: 2026-05-02
---

# NSTypesetter

An abstract class that performs various type layout tasks.

## Declaration

```swift
class NSTypesetter
```

### Overview

`NSLayoutManager` uses concrete subclasses of `NSTypesetter` to perform line layout, which includes word wrapping, hyphenation, and line breaking in either vertical or horizontal rectangles. By default, the text system uses the concrete subclass `NSATSTypesetter`.

> **NOTE:**  Use this class with `NSLayoutManager` in macOS11 and earlier. In macOS12 and later, consider using `NSLayoutManager` which provides improved support for international scripts.

#### Subclassing Notes

`NSTypesetter` provides concrete subclasses with default implementation interfacing with the Cocoa text system. By subclassing `NSTypesetter`, an application can override the `NSTypesetter/layoutParagraph(at:)` method to integrate a custom typesetting engine into the Cocoa text system. On the other hand, an application can subclass `NSATSTypesetter` and override the glyph storage interface to integrate the concrete subclass into its own custom layout system.

`NSTypesetter` methods belong to three categories: glyph storage interface methods, layout phase interface methods, and core typesetter methods. The glyph storage interface methods map to `NSLayoutManager` methods. The typesetter itself calls these methods, and their default implementations call the Cocoa layout manager. An `NSTypesetter` subclass can override these methods to call its own glyph storage facility, in which case it should override all of them. (This doesn’t preclude the overridden method calling its superclass implementation if appropriate).

The layout phase interface provides control points similar to delegate methods; if implemented, the system invokes these methods to notify an `NSTypesetter` subclass of events in the layout process so it can intervene as needed.

The remainder of the `NSTypesetter` methods are primitive, core typesetter methods. The core typesetter methods correlate with typesetting state attributes; the layout manager calls these methods to store its values before starting the layout process. If you subclass `NSTypesetter` and override the glyph storage interface methods, you can call the core methods to control the typesetter directly.

##### Glyph Storage Interface

Override these methods to use `NSTypesetter`’s built-in concrete subclass, `NSATSTypesetter`, with a custom glyph storage and layout system other than the Cocoa layout manager and text container mechanism.

- `NSTypesetter/characterRange(forGlyphRange:actualGlyphRange:)`
- `NSTypesetter/glyphRange(forCharacterRange:actualCharacterRange:)`
- `NSTypesetter/getGlyphs(in:glyphs:characterIndexes:glyphInscriptions:elasticBits:bidiLevels:)`
- `NSTypesetter/getLineFragmentRect(_:usedRect:remaining:forStartingGlyphAt:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter:)`
- `NSTypesetter/setLineFragmentRect(_:forGlyphRange:usedRect:baselineOffset:)`
- `NSTypesetter/substituteGlyphs(in:withGlyphs:)`
- `NSTypesetter/insertGlyph(_:atGlyphIndex:characterIndex:)`
- `NSTypesetter/deleteGlyphs(in:)`
- `NSTypesetter/setNotShownAttribute(_:forGlyphRange:)`
- `NSTypesetter/setDrawsOutsideLineFragment(_:forGlyphRange:)`
- `NSTypesetter/setLocation(_:withAdvancements:forStartOfGlyphRange:)`
- `NSTypesetter/setAttachmentSize(_:forGlyphRange:)`
- `NSTypesetter/setBidiLevels(_:forGlyphRange:)`

##### Layout Phase Interface

Override these methods to customize the text layout process, including modifying line fragments, controlling line breaking and hyphenation, and controlling the behavior of tabs and other control glyphs.

- `NSTypesetter/willSetLineFragmentRect(_:forGlyphRange:usedRect:baselineOffset:)`
- `NSTypesetter/shouldBreakLine(byWordBeforeCharacterAt:)`
- `NSTypesetter/shouldBreakLine(byHyphenatingBeforeCharacterAt:)`
- `NSTypesetter/hyphenationFactor(forGlyphAt:)`
- `NSTypesetter/hyphenCharacter(forGlyphAt:)`
- `NSTypesetter/boundingBox(forControlGlyphAt:for:proposedLineFragment:glyphPosition:characterIndex:)`





## Relationships

**Inherits From**: `NSObject`

**Inherited By**: `NSATSTypesetter`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Getting a typesetter

- `sharedSystemTypesetter`
- `sharedSystemTypesetter(for:)`

### Getting information about a typesetter

- `defaultTypesetterBehavior`

### Getting information about glyphs

- `printingAdjustment(in:forNominallySpacedGlyphRange:packedGlyphs:count:)`
- `baselineOffset(in:glyphIndex:)`

### Accessing the layout manager

- `layoutManager`
- `usesFontLeading`
- `typesetterBehavior`
- `hyphenationFactor`

### Managing text containers

- `currentTextContainer`
- `textContainers`
- `lineFragmentPadding`

### Performing font substitution

- `substituteFont(for:)`

### Getting the location of text tabs

- `textTab(forGlyphLocation:writingDirection:maxLocation:)`

### Bidirectional text processing

- `bidiProcessingEnabled`

### Accessing paragraph typesetting information

- `currentParagraphStyle`
- `attributedString`
- `setParagraphGlyphRange(_:separatorGlyphRange:)`
- `paragraphGlyphRange`
- `paragraphSeparatorGlyphRange`
- `paragraphCharacterRange`
- `paragraphSeparatorCharacterRange`
- `attributesForExtraLineFragment`

### Getting spacing information

- `lineSpacing(afterGlyphAt:withProposedLineFragmentRect:)`
- `paragraphSpacing(afterGlyphAt:withProposedLineFragmentRect:)`
- `paragraphSpacing(beforeGlyphAt:withProposedLineFragmentRect:)`

### Laying out a paragraph

- `layoutParagraph(at:)`
- `beginParagraph()`
- `endParagraph()`
- `beginLine(withGlyphAt:)`
- `endLine(withGlyphRange:)`

### Laying out characters

- `layoutCharacters(in:for:maximumNumberOfLineFragments:)`

### Laying out glyphs

- `layoutGlyphs(in:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:)`
- `boundingBox(forControlGlyphAt:for:proposedLineFragment:glyphPosition:characterIndex:)`
- `getLineFragmentRect(_:usedRect:forParagraphSeparatorGlyphRange:atProposedOrigin:)`
- `getLineFragmentRect(_:usedRect:remaining:forStartingGlyphAt:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter:)`
- `hyphenCharacter(forGlyphAt:)`
- `hyphenationFactor(forGlyphAt:)`
- `shouldBreakLine(byHyphenatingBeforeCharacterAt:)`
- `shouldBreakLine(byWordBeforeCharacterAt:)`
- `willSetLineFragmentRect(_:forGlyphRange:usedRect:baselineOffset:)`
- `setHardInvalidation(_:forGlyphRange:)`

### Interfacing with Glyph Storage

- `characterRange(forGlyphRange:actualGlyphRange:)`
- `glyphRange(forCharacterRange:actualCharacterRange:)`
- `setAttachmentSize(_:forGlyphRange:)`
- `setBidiLevels(_:forGlyphRange:)`
- `setDrawsOutsideLineFragment(_:forGlyphRange:)`
- `setLineFragmentRect(_:forGlyphRange:usedRect:baselineOffset:)`
- `setLocation(_:withAdvancements:forStartOfGlyphRange:)`
- `setNotShownAttribute(_:forGlyphRange:)`

### Deprecated

- `actionForControlCharacter(at:)`
- `deleteGlyphs(in:)`
- `substituteGlyphs(in:withGlyphs:)`
- `getGlyphs(in:glyphs:characterIndexes:glyphInscriptions:elasticBits:bidiLevels:)`
- `insertGlyph(_:atGlyphIndex:characterIndex:)`
- `NSTypesetterControlCharacterAction`

## See Also

- `NSTextStorage`
- `NSLayoutManager`
- `NSATSTypesetter`
