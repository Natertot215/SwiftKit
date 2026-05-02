---
url: https://developer.apple.com/documentation/appkit/nsaccessibilitylayoutitem
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibilityLayoutItem
kind: protocol
captured: 2026-05-02
---

# NSAccessibilityLayoutItem

A role-based protocol that declares the minimum interface necessary for an accessibility element to act as a layout item.

## Declaration

```swift
protocol NSAccessibilityLayoutItem : NSAccessibilityGroup
```

### Overview

Use this protocol when you want to create a layout item, a repositionable and resizeable item inside a layout area.

You can further enhance the adopting element by implementing any of the information properties or action methods that the `NSAccessibilityProtocol` protocol declares.

> **NOTE:**  Any class that adopts this protocol must implement all of its methods, and the required methods of any protocol it inherits from. The compiler may require you to override some methods that your ancestors have already implemented. Simply follow the compiler’s warnings, and reimplement these methods as necessary.





## Relationships

**Inherits From**: `NSAccessibilityElementProtocol`, `NSAccessibilityGroup`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Supporting Accessibility

- `setAccessibilityFrame(_:)`

## See Also

- `NSAccessibilityLayoutArea`
