---
url: https://developer.apple.com/documentation/appkit/nsaccessibilitylayoutarea
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibilityLayoutArea
kind: protocol
captured: 2026-05-02
---

# NSAccessibilityLayoutArea

A role-based protocol that declares the minimum interface necessary for an accessibility element to act as a layout area.

## Declaration

```swift
protocol NSAccessibilityLayoutArea : NSAccessibilityGroup
```

### Overview

Use this protocol when you want to create a canvas that contains layout items.

You can further enhance the adopting element by implementing any of the information properties or action methods that the `NSAccessibilityProtocol` protocol declares.

> **NOTE:**  Any class that adopts this protocol must implement all of its methods, and the required methods of any protocol it inherits from. The compiler may require you to override some methods that your ancestors have already implemented. Simply follow the compiler’s warnings, and reimplement these methods as necessary.





## Relationships

**Inherits From**: `NSAccessibilityElementProtocol`, `NSAccessibilityGroup`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Supporting Accessibility

- `accessibilityChildren()`
- `accessibilityFocusedUIElement`
- `accessibilityLabel()`
- `accessibilitySelectedChildren()`

## See Also

- `NSAccessibilityLayoutItem`
