---
url: https://developer.apple.com/documentation/appkit/nsaccessibilityoutline
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibilityOutline
kind: protocol
captured: 2026-05-02
---

# NSAccessibilityOutline

A role-based protocol that declares the minimum interface necessary for an accessibility element to act as an outline view.

## Declaration

```swift
protocol NSAccessibilityOutline : NSAccessibilityTable
```

### Overview

Use this protocol when you want a user interface element to behave like an outline—a view that uses a row-and-column format to display hierarchical data that can expand and collapse—in the accessibility hierarchy.

You can further enhance the adopting element by implementing any of the information properties or action methods that the `NSAccessibilityProtocol` protocol declares.

> **NOTE:**  Any class that adopts this protocol must implement all of its methods, and the required methods of any protocol it inherits from. The compiler may require you to override some methods that your ancestors have already implemented. Simply follow the compiler’s warnings, and reimplement these methods as necessary.

Although the `NSAccessibilityOutline` protocol doesn’t declare any methods, it does conform to the `NSAccessibilityTable` protocol. You may need to explicitly implement methods from any of the protocols that `NSAccessibilityOutline` conforms to.





## Relationships

**Inherits From**: `NSAccessibilityElementProtocol`, `NSAccessibilityGroup`, `NSAccessibilityTable`, `NSObjectProtocol`

**Conforming Types**: `NSOutlineView`

## Availability

- macOS ?



## See Also

- `NSAccessibilityTable`
- `NSAccessibilityList`
- `NSAccessibilityRow`
