---
url: https://developer.apple.com/documentation/appkit/nsaccessibilitylist
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibilityList
kind: protocol
captured: 2026-05-02
---

# NSAccessibilityList

A role-based protocol that declares the minimum interface necessary for an accessibility element to act as a list view.

## Declaration

```swift
protocol NSAccessibilityList : NSAccessibilityTable
```

### Overview

Use this protocol when you want a user interface element to behave like a list—a view that displays a set of related records in a single-column table—in the accessibility hierarchy.

You can further enhance the adopting element by implementing any of the information properties or action methods that the `NSAccessibilityProtocol` protocol declares.

> **NOTE:**  Any class that adopts this protocol must implement all of its methods, and the required methods of any protocol it inherits from. The compiler may require you to override some methods that your ancestors have already implemented. Simply follow the compiler’s warnings, and reimplement these methods as necessary.

Although the `NSAccessibilityList` protocol doesn’t declare any methods, it does conform to the `NSAccessibilityTable` protocol. You may need to explicitly implement methods from any of the protocols that `NSAccessibilityList` conforms to.





## Relationships

**Inherits From**: `NSAccessibilityElementProtocol`, `NSAccessibilityGroup`, `NSAccessibilityTable`, `NSObjectProtocol`

## Availability

- macOS ?



## See Also

- `NSAccessibilityTable`
- `NSAccessibilityOutline`
- `NSAccessibilityRow`
