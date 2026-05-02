---
url: https://developer.apple.com/documentation/swiftui/dynamictablerowcontent
framework: SwiftUI
category: Tables
title: DynamicTableRowContent
kind: protocol
captured: 2026-05-02
---

# DynamicTableRowContent

A type of table row content that generates table rows from an underlying collection of data.

## Declaration

```swift
protocol DynamicTableRowContent : TableRowContent
```

### Overview

This table row content type provides drag-and-drop support for tables. Use the `DynamicTableRowContent/onInsert(of:perform:)` modifier to add an action to call when the table inserts new contents into its underlying collection.





## Relationships

**Inherits From**: `TableRowContent`

**Conforming Types**: `ForEach`, `ModifiedContent`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 12.0
- visionOS 1.0

## Topics

### Getting row data

- `data`
- `Data`

### Inserting rows

- `onInsert(of:perform:)`
- `OnInsertTableRowModifier`

### Supporting drag and drop

- `dropDestination(for:action:)`

## See Also

- `TableRow`
- `TableRowContent`
- `TableHeaderRowContent`
- `TupleTableRowContent`
- `TableForEachContent`
- `EmptyTableRowContent`
- `TableRowBuilder`
