---
url: https://developer.apple.com/documentation/appkit/nstextattachment
framework: AppKit
category: TextKit
title: NSTextAttachment
kind: class
captured: 2026-05-02
---

# NSTextAttachment

The values for the attachment characteristics of attributed strings and related objects.

## Declaration

```swift
class NSTextAttachment
```

### Overview

The `NSAttributedString` class uses text attachment objects as the values for attachment attributes (stored in the attributed string under the `NSAttributedString/Key/attachment` key).

A text attachment object contains either an `NSData` object or an `FileWrapper` object, which in turn holds the contents of the attached file. The properties of this class configure the appearance of the text attachment in your interface. In macOS, the text attachment also uses a cell object that conforms to the `NSTextAttachmentCellProtocol` protocol to draw the image that represents the text and handles mouse events. For more information about text attachments, see the `NSAttributedString` and `NSTextView`.

In macOS 12 and iOS 15 and later, `NSTextAttachmentViewProvider` and `NSTextAttachmentLayout` provide additional capabilities to represent document locations in terms of an `NSTextLocation` or an `NSTextRange`, and provide support for view-based text attachments.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `Copyable`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `NSSecureCoding`, `NSTextAttachmentContainer`, `NSTextAttachmentLayout`

## Availability

- macOS 10.0

## Topics

### Initializing a text attachment

- `init(fileWrapper:)`
- `init(data:ofType:)`

### Defining the attachment’s contents

- `bounds`
- `contents`
- `fileType`
- `image`
- `fileWrapper`
- `allowsTextAttachmentView`
- `usesTextAttachmentView`
- `lineLayoutPadding`

### Setting the attachment cell

- `attachmentCell`

### Constants

- `Attachment Character`

### Convenience methods

- `registerViewProviderClass(_:forFileType:)`
- `textAttachmentViewProviderClass(forFileType:)`

### Initializers

- `init(coder:)`

## See Also

- `NSTextAttachmentViewProvider`
- `NSAdaptiveImageGlyph`
- `NSTextAttachmentContainer`
- `NSTextAttachmentLayout`
- `NSTextAttachmentCell`
- `NSTextAttachmentCellProtocol`
