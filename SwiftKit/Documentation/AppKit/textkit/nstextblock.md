---
url: https://developer.apple.com/documentation/appkit/nstextblock
framework: AppKit
category: TextKit
title: NSTextBlock
kind: class
captured: 2026-05-02
---

# NSTextBlock

A block of text laid out in a subregion of the text container.

## Declaration

```swift
class NSTextBlock
```

### Overview

A text block appears as an attribute of a paragraph, and as part of the paragraph style. The most important subclass of `NSTextBlock` is `NSTextTableBlock`, which represents a block of text that appears as a cell in a table. The table itself is a `NSTextTable` object. All `NSTextBlock` objects reference this table, which controls their sizing and positioning.





## Relationships

**Inherits From**: `NSObject`

**Inherited By**: `NSTextTable`, `NSTextTableBlock`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSSecureCoding`

## Availability

- macOS ?

## Topics

### Creating text blocks

- `init()`

### Working with dimensions of content

- `setValue(_:type:for:)`
- `value(for:)`
- `valueType(for:)`
- `setContentWidth(_:type:)`
- `contentWidth`
- `contentWidthValueType`
- `NSTextBlock.Dimension`
- `NSTextBlock.ValueType`

### Getting and setting margins, borders, and padding

- `setWidth(_:type:for:edge:)`
- `setWidth(_:type:for:)`
- `width(for:edge:)`
- `widthValueType(for:edge:)`
- `NSTextBlock.Layer`

### Getting and setting alignment

- `verticalAlignment`
- `NSTextBlock.VerticalAlignment`

### Working with color

- `backgroundColor`
- `setBorderColor(_:for:)`
- `setBorderColor(_:)`
- `borderColor(for:)`

### Determining size and position of a text block

- `rectForLayout(at:in:textContainer:characterRange:)`
- `boundsRect(forContentRect:in:textContainer:characterRange:)`

### Drawing colors and decorations

- `drawBackground(withFrame:in:characterRange:layoutManager:)`

### Initializers

- `init(coder:)`

## See Also

- `NSParagraphStyle`
- `NSMutableParagraphStyle`
- `NSTextTab`
- `NSTextList`
- `NSTextTable`
- `NSTextTableBlock`
