---
url: https://developer.apple.com/documentation/appkit/nstextattachmentviewprovider
framework: AppKit
category: TextKit
title: NSTextAttachmentViewProvider
kind: class
captured: 2026-05-02
---

# NSTextAttachmentViewProvider

A container object that associates a text attachment at a particular document location with a view object.

## Declaration

```swift
class NSTextAttachmentViewProvider
```

### Overview

Use `NSTextAttachmentViewProvider` when you need to represent document locations in terms of an `NSTextLocation` or an `NSTextRange` or you want to support view-based text attachments. The view provider controls the view placement and layout without requiring view classes to be aware of the text attachment coordination using a `NSTextLayoutManager` in macOS 12 or iOS 15 and later.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 12.0

## Topics

### Initializing a text attachment view

- `init(textAttachment:parentView:textLayoutManager:location:)`

### Defining the contents

- `location`
- `textAttachment`
- `textLayoutManager`
- `tracksTextAttachmentViewBounds`
- `view`

### Defining a custom view hierarchy

- `loadView()`

### Determining the Attachment’s Bounds

- `attachmentBounds(for:location:textContainer:proposedLineFragment:position:)`

## See Also

- `NSTextAttachment`
- `NSAdaptiveImageGlyph`
- `NSTextAttachmentContainer`
- `NSTextAttachmentLayout`
- `NSTextAttachmentCell`
- `NSTextAttachmentCellProtocol`
