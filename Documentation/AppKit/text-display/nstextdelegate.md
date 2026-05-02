---
url: https://developer.apple.com/documentation/appkit/nstextdelegate
framework: AppKit
category: Text display
title: NSTextDelegate
kind: protocol
captured: 2026-05-02
---

# NSTextDelegate

A set of optional methods implemented by the delegate of an `NSText` object to edit text and change text formats.

## Declaration

```swift
protocol NSTextDelegate : NSObjectProtocol
```







## Relationships

**Inherits From**: `NSObjectProtocol`

**Inherited By**: `NSTextViewDelegate`

**Conforming Types**: `NSOutlineView`, `NSTableView`

## Availability

- macOS ?

## Topics

### Changing text formatting

- `textDidChange(_:)`

### Editing text

- `textShouldBeginEditing(_:)`
- `textDidBeginEditing(_:)`
- `textShouldEndEditing(_:)`
- `textDidEndEditing(_:)`

## See Also

- `NSTextField`
- `NSTextFieldDelegate`
- `NSTextView`
- `NSTextViewDelegate`
- `NSText`
