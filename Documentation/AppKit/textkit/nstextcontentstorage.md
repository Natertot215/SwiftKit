---
url: https://developer.apple.com/documentation/appkit/nstextcontentstorage
framework: AppKit
category: TextKit
title: NSTextContentStorage
kind: class
captured: 2026-05-02
---

# NSTextContentStorage

A concrete object for managing your view’s text content and generating the text elements necessary for layout.

## Declaration

```swift
class NSTextContentStorage
```

### Overview

An `NSTextContentStorage` object provides the backing store for a view that contains text. This object stores the text in an attributed string object, and defaults to using an `NSTextStorage` object. It also maps portions of the text to `NSTextElement` objects to organize the text into paragraphs, lists, and other common element types found in text content. During layout, TextKit uses these elements to lay out and render the text in your view.

The standard system views use an `NSTextContentStorage` object to manage their text content. When building a custom text view, use this type to store the text for your view. `NSTextContentStorage` works with an associated `NSTextLayoutManager` to lay out your view’s text. When someone inserts new text or edits the existing text, call the `NSTextContentManager/performEditingTransaction(_:)` method and use a block to modify the contents of the `NSTextContentStorage/attributedString` property. Wrapping your edits in an edit transaction lets the rest of the text system respond to those changes.

TextKit uses the abstract `NSTextLocation` protocol to identify locations within text. `NSTextContentStorage` manager provides its own implementation of this protocol to represent locations within its storage object. To get the start and end locations, access the object’s `NSTextElementProvider/documentRange` property and use them to create new location objects. If you provide your own implementation of the `NSTextLocation` protocol to manage locations in your content, subclass `NSTextContentManager` and implement your own storage object to support those locations.





## Relationships

**Inherits From**: `NSTextContentManager`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `NSSecureCoding`, `NSTextElementProvider`, `NSTextStorageObserving`, `Sendable`, `SendableMetatype`

## Availability

- macOS 12.0

## Topics

### Managing the stored text

- `attributedString`

### Accessing paragraphs

- `delegate`
- `NSTextContentStorageDelegate`

### Finding ranges, locations, and offsets

- `location(_:offsetBy:)`
- `offset(from:to:)`
- `adjustedRange(from:forEditingTextSelection:)`

### Managing text elements

- `textElement(for:)`
- `attributedString(for:)`

### Instance Properties

- `includesTextListMarkers`

## See Also

- `NSTextContentManager`
- `NSAttributedString`
- `NSMutableAttributedString`
