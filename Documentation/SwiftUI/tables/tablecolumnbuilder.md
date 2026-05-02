---
url: https://developer.apple.com/documentation/swiftui/tablecolumnbuilder
framework: SwiftUI
category: Tables
title: TableColumnBuilder
kind: struct
captured: 2026-05-02
---

# TableColumnBuilder

A result builder that creates table column content from closures.

## Declaration

```swift
@resultBuilder struct TableColumnBuilder<RowValue, Sort> where RowValue : Identifiable, Sort : SortComparator
```

### Overview

The `buildBlock` methods in this type create `TableColumnContent` instances based on the number and types of sources provided as parameters.

Don’t use this type directly; instead, SwiftUI annotates the `columns` parameter of the various `Table` initializers with the `@TableColumnBuilder` annotation, implicitly calling this builder for you.







## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 12.0
- visionOS 1.0

## Topics

### Building a column

- `buildBlock(_:)`
- `buildBlock(_:_:)`
- `buildBlock(_:_:_:)`
- `buildBlock(_:_:_:_:)`
- `buildBlock(_:_:_:_:_:)`
- `buildBlock(_:_:_:_:_:_:)`
- `buildBlock(_:_:_:_:_:_:_:)`
- `buildBlock(_:_:_:_:_:_:_:_:)`
- `buildBlock(_:_:_:_:_:_:_:_:_:)`
- `buildBlock(_:_:_:_:_:_:_:_:_:_:)`
- `buildExpression(_:)`

### Supporting types

- `TupleTableColumnContent`

### Type Methods

- `buildEither(first:)`
- `buildEither(second:)`
- `buildIf(_:)`
- `buildLimitedAvailability(_:)`

## See Also

- `TableColumn`
- `TableColumnContent`
- `TableColumnAlignment`
- `TableColumnForEach`
