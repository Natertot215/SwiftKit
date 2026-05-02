---
url: https://developer.apple.com/documentation/swiftui/table
framework: SwiftUI
category: Tables
title: Table
kind: struct
captured: 2026-05-02
---

# Table

A container that presents rows of data arranged in one or more columns, optionally providing the ability to select one or more members.

## Declaration

```swift
struct Table<Value, Rows, Columns> where Value == Rows.TableRowValue, Rows : TableRowContent, Columns : TableColumnContent, Rows.TableRowValue == Columns.TableRowValue
```

### Overview

You commonly create tables from collections of data. The following example shows how to create a simple, three-column table from an array of `Person` instances that conform to the `Identifiable` protocol:

```swift
struct Person: Identifiable {
    let givenName: String
    let familyName: String
    let emailAddress: String
    let id = UUID()

    var fullName: String { givenName + " " + familyName }
}

@State private var people = [
    Person(givenName: "Juan", familyName: "Chavez", emailAddress: "juanchavez@icloud.com"),
    Person(givenName: "Mei", familyName: "Chen", emailAddress: "meichen@icloud.com"),
    Person(givenName: "Tom", familyName: "Clark", emailAddress: "tomclark@icloud.com"),
    Person(givenName: "Gita", familyName: "Kumar", emailAddress: "gitakumar@icloud.com")
]

struct PeopleTable: View {
    var body: some View {
        Table(people) {
            TableColumn("Given Name", value: \.givenName)
            TableColumn("Family Name", value: \.familyName)
            TableColumn("E-Mail Address", value: \.emailAddress)
        }
    }
}
```

If there are more rows than can fit in the available space, `Table` provides vertical scrolling automatically. On macOS, the table also provides horizontal scrolling if there are more columns than can fit in the width of the view. Scroll bars appear as needed on iOS; on macOS, the `Table` shows or hides scroll bars based on the “Show scroll bars” system preference.

#### Supporting selection in tables

To make rows of a table selectable, provide a binding to a selection variable. Binding to a single instance of the table data’s `Identifiable/id-8t2ws` type creates a single-selection table. Binding to a `Set` creates a table that supports multiple selections. The following example shows how to add multi-select to the previous example. A `Text` view below the table shows the number of items currently selected.

```swift
struct SelectableTable: View {
    @State private var selectedPeople = Set<Person.ID>()

    var body: some View {
        Table(people, selection: $selectedPeople) {
            TableColumn("Given Name", value: \.givenName)
            TableColumn("Family Name", value: \.familyName)
            TableColumn("E-Mail Address", value: \.emailAddress)
        }
        Text("\(selectedPeople.count) people selected")
    }
}
```

#### Supporting sorting in tables

To make the columns of a table sortable, provide a binding to an array of `SortComparator` instances. The table reflects the sorted state through its column headers, allowing sorting for any columns with key paths.

When the table sort descriptors update, re-sort the data collection that underlies the table; the table itself doesn’t perform a sort operation. You can watch for changes in the sort descriptors by using a `View/onChange(of:perform:)` modifier, and then sort the data in the modifier’s `perform` closure.

The following example shows how to add sorting capability to the previous example:

```swift
struct SortableTable: View {
    @State private var sortOrder = [KeyPathComparator(\Person.givenName)]

    var body: some View {
        Table(people, sortOrder: $sortOrder) {
            TableColumn("Given Name", value: \.givenName)
            TableColumn("Family Name", value: \.familyName)
            TableColumn("E-Mail address", value: \.emailAddress)
        }
        .onChange(of: sortOrder) { _, sortOrder in
            people.sort(using: sortOrder)
        }
    }
}
```

#### Building tables with static rows

To create a table from static rows, rather than the contents of a collection of data, you provide both the columns and the rows.

The following example shows a table that calculates prices from applying varying gratuities (“tips”) to a fixed set of prices. It creates the table with the `Table/init(of:columns:rows:)` initializer, with the `rows` parameter providing the base price that each row uses for its calculations. Each column receives each price and performs its calculation, producing a `Text` to display the formatted result.

