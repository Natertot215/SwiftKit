---
url: https://developer.apple.com/documentation/appkit/nstextattachmentlayout
framework: AppKit
category: TextKit
title: NSTextAttachmentLayout
kind: protocol
captured: 2026-05-02
---

# NSTextAttachmentLayout

A set of methods that defines the interface to attachment objects from a text layout manager.

## Declaration

```swift
protocol NSTextAttachmentLayout : NSObjectProtocol
```

### Overview

`The NSTextAttachmentLayout` protocol is the interface for working with attachment objects with an `NSTextAttachmentViewProvider` using a `NSTextLayoutManager` in macOS 12 and iOS 15 and later.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSTextAttachment`

## Availability

- macOS 12.0

## Topics

### Determining the characteristics of an attachment

- `attachmentBounds(for:location:textContainer:proposedLineFragment:position:)`
- `image(for:attributes:location:textContainer:)`
- `viewProvider(for:location:textContainer:)`

## See Also

- `NSTextAttachment`
- `NSTextAttachmentViewProvider`
- `NSAdaptiveImageGlyph`
- `NSTextAttachmentContainer`
- `NSTextAttachmentCell`
- `NSTextAttachmentCellProtocol`
