---
url: https://developer.apple.com/documentation/swiftui/tablecolumncustomizationbehavior
framework: SwiftUI
category: Tables
title: TableColumnCustomizationBehavior
kind: struct
captured: 2026-05-02
---

# TableColumnCustomizationBehavior

A set of customization behaviors of a column that a table can offer to a user.

## Declaration

```swift
struct TableColumnCustomizationBehavior
```

### Overview

This is used as a value provided to `TableColumnContent/disabledCustomizationBehavior(_:)`.

Setting any of these values as the `disabledCustomizationBehavior(_:)` doesn’t have any effect on iOS.





## Relationships

**Conforms To**: `Equatable`, `ExpressibleByArrayLiteral`, `Sendable`, `SendableMetatype`, `SetAlgebra`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- visionOS 1.0

## Topics

### Getting the customization behavior

- `all`
- `reorder`
- `resize`
- `visibility`

### Creating a behavior

- `init()`

## See Also

- `tableColumnHeaders(_:)`
- `TableColumnCustomization`
