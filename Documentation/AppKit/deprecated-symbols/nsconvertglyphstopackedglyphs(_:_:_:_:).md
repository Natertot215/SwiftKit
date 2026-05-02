---
url: https://developer.apple.com/documentation/appkit/nsconvertglyphstopackedglyphs(_:_:_:_:)
framework: AppKit
category: Deprecated symbols
title: NSConvertGlyphsToPackedGlyphs(_:_:_:_:)
kind: func
captured: 2026-05-02
---

# NSConvertGlyphsToPackedGlyphs(_:_:_:_:)

Prepares a set of glyphs for processing by character-based routines.

## Declaration

```swift
func NSConvertGlyphsToPackedGlyphs(_ glBuf: UnsafeMutablePointer<NSGlyph>, _ count: Int, _ packing: NSMultibyteGlyphPacking, _ packedGlyphs: UnsafeMutablePointer<CChar>) -> Int
```

### Discussion

This function takes a buffer of glyphs, specified in the `glBuf` parameter, and packs them into a condensed character array. The character array is returned in the `packedGlyphs` parameter, which should have enough space for at least ((4 * count) + 1) bytes to guarantee that the packed glyphs fit. `count` specifies the number of glyphs in `glBuf`. `packing` specifies how the glyphs are currently packed.







## Availability

- macOS 10.0 (deprecated 10.13)



## See Also

- `raiseBadArgumentException(_:_:_:)`
- `NSReleaseAlertPanel(_:)`
- `NSDisableScreenUpdates()`
- `NSEnableScreenUpdates()`
- `NSDrawColorTiledRects(_:_:_:_:_:)`
- `NSSetShowsServicesMenuItem(_:_:)`
- `NSCopyBits(_:_:_:)`
- `NSShowsServicesMenuItem(_:)`
- `NSDottedFrameRect(_:)`
- `NSReadPixel(_:)`
- `NSGetWindowServerMemory(_:_:_:_:)`
- `fileContentsType(forPathExtension:)`
- `fileNameType(forPathExtension:)`
- `representedPathExtension`
- `representedPathExtensions(from:)`
