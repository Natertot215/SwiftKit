---
url: https://developer.apple.com/documentation/swiftui/tablecolumncontent
framework: SwiftUI
category: Tables
title: TableColumnContent
kind: protocol
captured: 2026-05-02
---

# TableColumnContent

A type used to represent columns within a table.

## Declaration

```swift
@MainActor @preconcurrency protocol TableColumnContent<TableRowValue, TableColumnSortComparator>
```

### Overview

This type provides the body content of the column, as well as the types of the column’s row values and the comparator used to sort rows.

You can factor column content out into separate types or properties, or by creating a custom type conforming to `TableColumnContent`.

```swift
var body: some View {
    Table(people, selection: $selectedPeople, sortOrder: $sortOrder) {
        nameColumns

        TableColumn("Location", value: \.location) {
            LocationView($0.location)
        }
    }
}

@TableColumnBuilder<Person, KeyPathComparator<Person>>
private var nameColumns: some TableColumnContent<
    Person, KeyPathComparator<Person>
> {
    TableColumn("First Name", value: \.firstName) {
        PrimaryColumnView(person: $0)
    }
    TableColumn("Last Name", value: \.lastName)
    TableColumn("Nickname", value: \.nickname)
}
```

The above example factors three table columns into a separate computed property that has an opaque type. The property’s primary associated type `TableRowValue` is a `Person` and its associated type `TableColumnSortComparator` is a key comparator for the `Person` type.

A type conforming to this protocol inherits `@preconcurrency @MainActor` isolation from the protocol if the conformance is included in the type’s base declaration:

```swift
struct MyCustomType: Transition {
    // `@preconcurrency @MainActor` isolation by default
}
```

Isolation to the main actor is the default, but it’s not required. Declare the conformance in an extension to opt out of main actor isolation:

```swift
extension MyCustomType: Transition {
    // `nonisolated` by default
}
```





## Relationships

**Conforming Types**: `Group`, `TableColumn`, `TableColumnForEach`, `TupleTableColumnContent`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 12.0
- visionOS 1.0

## Topics

### Getting the column body

- `tableColumnBody`
- `TableColumnBody`

### Defining the row value

- `TableRowValue`

### Defining the comparator

- `TableColumnSortComparator`

### Configuring the content

- `alignment(_:)`
- `customizationID(_:)`
- `defaultVisibility(_:)`
- `disabledCustomizationBehavior(_:)`

## See Also

- `TableColumn`
- `TableColumnAlignment`
- `TableColumnBuilder`
- `TableColumnForEach`
