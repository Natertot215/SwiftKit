---
url: https://developer.apple.com/documentation/appkit/nstableviewdiffabledatasource
framework: AppKit
category: Views and controls
title: NSTableViewDiffableDataSource
kind: class
captured: 2026-05-02
---

# NSTableViewDiffableDataSource

The object you use to manage data and provide items for a table view.

## Declaration

```swift
class NSTableViewDiffableDataSource<SectionIdentifierType, ItemIdentifierType> where SectionIdentifierType : Hashable, ItemIdentifierType : Hashable
```

### Overview

A *diffable data source*diffable data source object is a specialized type of data source that works together with your table view object. It provides the behavior you need to manage updates to your table view’s data and UI in a simple, efficient way. It also conforms to the `NSTableViewDataSource` protocol.

To fill a table view with data:

1. Connect a diffable data source to your table view.
2. Implement a cell provider to configure your table view’s cells.
3. Generate the current state of the data.
4. Display the data in the UI.

To connect a diffable data source to a table view, you create the diffable data source using its `NSTableViewDiffableDataSource-c5gl/init(tableView:cellProvider:)` initializer, passing in the table view you want to associate with that data source. You also pass in a cell provider, where you configure each of your cells to determine how to display your data in the UI.

Then, you generate the current state of the data and display the data in the UI by constructing and applying a snapshot. For more information, see `NSDiffableDataSourceSnapshot-swift.struct`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `NSTableViewDataSource`

## Availability

- macOS 11.0

## Topics

### Creating a Diffable Data Source

- `init(tableView:cellProvider:)`
- `NSTableViewDiffableDataSource.CellProvider`

### Creating Row and Section Views

- `rowViewProvider`
- `sectionHeaderViewProvider`
- `NSTableViewDiffableDataSource.RowProvider`
- `NSTableViewDiffableDataSourceReferenceRowProvider`
- `NSTableViewDiffableDataSource.SectionHeaderViewProvider`
- `NSTableViewDiffableDataSourceReferenceSectionHeaderViewProvider`

### Identifying Items and Sections

- `itemIdentifier(forRow:)`
- `row(forItemIdentifier:)`
- `sectionIdentifier(forRow:)`
- `row(forSectionIdentifier:)`

### Updating Data

- `snapshot()`
- `apply(_:animatingDifferences:completion:)`
- `defaultRowAnimation`

### Providing the Number of Rows

- `numberOfRows(in:)`

### Supporting Bridging

- `NSTableViewDiffableDataSourceReference`

## See Also

- `NSTableViewDataSource`
- `NSTableViewDelegate`
