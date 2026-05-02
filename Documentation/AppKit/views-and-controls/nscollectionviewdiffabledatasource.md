---
url: https://developer.apple.com/documentation/appkit/nscollectionviewdiffabledatasource
framework: AppKit
category: Views and controls
title: NSCollectionViewDiffableDataSource
kind: class
captured: 2026-05-02
---

# NSCollectionViewDiffableDataSource

The object you use to manage data and provide items for a collection view.

## Declaration

```swift
class NSCollectionViewDiffableDataSource<SectionIdentifierType, ItemIdentifierType> where SectionIdentifierType : Hashable, ItemIdentifierType : Hashable
```

### Overview

A *diffable data source*diffable data source object is a specialized type of data source that works together with your collection view object. It provides the behavior you need to manage updates to your collection view’s data and UI in a simple, efficient way. It also conforms to the `NSCollectionViewDataSource` protocol and provides implementations for all of the protocol’s methods.

To fill a collection view with data:

1. Connect a diffable data source to your collection view.
2. Implement an item provider to configure your collection view’s items.
3. Generate the current state of the data.
4. Display the data in the UI.

To connect a diffable data source to a collection view, you create the diffable data source using its `NSCollectionViewDiffableDataSource-axww/init(collectionView:itemProvider:)` initializer, passing in the collection view you want to associate with that data source. You also pass in an item provider, where you configure each of your items to determine how to display your data in the UI.

```swift
dataSource = NSCollectionViewDiffableDataSource<Int, UUID>(collectionView: collectionView) {
    (collectionView: NSCollectionView, indexPath: IndexPath, itemIdentifier: UUID) -> NSCollectionViewItem? in
    // configure and return item
}
```

Then, you generate the current state of the data and display the data in the UI by constructing and applying a snapshot. For more information, see `NSDiffableDataSourceSnapshot-swift.struct`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCollectionViewDataSource`, `NSObjectProtocol`

## Availability

- macOS 10.15.1

## Topics

### Creating a Diffable Data Source

- `init(collectionView:itemProvider:)`
- `NSCollectionViewDiffableDataSource.ItemProvider`

### Creating Supplementary Views

- `supplementaryViewProvider`
- `NSCollectionViewDiffableDataSource.SupplementaryViewProvider`

### Identifying Items

- `itemIdentifier(for:)`
- `indexPath(for:)`

### Updating Data

- `snapshot()`
- `apply(_:animatingDifferences:completion:)`

### Supporting Protocol Requirements

- `Protocol Implementations`

## See Also

- `NSCollectionViewDataSource`
- `NSCollectionViewDelegate`
- `NSDiffableDataSourceSnapshot`
