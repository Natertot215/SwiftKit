---
url: https://developer.apple.com/documentation/swiftui/tupletablerowcontent
framework: SwiftUI
category: Tables
title: TupleTableRowContent
kind: struct
captured: 2026-05-02
---

# TupleTableRowContent

A type of table column content that creates table rows created from a Swift tuple of table rows.

## Declaration

```swift
@frozen struct TupleTableRowContent<Value, T> where Value : Identifiable
```

### Overview

Don’t use this type directly; instead, SwiftUI uses this type as the return value from the various `buildBlock` methods in `TableRowBuilder`. The size of the tuple corresponds to how many columns you create in the `rows` closure you provide to the `Table` initializer.





## Relationships

**Conforms To**: `TableRowContent`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 12.0
- visionOS 1.0

## Topics

### Accessing the value

- `value`

## See Also

- `TableRow`
- `TableRowContent`
- `TableHeaderRowContent`
- `TableForEachContent`
- `EmptyTableRowContent`
- `DynamicTableRowContent`
- `TableRowBuilder`
