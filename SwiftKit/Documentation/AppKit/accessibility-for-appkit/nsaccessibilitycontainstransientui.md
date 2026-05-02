---
url: https://developer.apple.com/documentation/appkit/nsaccessibilitycontainstransientui
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibilityContainsTransientUI
kind: protocol
captured: 2026-05-02
---

# NSAccessibilityContainsTransientUI

A role-based protocol that declares the minimum interface necessary for an accessibility element to support dynamic UI changes.

## Declaration

```swift
protocol NSAccessibilityContainsTransientUI : NSAccessibilityElementProtocol
```

### Overview

Use this protocol to support accessibility in a UI that changes dynamically—usually in response to mouse-hover events.

Use this protocol in addition to another role-based protocol. See `custom-controls`.

> **NOTE:**  Any class that adopts this protocol must implement all of its methods, and the required methods of any protocol it inherits from. The compiler may require you to override some methods that your ancestors have already implemented. Simply follow the compiler’s warnings, and reimplement these methods as necessary.





## Relationships

**Inherits From**: `NSAccessibilityElementProtocol`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Supporting Accessibility

- `accessibilityPerformShowAlternateUI()`
- `accessibilityPerformShowDefaultUI()`
- `isAccessibilityAlternateUIVisible()`
