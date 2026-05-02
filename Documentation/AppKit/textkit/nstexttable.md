---
url: https://developer.apple.com/documentation/appkit/nstexttable
framework: AppKit
category: TextKit
title: NSTextTable
kind: class
captured: 2026-05-02
---

# NSTextTable

An object that represents a text table as a whole.

## Declaration

```swift
class NSTextTable
```

### Overview

A text table is responsible for laying out and drawing the text table blocks it contains, and it maintains the basic parameters of the table.





## Relationships

**Inherits From**: `NSTextBlock`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSSecureCoding`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Getting and setting number of columns

- `numberOfColumns`

### Getting and setting layout algorithm

- `layoutAlgorithm`

### Collapsing borders

- `collapsesBorders`

### Hiding empty cells

- `hidesEmptyCells`

### Determining layout rectangles

- `rect(for:layoutAt:in:textContainer:characterRange:)`
- `boundsRect(for:contentRect:in:textContainer:characterRange:)`

### Drawing the table

- `drawBackground(for:withFrame:in:characterRange:layoutManager:)`

### Constants

- `NSTextTable.LayoutAlgorithm`

## See Also

- `NSParagraphStyle`
- `NSMutableParagraphStyle`
- `NSTextTab`
- `NSTextList`
- `NSTextTableBlock`
- `NSTextBlock`
