---
url: https://developer.apple.com/documentation/appkit/nsglyphstorage
framework: AppKit
category: TextKit
title: NSGlyphStorage
kind: protocol
captured: 2026-05-02
---

# NSGlyphStorage

A set of methods that a glyph storage object must implement to interact properly with `NSGlyphGenerator`.

## Declaration

```swift
protocol NSGlyphStorage
```

### Overview

An example of a class that conforms to the `NSGlyphStorage` protocol is `NSLayoutManager`.





## Relationships

**Conforming Types**: `NSLayoutManager`

## Availability

- macOS ?

## Topics

### Returning text storage

- `attributedString()`

### Returning glyph display options

- `layoutOptions()`

### Modifying the glyph cache

- `insertGlyphs(_:length:forStartingGlyphAt:characterIndex:)`
- `setIntAttribute(_:value:forGlyphAt:)`

### Constants

- `Layout Options`

## See Also

- `NSGlyph`
- `NSGlyphGenerator`
- `NSGlyphInfo`
- `Reserved Glyph Codes`
- `NSFontRenderingMode`
