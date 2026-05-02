---
url: https://developer.apple.com/documentation/appkit/nstextattachmentcellprotocol
framework: AppKit
category: TextKit
title: NSTextAttachmentCellProtocol
kind: protocol
captured: 2026-05-02
---

# NSTextAttachmentCellProtocol

A set of methods that declares the interface for objects that draw text attachment icons and handle mouse events on their icons.

## Declaration

```swift
protocol NSTextAttachmentCellProtocol : NSObjectProtocol
```

### Overview

With the exceptions of `NSTextAttachmentCellProtocol/cellBaselineOffset()`, `NSTextAttachmentCellProtocol/attachment`, and `NSTextAttachmentCellProtocol/attachment`, all of these methods are implemented by the `NSCell` class.For general information on text attachments, see `NSAttributedString` and `NSTextView`.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSTextAttachmentCell`

## Availability

- macOS ?

## Topics

### Setting the attachment

- `attachment`
- `attachment`

### Drawing the cell contents

- `draw(withFrame:in:)`
- `draw(withFrame:in:characterIndex:)`
- `draw(withFrame:in:characterIndex:layoutManager:)`
- `highlight(_:withFrame:in:)`

### Providing the cell metrics

- `cellSize()`
- `cellBaselineOffset()`
- `cellFrame(for:proposedLineFragment:glyphPosition:characterIndex:)`

### Responding to mouse events

- `wantsToTrackMouse()`
- `wantsToTrackMouse(for:in:of:atCharacterIndex:)`
- `trackMouse(with:in:of:untilMouseUp:)`
- `trackMouse(with:in:of:atCharacterIndex:untilMouseUp:)`

## See Also

- `NSTextAttachment`
- `NSTextAttachmentViewProvider`
- `NSAdaptiveImageGlyph`
- `NSTextAttachmentContainer`
- `NSTextAttachmentLayout`
- `NSTextAttachmentCell`
