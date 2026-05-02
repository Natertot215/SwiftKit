---
url: https://developer.apple.com/documentation/appkit/nsparagraphstyle
framework: AppKit
category: TextKit
title: NSParagraphStyle
kind: class
captured: 2026-05-02
---

# NSParagraphStyle

The paragraph or ruler attributes for an attributed string.

## Declaration

```swift
class NSParagraphStyle
```

### Overview

An `NSParagraphStyle` object stores formatting information for a paragraph of text. The formatting information includes the amount of space between lines, indentations for lines of text, line heights, tab-stop positions, and more. Apply paragraph styles to the text of an attributed string by adding the `NSAttributedString/Key/paragraphStyle` attribute and setting its value to an instance of this class. The text-rendering system uses the paragraph style information in an attributed string to lay out and render the text.

The `NSParagraphStyle` class manages an immutable set of style information, but you can create an `NSMutableParagraphStyle` when you want to modify the style information before applying it to your text.





## Relationships

**Inherits From**: `NSObject`

**Inherited By**: `NSMutableParagraphStyle`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSMutableCopying`, `NSObjectProtocol`, `NSSecureCoding`

## Availability

- macOS 10.0

## Topics

### Creating a paragraph style

- `default`

### Accessing style information

- `alignment`
- `NSTextAlignment`
- `firstLineHeadIndent`
- `headIndent`
- `tailIndent`
- `lineHeightMultiple`
- `maximumLineHeight`
- `minimumLineHeight`
- `lineSpacing`
- `paragraphSpacing`
- `paragraphSpacingBefore`

### Accessing tab information

- `tabStops`
- `NSParagraphStyle.TextTabType`
- `defaultTabInterval`

### Getting text block and list information

- `textBlocks`
- `textLists`

### Getting line-break information

- `lineBreakMode`
- `NSLineBreakMode`
- `lineBreakStrategy`
- `NSParagraphStyle.LineBreakStrategy`
- `hyphenationFactor`
- `usesDefaultHyphenation`
- `tighteningFactorForTruncation`
- `allowsDefaultTighteningForTruncation`

### Getting the html header level

- `headerLevel`

### Determining writing direction

- `defaultWritingDirection(forLanguage:)`
- `baseWritingDirection`
- `NSWritingDirection`

### Initializers

- `init(coder:)`

## See Also

- `NSMutableParagraphStyle`
- `NSTextTab`
- `NSTextList`
- `NSTextTable`
- `NSTextTableBlock`
- `NSTextBlock`
