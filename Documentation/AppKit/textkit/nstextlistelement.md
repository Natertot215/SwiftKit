---
url: https://developer.apple.com/documentation/appkit/nstextlistelement
framework: AppKit
category: TextKit
title: NSTextListElement
kind: class
captured: 2026-05-02
---

# NSTextListElement

A class that represents a text list node.

## Declaration

```swift
class NSTextListElement
```







## Relationships

**Inherits From**: `NSTextParagraph`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 13.0

## Topics

### Create a text list element

- `init(children:textList:nestingLevel:)`
- `init(contents:markerAttributes:textList:children:)`
- `init(parent:textList:contents:markerAttributes:children:)`

### Accessing the text elements

- `textList`
- `parent`
- `childElements`

### Accessing the text list’s attributes

- `markerAttributes`

### Accessing the formatted string data

- `attributedString`
- `contents`

### Initializers

- `init(childElements:textList:nestingLevel:)`
- `init(contents:markerAttributes:textList:childElements:)`
- `init(parentElement:textList:contents:markerAttributes:childElements:)`

## See Also

- `Enriching your text in text views`
- `NSTextParagraph`
- `NSTextElement`
- `NSTextElementProvider`
