---
url: https://developer.apple.com/documentation/appkit/nsaccessibilitystatictext
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibilityStaticText
kind: protocol
captured: 2026-05-02
---

# NSAccessibilityStaticText

A role-based protocol that declares the minimum interface necessary for an accessibility element to act as static text.

## Declaration

```swift
protocol NSAccessibilityStaticText : NSAccessibilityElementProtocol
```

### Overview

Use this protocol when you want to represent short pieces of text, such as headers or labels. For longer blocks of text, use the `NSAccessibilityNavigableStaticText` protocol.

You can further enhance the adopting element by implementing any of the information properties or action methods that the `NSAccessibilityProtocol` protocol declares.

> **NOTE:**  Any class that adopts this protocol must implement all of its methods, and the required methods of any protocol it inherits from. The compiler may require you to override some methods that your ancestors have already implemented. Simply follow the compiler’s warnings, and reimplement these methods as necessary.





## Relationships

**Inherits From**: `NSAccessibilityElementProtocol`, `NSObjectProtocol`

**Inherited By**: `NSAccessibilityNavigableStaticText`

**Conforming Types**: `NSComboBox`, `NSSearchField`, `NSSecureTextField`, `NSTextField`, `NSTextView`, `NSTokenField`

## Availability

- macOS ?

## Topics

### Supporting Accessibility

- `accessibilityAttributedString(for:)`
- `accessibilityValue()`
- `accessibilityVisibleCharacterRange()`

## See Also

- `NSAccessibilityNavigableStaticText`
