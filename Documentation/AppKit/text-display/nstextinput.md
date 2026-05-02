---
url: https://developer.apple.com/documentation/appkit/nstextinput
framework: AppKit
category: Text display
title: NSTextInput
kind: protocol
captured: 2026-05-02
---

# NSTextInput

A set of methods that text views need to implement to interact properly with the text input management system.

## Declaration

```swift
protocol NSTextInput
```

### Overview

> **IMPORTANT:**  `NSTextInput` protocol is slated for deprecation. Please use the `NSTextInputClient` protocol instead.

`NSTextView` and its abstract superclass `NSText` are the only classes included in Cocoa that implement `NSTextInput`. To create another text view class, you can either subclass `NSTextView` (and not `NSText`, for historical reasons), or subclass `NSView` and implement the `NSTextInput` protocol.

> **IMPORTANT:**  Methods specific to the `NSTextInput` protocol are intended for dealing with text input and generally are not suitable for other purposes.





## Relationships

**Conforming Types**: `NSTextView`

## Availability

- macOS ?
