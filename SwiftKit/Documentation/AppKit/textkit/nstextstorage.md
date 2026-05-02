---
url: https://developer.apple.com/documentation/appkit/nstextstorage
framework: AppKit
category: TextKit
title: NSTextStorage
kind: class
captured: 2026-05-02
---

# NSTextStorage

The fundamental storage mechanism of TextKit that contains the text managed by the system.

## Declaration

```swift
class NSTextStorage
```

### Overview

`NSTextStorage` is a semi-concrete subclass of `NSMutableAttributedString` that adds behavior for managing a set of client `NSLayoutManager` objects. A text storage object notifies its layout managers of changes to its characters or attributes, which lets the layout managers redisplay the text as needed.

You can access a text storage object from any thread of your app, but your app must guarantee access from only one thread at a time.

In macOS, this class also defines properties for getting and setting scriptable attributes of `NSTextStorage` objects. Unless you’re dealing with scriptability, you shouldn’t access these properties directly. In particular, using the `NSTextStorage/characters`, `NSTextStorage/words`, or `NSTextStorage/paragraphs` properties is an inefficient way to manipulate the text storage, since accessing these properties involves the creation of many objects. Instead, use the text access methods defined by `NSMutableAttributedString`, `NSAttributedString`, `NSMutableString`, and `NSString` to perform character-level manipulation.

#### Subclassing Notes

The `NSTextStorage` class implements change management through the `NSMutableAttributedString/beginEditing()` and `NSMutableAttributedString/endEditing()` methods, as well as verification of attributes, delegate handling, and layout management notification. The one aspect it doesn’t implement is managing the actual attributed string storage, which subclasses manage by overriding the two `NSAttributedString` primitives:

- `NSAttributedString/string`
- `NSAttributedString/attributes(at:effectiveRange:)`

Subclasses must also override two `NSMutableAttributedString` primitives:

- `NSMutableAttributedString/replaceCharacters(in:with:)-6oq9r`
- `NSMutableAttributedString/setAttributes(_:range:)`

These primitives should perform the change, then call `NSTextStorage/edited(_:range:changeInLength:)` to let the parent class know there are changes.





## Relationships

**Inherits From**: `NSMutableAttributedString`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSMutableCopying`, `NSObjectProtocol`, `NSPasteboardReading`, `NSPasteboardWriting`, `NSSecureCoding`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.0

## Topics

### Processing the editing actions

- `delegate`
- `NSTextStorageDelegate`

### Accessing the layout managers

- `layoutManagers`
- `addLayoutManager(_:)`
- `removeLayoutManager(_:)`

### Managing edits

- `edited(_:range:changeInLength:)`
- `processEditing()`

### Fixing the string attributes

- `invalidateAttributes(in:)`
- `ensureAttributesAreFixed(in:)`
- `fixesAttributesLazily`

### Determining the nature of changes

- `editedMask`
- `editedRange`
- `changeInLength`

### Accessing scriptable properties

- `attributeRuns`
- `paragraphs`
- `words`
- `characters`
- `font`
- `foregroundColor`

### Constants

- `NSTextStorageEditActions`

### Notifications

- `willProcessEditingNotification`
- `didProcessEditingNotification`

### Accessing the storage controller

- `textStorageObserver`
- `NSTextStorageObserving`

## See Also

- `NSLayoutManager`
- `NSATSTypesetter`
- `NSTypesetter`
