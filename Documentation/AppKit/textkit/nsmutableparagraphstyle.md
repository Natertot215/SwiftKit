---
url: https://developer.apple.com/documentation/appkit/nsmutableparagraphstyle
framework: AppKit
category: TextKit
title: NSMutableParagraphStyle
kind: class
captured: 2026-05-02
---

# NSMutableParagraphStyle

An object for changing the values of the subattributes in a paragraph style attribute.

## Declaration

```swift
class NSMutableParagraphStyle
```

### Overview

The `NSMutableParagraphStyle` class adds methods to its superclass, `NSParagraphStyle`, for changing the values of the subattributes in a paragraph style attribute. For more information, see `NSParagraphStyle` and `NSAttributedString`.

> **IMPORTANT:**  Don’t mutate a paragraph style object after adding it to an attributed string. Doing so can cause your app to crash.





## Relationships

**Inherits From**: `NSParagraphStyle`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSMutableCopying`, `NSObjectProtocol`, `NSSecureCoding`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.0

## Topics

### Setting style information

- `setParagraphStyle(_:)`
- `alignment`
- `firstLineHeadIndent`
- `headIndent`
- `tailIndent`
- `lineHeightMultiple`
- `maximumLineHeight`
- `minimumLineHeight`
- `lineSpacing`
- `paragraphSpacing`
- `paragraphSpacingBefore`
- `baseWritingDirection`

### Specifying tab information

- `addTabStop(_:)`
- `removeTabStop(_:)`
- `tabStops`
- `defaultTabInterval`

### Setting text blocks and lists

- `textBlocks`
- `textLists`

### Setting line-break information

- `lineBreakMode`
- `lineBreakStrategy`
- `hyphenationFactor`
- `usesDefaultHyphenation`
- `tighteningFactorForTruncation`
- `allowsDefaultTighteningForTruncation`

### Setting HTML header level

- `headerLevel`

## See Also

- `NSParagraphStyle`
- `NSTextTab`
- `NSTextList`
- `NSTextTable`
- `NSTextTableBlock`
- `NSTextBlock`
