---
url: https://developer.apple.com/documentation/appkit/nsadaptiveimageglyph
framework: AppKit
category: TextKit
title: NSAdaptiveImageGlyph
kind: class
captured: 2026-05-02
---

# NSAdaptiveImageGlyph

A data object for an emoji-like image that can appear in attributed text.

## Declaration

```swift
class NSAdaptiveImageGlyph
```

### Overview

An `NSAdaptiveImageGlyph` contains an image that automatically adapts to different sizes and resolutions. The text system creates instances of this type to represent custom emojis that people create using the system interfaces. This type manages multiple images, along with metadata describing how to adapt those images correctly to different fonts and font attributes.

Typically, you receive new `NSAdaptiveImageGlyph` objects only from the text-input system. When someone creates a new emoji and inserts it into their text, TextKit creates an instance of this type to represent it. If your app examines or changes the attributes of attributed strings, preserve the `NSAttributedString/Key/adaptiveImageGlyph` attribute when making any changes. For example, if you filter unknown attributes in a custom text-storage object, update your code to preserve this attribute. The value of the attribute is an `NSAdaptiveImageGlyph` containing the emoji data. You can save the image data with the rest of your content and use the data to recreate the type later.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CTAdaptiveImageProviding`, `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSSecureCoding`, `Sendable`, `SendableMetatype`

## Availability

- macOS 15.0

## Topics

### Creating an adaptive image glyph

- `init(imageContent:)`
- `init(coder:)`

### Getting the image data

- `imageContent`

### Getting the content metadata

- `contentIdentifier`
- `contentDescription`
- `contentType`

### Initializers

- `init(_:)`

## See Also

- `NSTextAttachment`
- `NSTextAttachmentViewProvider`
- `NSTextAttachmentContainer`
- `NSTextAttachmentLayout`
- `NSTextAttachmentCell`
- `NSTextAttachmentCellProtocol`
