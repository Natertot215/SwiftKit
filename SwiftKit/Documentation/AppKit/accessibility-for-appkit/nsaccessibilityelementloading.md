---
url: https://developer.apple.com/documentation/appkit/nsaccessibilityelementloading
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibilityElementLoading
kind: protocol
captured: 2026-05-02
---

# NSAccessibilityElementLoading

A role-based protocol that declares the minimum interface necessary for an accessibility element to support loading.

## Declaration

```swift
protocol NSAccessibilityElementLoading : NSObjectProtocol
```

### Overview

You can further enhance the adopting element by implementing any of the information properties or action methods that the `NSAccessibilityProtocol` protocol declares.

> **NOTE:**  Any class that adopts this protocol must implement all of its methods, and the required methods of any protocol it inherits from. The compiler may require you to override some methods that your ancestors have already implemented. Simply follow the compiler’s warnings, and reimplement these methods as necessary.





## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS 10.13

## Topics

### Supporting Accessibility

- `accessibilityElement(withToken:)`
- `accessibilityRangeInTargetElement(withToken:)`
- `NSAccessibilityLoadingToken`

## See Also

- `NSAccessibilityProgressIndicator`
