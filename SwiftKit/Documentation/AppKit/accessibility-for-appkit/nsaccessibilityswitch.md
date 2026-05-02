---
url: https://developer.apple.com/documentation/appkit/nsaccessibilityswitch
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibilitySwitch
kind: protocol
captured: 2026-05-02
---

# NSAccessibilitySwitch

A role-based protocol that declares the minimum interface necessary for an accessibility element to act as a switch.

## Declaration

```swift
protocol NSAccessibilitySwitch : NSAccessibilityButton
```

### Overview

Use this protocol when you want a user interface element to behave like a switch—a control that toggles between an on state and an off state—in the accessibility hierarchy.

You can further enhance the adopting element by implementing any of the information properties or action methods that the `NSAccessibilityProtocol` protocol declares.

> **NOTE:**  Any class that adopts this protocol must implement all of its methods, and the required methods of any protocol it inherits from. The compiler may require you to override some methods that your ancestors have already implemented. Simply follow the compiler’s warnings, and reimplement these methods as necessary.





## Relationships

**Inherits From**: `NSAccessibilityButton`, `NSAccessibilityElementProtocol`, `NSObjectProtocol`

**Conforming Types**: `NSSwitch`

## Availability

- macOS ?

## Topics

### Supporting Accessibility

- `accessibilityPerformDecrement()`
- `accessibilityPerformIncrement()`
- `accessibilityValue()`

## See Also

- `NSAccessibilityButton`
- `NSAccessibilityRadioButton`
- `NSAccessibilityCheckBox`