```swift
struct Purchase: Identifiable {
    let price: Decimal
    let id = UUID()
}

struct TipTable: View {
    let currencyStyle = Decimal.FormatStyle.Currency(code: "USD")

    var body: some View {
        Table(of: Purchase.self) {
            TableColumn("Base price") { purchase in
                Text(purchase.price, format: currencyStyle)
            }
            TableColumn("With 15% tip") { purchase in
                Text(purchase.price * 1.15, format: currencyStyle)
            }
            TableColumn("With 20% tip") { purchase in
                Text(purchase.price * 1.2, format: currencyStyle)
            }
            TableColumn("With 25% tip") { purchase in
                Text(purchase.price * 1.25, format: currencyStyle)
            }
        } rows: {
            TableRow(Purchase(price: 20))
            TableRow(Purchase(price: 50))
            TableRow(Purchase(price: 75))
        }
    }
}
```

#### Styling tables

Use the `View/tableStyle(_:)` modifier to set a `TableStyle` for all tables within a view. SwiftUI provides several table styles, such as `InsetTableStyle` and, on macOS, `BorderedTableStyle`. The default style is `AutomaticTableStyle`, which is available on all platforms that support `Table`.

#### Using tables on different platforms

You can define a single table for use on macOS, iOS, and iPadOS. However, on iPhone or in a compact horizontal size class environment — typical on iPad in certain modes, like Slide Over — the table has limited space to display its columns. To conserve space, the table automatically hides headers and all columns after the first when it detects this condition.

To provide a good user experience in a space-constrained environment, you can customize the first column to show more information when you detect that the `EnvironmentValues/horizontalSizeClass` environment value becomes `UserInterfaceSizeClass/compact`. For example, you can modify the sortable table from above to conditionally show all the information in the first column:

```swift
struct CompactableTable: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    private var isCompact: Bool { horizontalSizeClass == .compact }
    #else
    private let isCompact = false
    #endif

    @State private var sortOrder = [KeyPathComparator(\Person.givenName)]

    var body: some View {
        Table(people, sortOrder: $sortOrder) {
            TableColumn("Given Name", value: \.givenName) { person in
                VStack(alignment: .leading) {
                    Text(isCompact ? person.fullName : person.givenName)
                    if isCompact {
                        Text(person.emailAddress)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            TableColumn("Family Name", value: \.familyName)
            TableColumn("E-Mail Address", value: \.emailAddress)
        }
        .onChange(of: sortOrder) { _, sortOrder in
            people.sort(using: sortOrder)
        }
    }
}
```

By making this change, you provide a list-like appearance for narrower displays, while displaying the full table on wider ones. Because you use the same table instance in both cases, you get a seamless transition when the size class changes, like when someone moves your app into or out of Slide Over.





## Relationships

**Conforms To**: `View`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 12.0
- visionOS 1.0

## Topics

### Creating a table from columns

- `init(_:columns:)`
- `init(_:selection:columns:)`

### Creating a sortable table from columns

- `init(_:sortOrder:columns:)`
- `init(_:selection:sortOrder:columns:)`

### Creating a table from columns and rows

- `init(of:columns:rows:)`
- `init(of:selection:columns:rows:)`

### Creating a sortable table from columns and rows

- `init(of:sortOrder:columns:rows:)`
- `init(of:selection:sortOrder:columns:rows:)`
- `init(sortOrder:columns:rows:)`
- `init(selection:sortOrder:columns:rows:)`

### Creating a table with customizable columns

- `init(_:columnCustomization:columns:)`
- `init(_:selection:columnCustomization:columns:)`
- `init(_:selection:sortOrder:columnCustomization:columns:)`
- `init(_:sortOrder:columnCustomization:columns:)`

### Creating a table with dynamically customizable columns

- `init(of:columnCustomization:columns:rows:)`
- `init(of:selection:columnCustomization:columns:rows:)`
- `init(of:selection:sortOrder:columnCustomization:columns:rows:)`
- `init(of:sortOrder:columnCustomization:columns:rows:)`

### Creating a hierarchical table

- `init(_:children:columnCustomization:columns:)`
- `init(_:children:selection:columnCustomization:columns:)`
- `init(_:children:selection:sortOrder:columnCustomization:columns:)`
- `init(_:children:sortOrder:columnCustomization:columns:)`

## See Also

- `Building a great Mac app with SwiftUI`
- `tableStyle(_:)`
