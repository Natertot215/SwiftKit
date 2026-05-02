---
url: https://developer.apple.com/documentation/appkit/nsaccessibilitycheckbox
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibilityCheckBox
kind: protocol
captured: 2026-05-02
---

# NSAccessibilityCheckBox

A role-based protocol that declares the minimum interface necessary for an accessibility element to act as a checkbox.

## Declaration

```swift
protocol NSAccessibilityCheckBox : NSAccessibilityButton
```

### Overview

Use this protocol when you want a user interface element to behave like a checkbox—a control that toggles between an on state, an off state, and an optional mixed state—in the accessibility hierarchy.

You can further enhance the adopting element by implementing any of the information properties or action methods that the `NSAccessibilityProtocol` protocol declares.

> **NOTE:**  Any class that adopts this protocol must implement all of its methods, and the required methods of any protocol it inherits from. The compiler may require you to override some methods that your ancestors have already implemented. Simply follow the compiler’s warnings, and reimplement these methods as necessary.





## Relationships

**Inherits From**: `NSAccessibilityButton`, `NSAccessibilityElementProtocol`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Supporting Accessibility

- `accessibilityValue()`

## See Also

- `NSAccessibilityButton`
- `NSAccessibilityRadioButton`
- `NSAccessibilitySwitch`
