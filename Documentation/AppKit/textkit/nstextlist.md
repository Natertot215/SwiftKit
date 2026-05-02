---
url: https://developer.apple.com/documentation/appkit/nstextlist
framework: AppKit
category: TextKit
title: NSTextList
kind: class
captured: 2026-05-02
---

# NSTextList

A section of text that forms a single list.

## Declaration

```swift
class NSTextList
```

### Overview

The visible elements of the list, including list markers, appear in the text as they do for lists created by hand. The list object, however, allows the list to be recognized as such by the text system. This enables automatic creation of markers and spacing. Text lists are used in HTML import and export.

Text lists appear as attributes on paragraphs, as part of the paragraph style. An `NSParagraphStyle` may have an array of text lists, representing the nested lists containing the paragraph, in order from outermost to innermost. For example, if list1 contains four paragraphs, the middle two of which are also in the inner list2, then the text lists array for the first and fourth paragraphs is (list1), while the text lists array for the second and third paragraphs is (list1, list2).

The methods implementing this are `NSParagraphStyle/textLists` on `NSParagraphStyle`, and `NSMutableParagraphStyle/textLists` on `NSMutableParagraphStyle`.

In addition, `NSAttributedString` has convenience methods for lists, such as `NSAttributedString/range(of:at:)-6um0x`, which determines the range covered by a list, and `NSAttributedString/itemNumber(in:at:)`, which determines the ordinal position within a list of a particular item.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSSecureCoding`

## Availability

- macOS 10.0

## Topics

### Creating a text list

- `init(coder:)`
- `init(markerFormat:options:)`
- `init(markerFormat:options:startingItemNumber:)`

### Working with markers

- `markerFormat`
- `NSTextList.MarkerFormat`
- `marker(forItemNumber:)`

### Getting list options

- `isOrdered`
- `listOptions`
- `NSTextList.Options`

### Managing item numbering

- `startingItemNumber`

### Constants

- `prependEnclosingMarker`

### Type Properties

- `includesTextListMarkers`

## See Also

- `NSParagraphStyle`
- `NSMutableParagraphStyle`
- `NSTextTab`
- `NSTextTable`
- `NSTextTableBlock`
- `NSTextBlock`
