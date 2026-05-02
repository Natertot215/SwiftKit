---
url: https://developer.apple.com/documentation/appkit/nscollectionviewdatasource
framework: AppKit
category: Views and controls
title: NSCollectionViewDataSource
kind: protocol
captured: 2026-05-02
---

# NSCollectionViewDataSource

A set of methods that a data source object implements to provide the information and view objects that a collection view requires to present content.

## Declaration

```swift
protocol NSCollectionViewDataSource : NSObjectProtocol
```

### Overview

A data source object vends information about your app’s data model to the collection view when asked. For example, it tells the collection view how many items are present. It also handles the creation and configuration of the views used to represent items and used to decorate the collection view’s content area.

All data source objects must implement the `NSCollectionViewDataSource/collectionView(_:numberOfItemsInSection:)` and `NSCollectionViewDataSource/collectionView(_:itemForRepresentedObjectAt:)` methods. These methods provide the collection view with the basic information it needs to display your items. The remaining methods of the protocol are optional and are needed only if your collection view organizes items into sections or provides supplementary views.

To associate your data source object with a collection view, assign the object to the `NSCollectionView/dataSource` property of that collection view. You can also connect the data source to your collection view in Interface Builder. For more information about how a collection view works with its data source to present content, see `NSCollectionView`.

#### Organizing Your Data Structures

How you implement your data source object has implications for the associated collection view. Your data source object acts as the bridge between your app’s underlying data and the presentation of that data by the collection view. Because the methods of your data source object are called many times while the collection view is onscreen, the implementations of those methods need to return data as quickly as possible. Therefore, you should create data structures that adapt easily to the organization of the collection view itself.

Data in a collection view is organized into one or more *sections*sections, and each section contains zero or more *items*items in a specific order. You specify how many sections and items your collection view has based on your data. You define what the content of an item is, but usually the items in a section represent your primary data. For example, items in a photo browser app would be the photos themselves, and each section in the app would define a different group of related photos. Items can contain any data that you want. In the case of a photo browser, an item might also include descriptive information such as the date the photo was taken, the exposure settings used, the location, and so on.

The data structures you use for your sections and items are separate from the views and view controllers that you use to present them. Sections have no default visual representation, but layouts may support section-specific supplementary views. For example, the flow layout supports header and footer views for each section. Items are presented using instances of the `NSCollectionViewItem` class, which your data source is responsible for configuring in its `NSCollectionViewDataSource/collectionView(_:itemForRepresentedObjectAt:)` method.

When organizing your data, create data structures that map efficiently to the section and item model. One simple way to organize your data is to use an `NSMutableArray` object to store the items for each section. Whatever data structures you choose, make sure that they can return the needed information quickly. For example, you need to return the total number of sections and the number of items in each section. You also need to be able to fetch items based on section and item indexes quickly.

#### Configuring Items and Supplementary Views

When the collection view determines that an item or supplementary view needs to be displayed, it asks your data source to provide the corresponding visual element. The visual representation of an item is provided by the `NSCollectionViewItem` class. The visual representation of a supplementary view is provided by an `NSView` object. The steps for configuring an item or supplementary view are essentially the same. The only thing that changes is the specific methods you call.

1. Ask the collection view to provide an instance of the element you need using the `NSCollectionView/makeItem(withIdentifier:for:)` or `NSCollectionView/makeSupplementaryView(ofKind:withIdentifier:for:)` method.
2. Configure the views of the element with the data you want to display.
3. Return the element back to the collection view.

When you call the `NSCollectionView/makeItem(withIdentifier:for:)` or `NSCollectionView/makeSupplementaryView(ofKind:withIdentifier:for:)` method, the collection view recycles or creates the appropriate element for you. Using these methods is more efficient than creating the elements yourself. As elements move offscreen, the collection view recycles them and places them on a reuse queue. When you ask for a new element, the collection view returns a recycled element whenever one is available, thereby eliminating the need to create one from scratch.

> **NOTE:**  You must register the items and supplementary views of your app before trying to recycle or create them. For each element, you can register a class or nib file to use when creating new instances of the item. For more information about registering the elements for your collection view, see `NSCollectionView`.

The listing below shows how to create and configure an item in the `NSCollectionViewDataSource/collectionView(_:itemForRepresentedObjectAt:)` method of your data source. After retrieving an item using the `NSCollectionView/makeItem(withIdentifier:for:)` method, you configure the properties of that item with your custom data. In this case, the code assigns an image to the built-in image view provided by the `NSCollectionViewItem` class. If you defined a custom item class with additional views or controls, you would configure those views before returning the item from this method. You must fully configure the item before returning it.

Listing 1. Creating and configuring an item

After returning an item object from your `NSCollectionViewDataSource/collectionView(_:itemForRepresentedObjectAt:)` method, you do not modify that object again. If the underlying data for an item changes, ask the collection view to reload the item by calling the `NSCollectionView/reloadItems(at:)` method. Calling that method causes the collection view to discard the current item and ask your data source to provide a new one.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSCollectionViewDiffableDataSource`, `NSCollectionViewDiffableDataSourceReference`

## Availability

- macOS ?

## Topics

### Getting the Number of Sections and Items

- `numberOfSections(in:)`
- `collectionView(_:numberOfItemsInSection:)`

### Configuring Items and Supplementary Views

- `collectionView(_:itemForRepresentedObjectAt:)`
- `collectionView(_:viewForSupplementaryElementOfKind:at:)`

## See Also

- `NSCollectionViewDelegate`
- `NSCollectionViewDiffableDataSource`
- `NSDiffableDataSourceSnapshot`
