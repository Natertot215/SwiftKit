---
url: https://developer.apple.com/documentation/swiftui/tableoutlinegroupcontent
framework: SwiftUI
category: Tables
title: TableOutlineGroupContent
kind: struct
captured: 2026-05-02
---

# TableOutlineGroupContent

An opaque table row type created by a table’s hierarchical initializers.

## Declaration

```swift
struct TableOutlineGroupContent<Data> where Data : RandomAccessCollection, Data.Element : Identifiable
```

### Overview

This row content is created by `Table.init(_:,children:,...)` initializers as the table’s `Rows` generic type.

To explicitly create hierarchical rows, use `OutlineGroup` instead.





## Relationships

**Conforms To**: `TableRowContent`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- visionOS 1.0



## See Also

- `DisclosureTableRow`
