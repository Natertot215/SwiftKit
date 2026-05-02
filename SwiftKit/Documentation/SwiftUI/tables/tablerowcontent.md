---
url: https://developer.apple.com/documentation/swiftui/tablerowcontent
framework: SwiftUI
category: Tables
title: TableRowContent
kind: protocol
captured: 2026-05-02
---

# TableRowContent

A type used to represent table rows.

## Declaration

```swift
@MainActor @preconcurrency protocol TableRowContent<TableRowValue>
```

### Overview

Like with the `View` protocol, you can create custom table row content by declaring a type that conforms to the `TableRowContent` protocol and implementing the required `TableRowContent/tableRowBody-swift.property` property.

```swift
struct GroupOfPeopleRows: TableRowContent {
    @Binding var people: [Person]

    var tableRowBody: some TableRowContent<Person> {
        ForEach(people) { person in
            TableRow(person)
                .itemProvider { person.itemProvider }
        }
        .dropDestination(for: Person.self) { destination, newPeople in
            people.insert(contentsOf: newPeople, at: destination)
        }
    }
}
```

This example uses an opaque result type and specifies that the primary associated type `TableRowValue` for the `tableRowBody` property is a `Person`. From this, SwiftUI can infer `TableRowValue` for the `GroupOfPeopleRows` structure is also `Person`.

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

**Inherited By**: `DynamicTableRowContent`

**Conforming Types**: `DisclosureTableRow`, `EmptyTableRowContent`, `ForEach`, `Group`, `ModifiedContent`, `OutlineGroup`, `Section`, `TableForEachContent`, `TableHeaderRowContent`, `TableOutlineGroupContent`, `TableRow`, `TupleTableRowContent`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 12.0
- visionOS 1.0

## Topics

### Getting the row body

- `tableRowBody`
- `TableRowBody`

### Defining the row value

- `TableRowValue`

### Managing interaction

- `draggable(_:)`
- `dropDestination(for:action:)`
- `onHover(perform:)`
- `itemProvider(_:)`
- `ItemProviderTableRowModifier`

### Adding a context menu to a row

- `contextMenu(menuItems:)`
- `contextMenu(menuItems:preview:)`

### Instance Methods

- `selectionDisabled(_:)`

## See Also

- `TableRow`
- `TableHeaderRowContent`
- `TupleTableRowContent`
- `TableForEachContent`
- `EmptyTableRowContent`
- `DynamicTableRowContent`
- `TableRowBuilder`
