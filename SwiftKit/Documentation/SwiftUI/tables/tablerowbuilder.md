---
url: https://developer.apple.com/documentation/swiftui/tablerowbuilder
framework: SwiftUI
category: Tables
title: TableRowBuilder
kind: struct
captured: 2026-05-02
---

# TableRowBuilder

A result builder that creates table row content from closures.

## Declaration

```swift
@resultBuilder struct TableRowBuilder<Value> where Value : Identifiable
```

### Overview

The `buildBlock` methods in this type create `TableRowContent` instances based on the number and types of sources provided as parameters.

Don’t use this type directly; instead, SwiftUI annotates the `rows` parameter of the various `Table` initializers with the `@TableRowBuilder` annotation, implicitly calling this builder for you.







## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 12.0
- visionOS 1.0

## Topics

### Building a row from sources

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

### Building a row from conditionals

- `buildIf(_:)`
- `buildEither(first:)`
- `buildEither(second:)`
- `buildExpression(_:)`

## See Also

- `TableRow`
- `TableRowContent`
- `TableHeaderRowContent`
- `TupleTableRowContent`
- `TableForEachContent`
- `EmptyTableRowContent`
- `DynamicTableRowContent`
