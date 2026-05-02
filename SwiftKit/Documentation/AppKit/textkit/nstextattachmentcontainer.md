---
url: https://developer.apple.com/documentation/appkit/nstextattachmentcontainer
framework: AppKit
category: TextKit
title: NSTextAttachmentContainer
kind: protocol
captured: 2026-05-02
---

# NSTextAttachmentContainer

A set of methods that defines the interface to text attachment objects from a layout manager.

## Declaration

```swift
protocol NSTextAttachmentContainer : NSObjectProtocol
```







## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSTextAttachment`

## Availability

- macOS 10.11

## Topics

### Getting the bounds

- `attachmentBounds(for:proposedLineFragment:glyphPosition:characterIndex:)`

### Getting the image

- `image(forBounds:textContainer:characterIndex:)`

## See Also

- `NSTextAttachment`
- `NSTextAttachmentViewProvider`
- `NSAdaptiveImageGlyph`
- `NSTextAttachmentLayout`
- `NSTextAttachmentCell`
- `NSTextAttachmentCellProtocol`
