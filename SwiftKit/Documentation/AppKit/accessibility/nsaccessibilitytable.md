---
url: https://developer.apple.com/documentation/appkit/nsaccessibilitytable
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibilityTable
kind: protocol
captured: 2026-05-01
---

# NSAccessibilityTable

## Declaration

```swift
protocol NSAccessibilityTable : NSAccessibilityGroup
```

## Abstract

A role-based protocol that declares the minimum interface necessary for an accessibility element to act as a table view.

## Overview

Use this protocol when you want a user interface element to behave like a table—a view that uses a row-and-column format to display a set of related records and their attributes—in the accessibility hierarchy.

You can further enhance the adopting element by implementing any of the information properties or action methods that the `NSAccessibilityProtocol` protocol declares.

> **Note:** Any class that adopts this protocol must implement all of its methods, and the required methods of any protocol it inherits from. The compiler may require you to override some methods that your ancestors have already implemented. Simply follow the compiler's warnings, and reimplement these methods as necessary.

## Supporting Accessibility Methods

### Required Methods

- `accessibilityLabel() -> String?` — Returns a short description of the table.
- `accessibilityRows() -> [any NSAccessibilityRow]?` — Returns the row accessibility elements for the table.

### Optional Methods

- `accessibilityColumns() -> [Any]?` — Returns the column accessibility elements for the table.
- `accessibilityColumnHeaderUIElements() -> [Any]?` — Returns the column header accessibility elements for the table.
- `accessibilityRowHeaderUIElements() -> [Any]?` — Returns the row header accessibility elements for the table.
- `accessibilitySelectedCells() -> [Any]?` — The currently selected cells for the table.
- `accessibilitySelectedColumns() -> [Any]?` — Returns the currently selected columns for the table.
- `accessibilitySelectedRows() -> [any NSAccessibilityRow]?` — Returns the currently selected rows for the table.
- `accessibilityVisibleCells() -> [Any]?` — Returns the visible cells for the table.
- `accessibilityVisibleColumns() -> [Any]?` — Returns the visible columns for the table.
- `accessibilityVisibleRows() -> [any NSAccessibilityRow]?` — Returns the visible rows for the table.
- `setAccessibilitySelectedRows([any NSAccessibilityRow])` — Sets the table's currently selected rows.
- `accessibilityHeaderGroup() -> String?` — *Deprecated.* Returns the header group for the table.

## Inheritance

Inherits from: `NSAccessibilityGroup`

## Inherited By

- `NSAccessibilityList`
- `NSAccessibilityOutline`

## Conforming Types

- `NSTableView`
- `NSOutlineView`

## See Also

- `NSAccessibilityList`
- `NSAccessibilityOutline`
- `NSAccessibilityRow`

## Availability

- **macOS**: Available
