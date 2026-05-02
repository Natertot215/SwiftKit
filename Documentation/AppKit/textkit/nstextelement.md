---
url: https://developer.apple.com/documentation/appkit/nstextelement
framework: AppKit
category: TextKit
title: NSTextElement
kind: class
captured: 2026-05-02
---

# NSTextElement

An abstract base class that represents the smallest units of text layout such as paragraphs or attachments.

## Declaration

```swift
class NSTextElement
```







## Relationships

**Inherits From**: `NSObject`

**Inherited By**: `NSTextParagraph`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 12.0

## Topics

### Creating a text element

- `init(textContentManager:)`

### Accessing the content manager

- `textContentManager`

### Accessing the text element range

- `elementRange`

### Accessing text elements

- `isRepresentedElement`
- `parent`
- `childElements`

## See Also

- `Enriching your text in text views`
- `NSTextParagraph`
- `NSTextListElement`
- `NSTextElementProvider`
