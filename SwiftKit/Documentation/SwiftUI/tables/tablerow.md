---
url: https://developer.apple.com/documentation/swiftui/tablerow
framework: SwiftUI
category: Tables
title: TableRow
kind: struct
captured: 2026-05-02
---

# TableRow

A row that represents a data value in a table.

## Declaration

```swift
struct TableRow<Value> where Value : Identifiable
```

### Overview

Create instances of `TableRow` in the closure you provide to the `rows` parameter in `Table` initializers that take columns and rows. The table provides the value of a row to each column of a table, which produces the cells for each row in the column.





## Relationships

**Conforms To**: `TableRowContent`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 12.0
- visionOS 1.0

## Topics

### Creating a row

- `init(_:)`

## See Also

- `TableRowContent`
- `TableHeaderRowContent`
- `TupleTableRowContent`
- `TableForEachContent`
- `EmptyTableRowContent`
- `DynamicTableRowContent`
- `TableRowBuilder`
