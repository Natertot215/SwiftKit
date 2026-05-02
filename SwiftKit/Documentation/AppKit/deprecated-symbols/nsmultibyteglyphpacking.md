---
url: https://developer.apple.com/documentation/appkit/nsmultibyteglyphpacking
framework: AppKit
category: Deprecated symbols
title: NSMultibyteGlyphPacking
kind: enum
captured: 2026-05-02
---

# NSMultibyteGlyphPacking

A constant for glyph packing.

## Declaration

```swift
enum NSMultibyteGlyphPacking
```

### Overview

Cocoa stores all text data as Unicode. The text system converts Unicode into glyph IDs and places them in 1-, 2-, or 4-byte storage depending on the context. To render text, you must convert the storage into a format the text engine understands. The following constants describe the glyph packing schemes the text rendering engine can use. They are used to extract glyphs from a font for making a multibyte (or single-byte) array of glyphs for passing to an interpreter, such as the window server, which expects a big-endian multibyte stream (that is, “packed glyphs”) instead of a pure `NSGlyph` stream. They’re used by `glyphPacking`. With Quartz, the engine always expects the format to be in 2-byte short array, so `NSNativeShortGlyphPacking` is the only format currently in use.





## Relationships

**Conforms To**: `BitwiseCopyable`, `Equatable`, `Hashable`, `RawRepresentable`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.0 (deprecated 10.13)

## Topics

### Packing Options

- `NSMultibyteGlyphPacking.nativeShortGlyphPacking`

### Initializers

- `init(rawValue:)`

## See Also

- `Glyph Attributes`
- `NSOpenGLGlobalOption`
- `Data Entry Types`
- `Anonymous`
- `Additional Writing Directions`
- `Return values for modal operations`
- `Tags of Views in the FontPanel`
