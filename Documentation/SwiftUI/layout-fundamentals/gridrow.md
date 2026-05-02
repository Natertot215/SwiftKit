---
url: https://developer.apple.com/documentation/swiftui/gridrow
framework: SwiftUI
category: Layout fundamentals
title: GridRow
kind: struct
captured: 2026-05-02
---

# GridRow

A horizontal row in a two dimensional grid container.

## Declaration

```swift
@frozen struct GridRow<Content> where Content : View
```

### Overview

Use one or more `GridRow` instances to define the rows of a `Grid` container. The child views inside the row define successive grid cells. You can add rows to the grid explicitly, or use the `ForEach` structure to generate multiple rows. Similarly, you can add cells to the row explicitly or you can use `ForEach` to generate multiple cells inside the row. The following example mixes these strategies:

```swift
Grid {
    GridRow {
        Color.clear
            .gridCellUnsizedAxes([.horizontal, .vertical])
        ForEach(1..<4) { column in
            Text("C\(column)")
        }
    }
    ForEach(1..<4) { row in
        GridRow {
            Text("R\(row)")
            ForEach(1..<4) { _ in
                Circle().foregroundStyle(.mint)
            }
        }
    }
}
```

The grid in the example above has an explicit first row and three generated rows. Similarly, each row has an explicit first cell and three generated cells:

To create an empty cell, use something invisible, like the `ShapeStyle/clear` color that appears in the first column of the first row in the example above. However, if you use a flexible view like a `Color` or a `Spacer`, you might also need to add the `View/gridCellUnsizedAxes(_:)` modifier to prevent the view from taking up more space than the other cells in the row or column need.

> **IMPORTANT:** You can’t use `EmptyView` to create a blank cell because that resolves to the absence of a view and doesn’t generate a cell.

By default, the cells in the row use the `Alignment` that you define when you initialize the `Grid`. However, you can override the vertical alignment for the cells in a row by providing a `VerticalAlignment` value to the row’s `GridRow/init(alignment:content:)` initializer.

If you apply a view modifier to a row, the row applies the modifier to all of the cells, similar to how a `Group` behaves. For example,  if you apply the `View/border(_:width:)` modifier to a row, SwiftUI draws a border on each cell in the row rather than around the row.





## Relationships

**Conforms To**: `Copyable`, `Escapable`, `View`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Creating a grid row

- `init(alignment:content:)`

## See Also

- `Grid`
- `gridCellColumns(_:)`
- `gridCellAnchor(_:)`
- `gridCellUnsizedAxes(_:)`
- `gridColumnAlignment(_:)`
