---
url: https://developer.apple.com/documentation/appkit/nstextelementprovider
framework: AppKit
category: TextKit
title: NSTextElementProvider
kind: protocol
captured: 2026-05-02
---

# NSTextElementProvider

A protocol the text content manager and its concrete subclasses conform to, which defines the interface for interacting with custom content types of a text document.

## Declaration

```swift
protocol NSTextElementProvider : NSObjectProtocol
```







## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSTextContentManager`, `NSTextContentStorage`

## Availability

- macOS 12.0

## Topics

### Accessing the range of the text element

- `documentRange`

### Accessing and updating the text

- `enumerateTextElements(from:options:using:)`
- `NSTextLayoutFragment.EnumerationOptions`
- `location(_:offsetBy:)`
- `replaceContents(in:with:)`

### Adjusting the range of the text element

- `adjustedRange(from:forEditingTextSelection:)`
- `offset(from:to:)`

### Controlling synchronization with the backing store

- `synchronizeToBackingStore(_:)`

## See Also

- `Enriching your text in text views`
- `NSTextParagraph`
- `NSTextListElement`
- `NSTextElement`
