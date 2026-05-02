---
url: https://developer.apple.com/documentation/appkit/nsglyphinfo
framework: AppKit
category: TextKit
title: NSGlyphInfo
kind: class
captured: 2026-05-02
---

# NSGlyphInfo

A glyph attribute in an attributed string.

## Declaration

```swift
class NSGlyphInfo
```

### Overview

Glyphs are the graphic representations of characters, stored in a font, that the text system draws on a display or printed page. Before text can be laid out, the layout manager (<`NSLayoutManager`) generates a stream of glyphs, using the character and font information specified by the attributed string and contained in the font file. `NSGlyphInfo` represents a glyph attribute value (`NSGlyphInfoAttributeName`) in an attributed string (`NSAttributedString`) and provides a means to override the standard glyph generation process and substitute a specified glyph over the attribute’s range.

Glyph attributes are integer values that the layout manager uses to denote special handling for particular glyphs during rendering. `NSGlyphInfo` enables you to override a font’s built-in mapping from a Unicode character code to a corresponding glyph ID. Overriding the mapping allows you to specify a variant glyph for a given character if the font contains multiple variations for that character or to specify a glyph that doesn’t have a standard mapping (such as some ligature glyphs).





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSSecureCoding`

## Availability

- macOS ?

## Topics

### Creating a glyph info object

- `init(cgGlyph:for:baseString:)`

### Getting information about a glyph info object

- `baseString`
- `glyphID`

### Deprecated

- `init(characterIdentifier:collection:baseString:)`
- `init(glyph:forFont:baseString:)`
- `init(glyphName:forFont:baseString:)`
- `characterIdentifier`
- `characterCollection`
- `glyphName`
- `NSCharacterCollection`

### Initializers

- `init(CGGlyph:forFont:baseString:)`
- `init(coder:)`
- `init(glyph:for:baseString:)`
- `init(glyphName:for:baseString:)`

### Default Implementations

- `NSGlyphInfo Implementations`

## See Also

- `NSGlyph`
- `NSGlyphStorage`
- `NSGlyphGenerator`
- `Reserved Glyph Codes`
- `NSFontRenderingMode`
