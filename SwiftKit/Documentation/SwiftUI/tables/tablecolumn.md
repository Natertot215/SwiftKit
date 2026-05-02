---
url: https://developer.apple.com/documentation/swiftui/tablecolumn
framework: SwiftUI
category: Tables
title: TableColumn
kind: struct
captured: 2026-05-02
---

# TableColumn

A column that displays a view for each row in a table.

## Declaration

```swift
struct TableColumn<RowValue, Sort, Content, Label> where RowValue : Identifiable, Sort : SortComparator, Content : View, Label : View
```

### Overview

You create a column with a label, content view, and optional key path. The table calls the content view builder with the value for each row in the table. The column uses a key path to map to a property of each row value, which sortable tables use to reflect the current sort order.

The following example creates a sortable column for a table with `Person` rows, displaying each person’s given name:

```swift
TableColumn("Given name", value: \.givenName) { person in
    Text(person.givenName)
}
```

For the common case of `String` properties, you can use the convenience initializer that doesn’t require an explicit content closure and displays that string verbatim as a `Text` view. This means you can write the previous example as:

```swift
TableColumn("Given name", value: \.givenName)
```





## Relationships

**Conforms To**: `TableColumnContent`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 12.0
- visionOS 1.0

## Topics

### Creating an unsortable column

- `init(_:value:)`
- `init(_:content:)`

### Creating a sortable column

- `init(_:value:content:)`
- `init(_:value:comparator:)`
- `init(_:value:comparator:content:)`
- `init(_:sortUsing:content:)`

### Setting the column width

- `width(_:)`
- `width(min:ideal:max:)`
- `width()`

## See Also

- `TableColumnContent`
- `TableColumnAlignment`
- `TableColumnBuilder`
- `TableColumnForEach`
