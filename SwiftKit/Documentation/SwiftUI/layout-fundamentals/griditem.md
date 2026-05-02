---
url: https://developer.apple.com/documentation/swiftui/griditem
framework: SwiftUI
category: Layout fundamentals
title: GridItem
kind: struct
captured: 2026-05-02
---

# GridItem

A description of a row or a column in a lazy grid.

## Declaration

```swift
struct GridItem
```

### Overview

Use an array of `GridItem` instances to configure the layout of items in a lazy grid. Each grid item in the array specifies layout properties like size and spacing for the rows of a `LazyHGrid` or the columns of a `LazyVGrid`. The following example defines four rows for a horizontal grid, each with different characteristics:

```swift
struct GridItemDemo: View {
    let rows = [
        GridItem(.fixed(30), spacing: 1),
        GridItem(.fixed(60), spacing: 10),
        GridItem(.fixed(90), spacing: 20),
        GridItem(.fixed(10), spacing: 50)
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 5) {
                ForEach(0...300, id: \.self) { _ in
                    Color.red.frame(width: 30)
                    Color.green.frame(width: 30)
                    Color.blue.frame(width: 30)
                    Color.yellow.frame(width: 30)
                }
            }
        }
    }
}
```

A lazy horizontal grid sets the width of each column based on the widest cell in the column. It can do this because it has access to all of the views in a given column at once. In the example above, the `Color` views always have the same fixed width, resulting in a uniform column width across the whole grid.

However, a lazy horizontal grid doesn’t generally have access to all the views in a row, because it generates new cells as people scroll through information in your app. Instead, it relies on a grid item for information about each row. The example above indicates a different fixed height for each row, and sets a different amount of spacing to appear after each row:





## Relationships

**Conforms To**: `Copyable`, `Equatable`, `Escapable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Creating a grid item

- `init(_:spacing:alignment:)`

### Inspecting grid item properties

- `alignment`
- `spacing`
- `size`
- `GridItem.Size`

## See Also

- `LazyHGrid`
- `LazyVGrid`
