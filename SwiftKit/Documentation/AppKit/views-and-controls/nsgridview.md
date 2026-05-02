---
url: https://developer.apple.com/documentation/appkit/nsgridview
framework: AppKit
category: Views and controls
title: NSGridView
kind: class
captured: 2026-05-01
---

# NSGridView

## Declaration

```swift
class NSGridView : NSView
```

## Abstract

A container that aligns views in a flexible grid of rows and columns.

## Overview

A grid view helps you lay out content, such as photos or thumbnails, in a row-column arrangement similar to a spreadsheet. Within a grid view, an item that occupies a single row-column intersection is represented by an `NSGridCell` object.

## Availability

- **macOS** 10.12+

## Inheritance

- Inherits from: `NSView`

## Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSAccessibilityElementProtocol`
- `NSAccessibilityProtocol`
- `NSAnimatablePropertyContainer`
- `NSAppearanceCustomization`
- `NSCoding`
- `NSDraggingDestination`
- `NSObject`
- `NSStandardKeyBindingResponding`
- `NSTouchBarProvider`
- `NSUserActivityRestoring`
- `NSUserInterfaceItemIdentification`
- `Sendable`

## Topics

### Creating a Grid View

- `init(numberOfColumns:rows:)` - Creates a newly allocated grid view with specified columns and rows
- `init(views:)` - Creates a grid view from an array of arrays of views
- `init(frame:)` - Creates a grid view with specified frame
- `init(coder:)` - Creates a grid view from a coder

### Getting Information About the Grid

- `numberOfRows` - The number of rows in the grid view
- `numberOfColumns` - The number of columns in the grid view
- `row(at:)` - Returns the grid row object at specified index
- `column(at:)` - Returns the grid column object at specified index
- `index(of:)` - Returns the index of a specified grid row or column

### Adding, Removing, and Moving Rows

- `addRow(with:)` - Adds an array of views to a new row
- `insertRow(at:with:)` - Inserts views at specified index
- `removeRow(at:)` - Removes row at specified index
- `moveRow(at:to:)` - Moves a row to new location

### Adding, Removing, and Moving Columns

- `addColumn(with:)` - Adds a new column with array of views
- `insertColumn(at:with:)` - Inserts column at specified index
- `removeColumn(at:)` - Removes column at specified index
- `moveColumn(at:to:)` - Moves column to new location

### Managing Grid Spacing and Alignment

- `sizedForContent` - Default value for row and column sizes
- `columnSpacing` - The column spacing for the grid view
- `rowSpacing` - The row spacing for the grid view
- `rowAlignment` - The row alignment for the grid view
- `xPlacement` - The placement of cell within grid column
- `yPlacement` - The placement of cell within grid row

### Creating and Merging Cells

- `cell(atColumnIndex:rowIndex:)` - Returns grid cell at specified column and row
- `cell(for:)` - Returns grid cell containing given view
- `mergeCells(inHorizontalRange:verticalRange:)` - Expands cell to cover entire area
