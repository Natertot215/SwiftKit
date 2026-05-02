---
url: https://developer.apple.com/documentation/appkit/nstexttab
framework: AppKit
category: TextKit
title: NSTextTab
kind: class
captured: 2026-05-02
---

# NSTextTab

A tab in a paragraph.

## Declaration

```swift
class NSTextTab
```

### Overview

A text tab represents a tab in an `NSParagraphStyle` object, storing an alignment type and location. `NSTextTab` objects are most frequently used with the TextKit system and with `NSRulerView` and `NSRulerMarker` objects.

The text system supports four alignment types: left, center, right, and decimal (based on the decimal separator character of the locale in effect). These alignment types are absolute, not based on the line sweep direction of text. For example, tabbed text is always positioned to the left of a right-aligned tab, whether the line sweep direction is left to right or right to left. A tab’s location, on the other hand, is relative to the back margin. A tab set at 1.5”, for example, is at 1.5” from the right in right to left text.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSSecureCoding`

## Availability

- macOS 10.0

## Topics

### Creating a text tab

- `init(textAlignment:location:options:)`

### Getting tab stop information

- `location`

### Getting text tab information

- `alignment`
- `options`
- `columnTerminators(for:)`

### Constants

- `NSParagraphStyle.TextTabType`
- `NSTextTab.OptionKey`

### Deprecated

- `init(type:location:)`
- `tabStopType`

### Initializers

- `init(coder:)`

## See Also

- `NSParagraphStyle`
- `NSMutableParagraphStyle`
- `NSTextList`
- `NSTextTable`
- `NSTextTableBlock`
- `NSTextBlock`
