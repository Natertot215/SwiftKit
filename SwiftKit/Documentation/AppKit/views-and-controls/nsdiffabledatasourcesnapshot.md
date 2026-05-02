---
url: https://developer.apple.com/documentation/appkit/nsdiffabledatasourcesnapshot
framework: AppKit
category: Views and controls
title: NSDiffableDataSourceSnapshot
kind: struct
captured: 2026-05-02
---

# NSDiffableDataSourceSnapshot

A representation of the state of the data in a view at a specific point in time.

## Declaration

```swift
struct NSDiffableDataSourceSnapshot<SectionIdentifierType, ItemIdentifierType> where SectionIdentifierType : Hashable, ItemIdentifierType : Hashable
```

### Overview

Diffable data sources use *snapshots*snapshots to provide data for collection views and table views. You use a snapshot to set up the initial state of the data that a view displays, and you use snapshots to reflect changes to the data that the view displays.

The data in a snapshot is made up of the sections and items you want to display, in the order you that you determine. You configure what to display by adding, deleting, or moving the sections and items.

> **IMPORTANT:**  Each of your sections and items must have unique identifiers that conform to the `Hashable` protocol. Use `struct` or `enum` Swift value types for your identifiers, including built-in types such as `Int`, `String`, or `UUID`. If you use a Swift `class` for your identifiers, your `class` must be a subclass of `NSObject`.

To display data in a view using a snapshot:

1. Create a snapshot and populate it with the state of the data you want to display.
2. Apply the snapshot to reflect the changes in the UI.

You can create and configure a snapshot in one of these ways:

- Create an empty snapshot, then append sections and items to it.
- Get the current snapshot by calling the diffable data source’s `NSCollectionViewDiffableDataSource-axww/snapshot()` method, then modify that snapshot to reflect the new state of the data that you want to display.

For example, the following code creates an empty snapshot and populates it with a single section with three items. Then, the code applies the snapshot, animating the UI updates between the previous state and the new state.

```swift
// Create a snapshot.
var snapshot = NSDiffableDataSourceSnapshot<Int, UUID>()        

// Populate the snapshot.
snapshot.appendSections([0])
snapshot.appendItems([UUID(), UUID(), UUID()])

// Apply the snapshot.
dataSource.apply(snapshot, animatingDifferences: true)
```

For more information, see the diffable data source types:

- `UICollectionViewDiffableDataSource-9tqpa`
- `UITableViewDiffableDataSource-2euir`
- `NSCollectionViewDiffableDataSourceReference`

#### Bridging

You can bridge from an `NSDiffableDataSourceSnapshotReference` object to this type:

```swift
let snapshot = snapshotReference as NSDiffableDataSourceSnapshot<Int, UUID>
```





## Relationships

**Conforms To**: `Copyable`, `Escapable`

## Availability

- macOS 10.15.1

## Topics

### Creating a Snapshot

- `init()`
- `appendSections(_:)`
- `appendItems(_:toSection:)`

### Getting Item and Section Metrics

- `numberOfItems`
- `numberOfSections`
- `numberOfItems(inSection:)`

### Identifying Items and Sections

- `itemIdentifiers`
- `sectionIdentifiers`
- `indexOfItem(_:)`
- `indexOfSection(_:)`
- `itemIdentifiers(inSection:)`
- `sectionIdentifier(containingItem:)`

### Inserting Items and Sections

- `insertItems(_:afterItem:)`
- `insertItems(_:beforeItem:)`
- `insertSections(_:afterSection:)`
- `insertSections(_:beforeSection:)`

### Removing Items and Sections

- `deleteAllItems()`
- `deleteItems(_:)`
- `deleteSections(_:)`

### Reordering Items and Sections

- `moveItem(_:afterItem:)`
- `moveItem(_:beforeItem:)`
- `moveSection(_:afterSection:)`
- `moveSection(_:beforeSection:)`

### Reloading Data

- `reloadItems(_:)`
- `reloadSections(_:)`

### Supporting Bridging

- `NSDiffableDataSourceSnapshotReference`

## See Also

- `NSCollectionViewDataSource`
- `NSCollectionViewDelegate`
- `NSCollectionViewDiffableDataSource`
