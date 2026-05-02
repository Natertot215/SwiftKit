---
url: https://developer.apple.com/documentation/appkit/nstextinputclient
framework: AppKit
category: Text display
title: NSTextInputClient
kind: protocol
captured: 2026-05-02
---

# NSTextInputClient

A set of methods that text views need to implement to interact properly with the text input management system.

## Declaration

```swift
protocol NSTextInputClient
```

### Overview

To create another text view class, you can either subclass `NSTextView`, or subclass `NSView` and implement the `NSTextInputClient` protocol.

> **IMPORTANT:**  Methods specific to the `NSTextInputClient` protocol are intended for dealing with text input and generally aren’t suitable for other purposes.





## Relationships

**Inherited By**: `NSTextCheckingClient`

**Conforming Types**: `NSTextView`

## Availability

- macOS ?

## Topics

### Handling marked text

- `hasMarkedText()`
- `markedRange()`
- `selectedRange()`
- `setMarkedText(_:selectedRange:replacementRange:)`
- `unmarkText()`
- `validAttributesForMarkedText()`

### Storing text

- `attributedString()`
- `attributedSubstring(forProposedRange:actualRange:)`
- `insertText(_:replacementRange:)`

### Getting character coordinates

- `characterIndex(for:)`
- `firstRect(forCharacterRange:actualRange:)`
- `baselineDeltaForCharacter(at:)`
- `drawsVerticallyForCharacter(at:)`
- `fractionOfDistanceThroughGlyph(for:)`

### Placing content

- `documentVisibleRect`
- `unionRectInVisibleSelectedRange`
- `preferredTextAccessoryPlacement()`
- `windowLevel()`

### Binding keystrokes

- `doCommand(by:)`

### Supporting adaptive images

- `supportsAdaptiveImageGlyph`
- `insert(_:replacementRange:)`

## See Also

- `Adopting the system text cursor in custom text views`
- `NSTextInputContext`
- `NSTextAlternatives`
- `NSTextContent`
- `NSTextInsertionIndicator`
- `NSTextInsertionIndicator.DisplayMode`
- `NSTextInsertionIndicator.AutomaticModeOptions`
