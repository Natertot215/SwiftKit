---
url: https://developer.apple.com/documentation/appkit/nsglyphgenerator
framework: AppKit
category: TextKit
title: NSGlyphGenerator
kind: class
captured: 2026-05-02
---

# NSGlyphGenerator

An object that performs the initial, nominal glyph generation phase in the layout process.

## Declaration

```swift
class NSGlyphGenerator
```

### Overview

The nominal glyph generation pass essentially generates one glyph per character; the typesetter may later make substitutions in the glyph stream, for example, changing an acute accent glyph followed by an “e” glyph into a single acute-accented “é” glyph.

`NSGlyphGenerator` communicates via the `NSGlyphStorage` protocol. An example of a class that conforms to the protocol is `NSLayoutManager`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Obtaining a glyph generator

- `shared`

### Generating glyphs

- `generateGlyphs(for:desiredNumberOfCharacters:glyphIndex:characterIndex:)`

## See Also

- `NSGlyph`
- `NSGlyphStorage`
- `NSGlyphInfo`
- `Reserved Glyph Codes`
- `NSFontRenderingMode`
