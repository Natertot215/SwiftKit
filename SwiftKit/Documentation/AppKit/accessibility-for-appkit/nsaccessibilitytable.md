---
url: https://developer.apple.com/documentation/appkit/nsaccessibilitytable
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibilityTable
kind: protocol
captured: 2026-05-02
---

# NSAccessibilityTable

A role-based protocol that declares the minimum interface necessary for an accessibility element to act as a table view.

## Declaration

```swift
protocol NSAccessibilityTable : NSAccessibilityGroup
```

### Overview

Use this protocol when you want a user interface element to behave like a table—a view that uses a row-and-column format to display a set of related records and their attributes—in the accessibility hierarchy.

You can further enhance the adopting element by implementing any of the information properties or action methods that the `NSAccessibilityProtocol` protocol declares.

> **NOTE:**  Any class that adopts this protocol must implement all of its methods, and the required methods of any protocol it inherits from. The compiler may require you to override some methods that your ancestors have already implemented. Simply follow the compiler’s warnings, and reimplement these methods as necessary.





## Relationships

**Inherits From**: `NSAccessibilityElementProtocol`, `NSAccessibilityGroup`, `NSObjectProtocol`

**Inherited By**: `NSAccessibilityList`, `NSAccessibilityOutline`

**Conforming Types**: `NSOutlineView`, `NSTableView`

## Availability

- macOS ?

## Topics

### Supporting Accessibility

- `accessibilityColumnHeaderUIElements()`
- `accessibilityColumns()`
- `accessibilityLabel()`
- `accessibilityRowHeaderUIElements()`
- `accessibilityRows()`
- `accessibilitySelectedCells()`
- `accessibilitySelectedColumns()`
- `accessibilitySelectedRows()`
- `accessibilityVisibleCells()`
- `accessibilityVisibleColumns()`
- `accessibilityVisibleRows()`
- `setAccessibilitySelectedRows(_:)`
- `accessibilityHeaderGroup()`

## See Also

- `NSAccessibilityList`
- `NSAccessibilityOutline`
- `NSAccessibilityRow`
