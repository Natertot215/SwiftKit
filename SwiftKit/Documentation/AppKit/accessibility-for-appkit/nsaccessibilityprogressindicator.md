---
url: https://developer.apple.com/documentation/appkit/nsaccessibilityprogressindicator
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibilityProgressIndicator
kind: protocol
captured: 2026-05-02
---

# NSAccessibilityProgressIndicator

A role-based protocol that declares the minimum interface necessary for an accessibility element to act as a progress indicator.

## Declaration

```swift
protocol NSAccessibilityProgressIndicator : NSAccessibilityGroup
```

### Overview

Use this protocol when you want a user interface element to behave like a progress indicator—a view that provides visual feedback to the user about the status of an ongoing task—in the accessibility hierarchy.

You can further enhance the adopting element by implementing any of the information properties or action methods that the `NSAccessibilityProtocol` protocol declares.

> **NOTE:**  Any class that adopts this protocol must implement all of its methods, and the required methods of any protocol it inherits from. The compiler may require you to override some methods that your ancestors have already implemented. Simply follow the compiler’s warnings, and reimplement these methods as necessary.





## Relationships

**Inherits From**: `NSAccessibilityElementProtocol`, `NSAccessibilityGroup`, `NSObjectProtocol`

**Conforming Types**: `NSProgressIndicator`

## Availability

- macOS ?

## Topics

### Supporting Accessibility

- `accessibilityValue()`

## See Also

- `NSAccessibilityElementLoading`
