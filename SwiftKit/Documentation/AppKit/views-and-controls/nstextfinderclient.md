---
url: https://developer.apple.com/documentation/appkit/nstextfinderclient
framework: AppKit
category: Views and controls
title: NSTextFinderClient
kind: protocol
captured: 2026-05-02
---

# NSTextFinderClient

A set of methods implemented by objects that support searching using the `NSTextFinder` class and the in-window text find bar.

## Declaration

```swift
protocol NSTextFinderClient : NSObjectProtocol
```

### Overview

See `NSTextFinder` for details.





## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### String Searching

- `string`
- `string(at:effectiveRange:endsWithSearchBoundary:)`
- `stringLength()`

### Replacing Text

- `shouldReplaceCharacters(inRanges:with:)`
- `replaceCharacters(in:with:)`
- `didReplaceCharacters()`

### Selection Information

- `isSelectable`
- `allowsMultipleSelection`
- `firstSelectedRange`
- `selectedRanges`

### Text Edibility

- `isEditable`

### Determining and Displaying Text Locations

- `contentView(at:effectiveCharacterRange:)`
- `rects(forCharacterRange:)`
- `scrollRangeToVisible(_:)`
- `visibleCharacterRanges`

### Drawing Glyphs

- `drawCharacters(in:forContentView:)`

## See Also

- `NSTextFinder`
- `NSTextFinderBarContainer`
