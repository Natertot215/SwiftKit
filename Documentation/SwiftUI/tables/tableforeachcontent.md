---
url: https://developer.apple.com/documentation/swiftui/tableforeachcontent
framework: SwiftUI
category: Tables
title: TableForEachContent
kind: struct
captured: 2026-05-02
---

# TableForEachContent

A type of table row content that creates table rows created by iterating over a collection.

## Declaration

```swift
struct TableForEachContent<Data> where Data : RandomAccessCollection, Data.Element : Identifiable
```

### Overview

You don’t use this type directly. The various `Table.init(_:,...)` initializers create this type as the table’s `Rows` generic type.

To explicitly create dynamic collection-based rows, use `ForEach` instead.





## Relationships

**Conforms To**: `TableRowContent`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 12.0
- visionOS 1.0



## See Also

- `TableRow`
- `TableRowContent`
- `TableHeaderRowContent`
- `TupleTableRowContent`
- `EmptyTableRowContent`
- `DynamicTableRowContent`
- `TableRowBuilder`
