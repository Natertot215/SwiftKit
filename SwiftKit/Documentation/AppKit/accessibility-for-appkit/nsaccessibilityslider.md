---
url: https://developer.apple.com/documentation/appkit/nsaccessibilityslider
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibilitySlider
kind: protocol
captured: 2026-05-02
---

# NSAccessibilitySlider

A role-based protocol that declares the minimum interface necessary for an accessibility element to act as a slider.

## Declaration

```swift
protocol NSAccessibilitySlider : NSAccessibilityElementProtocol
```

### Overview

Use this protocol when you want a user interface element to behave like a slider—a control that represents a continuous range of numerical values with a knob that represents the currently selected value—in the accessibility hierarchy.

You can further enhance the adopting element by implementing any of the information properties or action methods that the `NSAccessibilityProtocol` protocol declares.

> **NOTE:**  Any class that adopts this protocol must implement all of its methods, and the required methods of any protocol it inherits from. The compiler may require you to override some methods that your ancestors have already implemented. Simply follow the compiler’s warnings, and reimplement these methods as necessary.





## Relationships

**Inherits From**: `NSAccessibilityElementProtocol`, `NSObjectProtocol`

**Conforming Types**: `NSSlider`

## Availability

- macOS ?

## Topics

### Supporting Accessibility

- `accessibilityLabel()`
- `accessibilityPerformDecrement()`
- `accessibilityPerformIncrement()`
- `accessibilityValue()`

## See Also

- `NSAccessibilityStepper`
