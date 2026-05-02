---
url: https://developer.apple.com/documentation/appkit/nsatstypesetter
framework: AppKit
category: TextKit
title: NSATSTypesetter
kind: class
captured: 2026-05-02
---

# NSATSTypesetter

A concrete typesetter object that places glyphs during the text layout process.

## Declaration

```swift
class NSATSTypesetter
```

### Overview

An `NSATSTypesetter` object creates line fragment rectangles, positions glyphs within the line fragments, determines line breaks by word wrapping and hyphenation, and handles tab positioning. This object encapsulates the advanced typesetting capabilities of Core Text. `NSATSTypesetter` provides line and character spacing accuracy and supports many languages, including bidirectional languages.

> **NOTE:**  Use this class with `NSLayoutManager` in macOS11 and earlier. In macOS12 and later, consider using `NSTextLayoutManager` which provides improved support for international scripts.





## Relationships

**Inherits From**: `NSTypesetter`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Getting the shared typesetter object

- `shared`

### Accessing the layout manager

- `layoutManager`
- `usesFontLeading`
- `typesetterBehavior`
- `hyphenationFactor`
- `bidiProcessingEnabled`

### Getting the text container

- `currentTextContainer`
- `lineFragmentPadding`

### Performing font substitution

- `substituteFont(for:)`

### Getting the location of text tabs

- `textTab(forGlyphLocation:writingDirection:maxLocation:)`

### Accessing paragraph information

- `attributedString`
- `setParagraphGlyphRange(_:separatorGlyphRange:)`
- `paragraphGlyphRange`
- `paragraphSeparatorGlyphRange`

### Laying out a paragraph

- `layoutParagraph(at:)`

### Getting Spacing Information

- `lineSpacing(afterGlyphAt:withProposedLineFragmentRect:)`
- `paragraphSpacing(afterGlyphAt:withProposedLineFragmentRect:)`
- `paragraphSpacing(beforeGlyphAt:withProposedLineFragmentRect:)`

### Laying Out Glyphs

- `boundingBox(forControlGlyphAt:for:proposedLineFragment:glyphPosition:characterIndex:)`
- `getLineFragmentRect(_:usedRect:forParagraphSeparatorGlyphRange:atProposedOrigin:)`
- `hyphenCharacter(forGlyphAt:)`
- `hyphenationFactor(forGlyphAt:)`
- `shouldBreakLine(byHyphenatingBeforeCharacterAt:)`
- `shouldBreakLine(byWordBeforeCharacterAt:)`
- `willSetLineFragmentRect(_:forGlyphRange:usedRect:baselineOffset:)`
- `setHardInvalidation(_:forGlyphRange:)`

### Deprecated

- `getGlyphs(in:glyphs:characterIndexes:glyphInscriptions:elasticBits:)`

## See Also

- `NSTextStorage`
- `NSLayoutManager`
- `NSTypesetter`
