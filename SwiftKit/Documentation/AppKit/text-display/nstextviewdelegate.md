---
url: https://developer.apple.com/documentation/appkit/nstextviewdelegate
framework: AppKit
category: Text display
title: NSTextViewDelegate
kind: protocol
captured: 2026-05-02
---

# NSTextViewDelegate

A set of optional methods that text view delegates can use to manage selection, set text attributes, work with the spell checker, and more.

## Declaration

```swift
protocol NSTextViewDelegate : NSTextDelegate
```







## Relationships

**Inherits From**: `NSObjectProtocol`, `NSTextDelegate`

**Conforming Types**: `NSOutlineView`, `NSTableView`

## Availability

- macOS ?

## Topics

### Accessing Text System Objects

- `undoManager(for:)`

### Controlling Display

- `textView(_:willDisplayToolTip:forCharacterAt:)`

### Supporting Quick Look

- `textView(_:urlForContentsOf:at:)`

### Managing the Selection

- `textView(_:willChangeSelectionFromCharacterRange:toCharacterRange:)`
- `textView(_:willChangeSelectionFromCharacterRanges:toCharacterRanges:)`
- `textViewDidChangeSelection(_:)`
- `textView(_:candidates:forSelectedRange:)`
- `textView(_:candidatesForSelectedRange:)`
- `textView(_:shouldSelectCandidateAt:)`
- `textView(_:shouldUpdateTouchBarItemIdentifiers:)`

### Managing the Pasteboard

- `textView(_:writablePasteboardTypesFor:at:)`
- `textView(_:write:at:to:type:)`

### Setting Text Attributes

- `textView(_:shouldChangeTextIn:replacementString:)`
- `textView(_:shouldChangeTextInRanges:replacementStrings:)`
- `textView(_:shouldChangeTypingAttributes:toAttributes:)`
- `textViewDidChangeTypingAttributes(_:)`

### Clicking and Pasting

- `textView(_:clickedOn:in:at:)`
- `textView(_:doubleClickedOn:in:at:)`
- `textView(_:clickedOnLink:at:)`

### Working With the Spelling Checker

- `textView(_:shouldSetSpellingState:range:)`
- `textView(_:willCheckTextIn:options:types:)`
- `textView(_:didCheckTextIn:types:options:results:orthography:wordCount:)`

### Responding to writing tools interactions

- `textViewWritingToolsWillBegin(_:)`
- `textViewWritingToolsDidEnd(_:)`
- `textView(_:writingToolsIgnoredRangesInEnclosingRange:)`

### Dragging

- `textView(_:draggedCell:in:event:at:)`

### Completing text

- `textView(_:completions:forPartialWordRange:indexOfSelectedItem:)`

### Displaying the sharing service picker

- `textView(_:willShow:forItems:)`

### Performing Commands

- `textView(_:doCommandBy:)`

### Contextual Menu Management

- `textView(_:menu:for:at:)`

## See Also

- `NSTextField`
- `NSTextFieldDelegate`
- `NSTextView`
- `NSTextDelegate`
- `NSText`
