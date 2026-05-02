---
url: https://developer.apple.com/documentation/appkit/nscollectionview
framework: AppKit
category: Views and controls
title: NSCollectionView
kind: class
captured: 2026-05-02
---

# NSCollectionView

An ordered collection of data items displayed in a customizable layout.

## Declaration

```swift
@MainActor class NSCollectionView
```

### Overview

The simplest type of collection view displays its items in a grid, but you can define layouts to arrange items however you like. For example, you might create a layout where items are arranged in a circle. You can also change layouts dynamically at runtime whenever you need to present items differently.

You can add collection views to your interface using Interface Builder or create them programmatically in your view controller or window controller code. It is recommended that you configure your collection view with a data source object, which is an object that conforms to the `NSCollectionViewDataSource` protocol. Data sources support multiple sections and the modern layout architecture and are the preferred way for specifying your data.

In addition to displaying items, collection views support the display of supplementary and decoration views. Support for supplementary and decoration views is defined by the current layout object, but both types of views add to the visual presentation of your content. Supplementary views are associated with a specific section and can be used to create header and footer views for a related group of items. Decoration views are purely visual adornments and can be used to implement dynamic backgrounds or other types of configurable visual content.

The layout of a collection view can be changed dynamically by assigning a new layout object to the `NSCollectionView/collectionViewLayout` property. Changing the layout object updates the appearance of the collection view without animating the changes.

#### The Objects of a Collection View Interface

An `NSCollectionView` object itself is a facilitator, taking information from disparate sources and merging them together to create an overall interface:

- The data source object provides both the data and the views used to display that data. You define the data source object by implementing the methods of the `NSCollectionViewDataSource` protocol in one of your app’s objects.
- The visual representation of items is provided by the `NSCollectionViewItem` class. Item objects are view controllers and you use their views to display your app’s data. The data source creates items on demand and returns them to the collection view for display.
- The collection view delegate makes decisions about behaviors. The delegate also coordinates the dragging and dropping of items. You define the delegate by implementing the methods of the `NSCollectionViewDelegate` protocol in one of your app’s objects.
- The layout object specifies the position and appearance of items onscreen. AppKit defines layout objects that you can use as-is, but you can also define custom layouts by subclassing `NSCollectionViewLayout`.

`/documentation/appkit/nscollectionview#1965644` illustrates how the collection view works with its other objects to create its final appearance. The collection view obtains the views for items and supplementary views from its data source, which creates the views and fills them with data. The layout object provides the layout attributes needed to position those items and supplementary views onscreen. The collection view merges the two sets of information to create the final appearance that the user sees onscreen.

There are other helper classes and protocols that you can use to customize the layout behavior and other aspects of the collection view interface. For example, when using a flow layout object (`NSCollectionViewFlowLayout`), you can modify the flow layout’s behavior using the methods of the `NSCollectionViewDelegateFlowLayout` protocol. When implementing a custom layout, you might also work with `NSCollectionViewUpdateItem` and `NSCollectionViewLayoutInvalidationContext` objects, which help the layout object manage updates.

#### Managing the Collection View’s Content

Data for the collection view is managed by the *data source object*data source object—that is an object that adopts the methods of the `NSCollectionViewDataSource` protocol. You are responsible for defining the data source used by your collection view. The data source provides information about the number of sections and items in the collection view and it provides the visual representation of that data. Every data source object is required to implement the following methods:

- `NSCollectionViewDataSource/collectionView(_:numberOfItemsInSection:)`
- `NSCollectionViewDataSource/collectionView(_:itemForRepresentedObjectAt:)`

The `NSCollectionViewItem` class defines the visual appearance of items in the collection view. Your data source object vends items from its `NSCollectionViewDataSource/collectionView(_:itemForRepresentedObjectAt:)` method, creating and configuring the item in one step. Each item is essentially a snapshot of the data it represents. Items are often short-lived because they can be recycled by the collection view and reused to display new data. As a result, never store references to items in your app.

Supplementary views are another way to display data in your interface. Each layout object defines the supplementary views it supports, and different layouts can define supplementary views for different purposes. For example, an `NSCollectionViewFlowLayout` object lets you add header and footer views to each section. Your data source must know enough about the layout to know which supplementary views are supported by the layout object and how those views are displayed. The data source can then provide supplementary views when asked for them.

When your content changes in a way that requires you to update what the collection view displays, call the `NSCollectionView/reloadData()`, `NSCollectionView/reloadSections(_:)`, or `NSCollectionView/reloadItems(at:)` method to perform that update. These methods cause the collection view to discard the views currently being used to display your content and ask for new ones. Never try to modify the views associated with your items directly. The collection view does not maintain views for all items, only those that are currently being displayed. Reloading the items ensures that the views are updated correctly.

For more information on defining your data source object, see `NSCollectionViewDataSource`.

#### Inserting, Deleting, and Moving Content

The collection view includes methods for inserting, deleting, and moving items and sections. All of these methods affect only what the collection view displays onscreen; they do not change the data in the associated data source object. As a result, when updating your collection view’s content, always do the following:

1. Update the internal structures of your data source object first.
2. Call the `NSCollectionView` methods to insert, delete, or move items and sections.

When you call methods like `NSCollectionView/insertItems(at:)` or `NSCollectionView/deleteSections(_:)`, the collection view fetches any new data from your data source object and then updates the layout. When inserting, moving, or deleting items, the collection view updates the layout for all affected items, which might include items not directly affected by the operation. For example, inserting one item might require adjusting the onscreen position of many other items. When the layout attributes for any visible items changes, the collection view animates those changes into place automatically.

The layout object determines how inserted and deleted items are animated into position. Because newly inserted items are not onscreen initially, the layout object provides the initial layout attributes for those items. Similarly, the layout object provides the final layout attributes for any items that are being deleted. For example, the layout object might specify final layout attributes that are offscreen so that a deleted item animates out of the visible rectangle.

Because individual methods for inserting, deleting, and moving content animate their changes right away, you must use the `NSCollectionView/performBatchUpdates(_:completionHandler:)` method when you want to animate multiple changes together. The `NSCollectionView/performBatchUpdates(_:completionHandler:)` method takes a block containing all of the insert, delete, move, and reload method calls you need to update the collection view. All of those operations are captured and performed as a single animated sequence.

#### Interface Builder Configuration Options

Xcode lets you configure information about your collection view in your storyboard and nib files. The table below shows the basic collection view attributes. Additional attributes are available based on the selected value for the Layout attribute.

[table — see source]

The table below shows the attributes you can configure when you set the Layout attribute to Flow.

[table — see source]

The table below shows the attributes you can configure when you set the Layout attribute to Grid.

[table — see source]

The table below shows the attributes you can configure when you set the Layout attribute to Custom.

[table — see source]

The table below shows the attributes you can configure when you set the Layout attribute to Content Array (Legacy).

[table — see source]

#### Legacy Collection View Support

Prior to OS X v10.11, the collection view always displayed its contents in a grid structure that could not be changed. The data for the collection view was stored in the `NSCollectionView/content` property, which was often populated with data using bindings. You specified the visual appearance for the collection view’s data by creating an `NSCollectionViewItem` object and assigning it to the `NSCollectionView/itemPrototype` property. That item object acted as a template and was used to create all of the items in the collection view.

You are encouraged to use the modern collection view architecture when configuring collection views in macOS 10.11 and later. Use the legacy architecture only for apps that must run in earlier versions of macOS.

For more information about how to configure a collection view using the legacy architecture, see Collection View Programming Guide for macOS.





## Relationships

**Inherits From**: `NSView`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSDraggingSource`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.5

## Topics

### Providing the Collection View’s Data

- `dataSource`
- `NSCollectionViewDataSource`

### Configuring the Collection View

- `delegate`
- `NSCollectionViewDelegate`
- `content`
- `backgroundView`
- `backgroundColors`
- `backgroundViewScrollsWithContent`

### Creating Collection View Items

- `makeItem(withIdentifier:for:)`
- `register(_:forItemWithIdentifier:)`
- `register(_:forItemWithIdentifier:)`
- `makeSupplementaryView(ofKind:withIdentifier:for:)`
- `register(_:forSupplementaryViewOfKind:withIdentifier:)`
- `register(_:forSupplementaryViewOfKind:withIdentifier:)`
- `NSCollectionView.SupplementaryElementKind`
- `NSUserInterfaceItemIdentifier`

### Changing the Layout

- `collectionViewLayout`

### Reloading Content

- `reloadData()`
- `reloadSections(_:)`
- `reloadItems(at:)`

### Prefetching Collection View Cells and Data

- `prefetchDataSource`
- `NSCollectionViewPrefetching`

### Getting the State of the Collection View

- `numberOfSections`
- `numberOfItems(inSection:)`

### Inserting, Moving, and Deleting Items

- `insertItems(at:)`
- `moveItem(at:to:)`
- `deleteItems(at:)`

### Inserting, Moving, Deleting, and Collapsing Sections

- `insertSections(_:)`
- `moveSection(_:toSection:)`
- `deleteSections(_:)`
- `toggleSectionCollapse(_:)`

### Managing the Selection

- `isSelectable`
- `allowsMultipleSelection`
- `allowsEmptySelection`
- `selectionIndexPaths`
- `selectAll(_:)`
- `deselectAll(_:)`
- `selectItems(at:scrollPosition:)`
- `deselectItems(at:)`

### Locating Items and Views

- `visibleItems()`
- `indexPathsForVisibleItems()`
- `visibleSupplementaryViews(ofKind:)`
- `indexPathsForVisibleSupplementaryElements(ofKind:)`
- `indexPath(for:)`
- `indexPathForItem(at:)`
- `item(at:)`
- `supplementaryView(forElementKind:at:)`
- `scrollToItems(at:scrollPosition:)`

### Getting Layout Information

- `layoutAttributesForItem(at:)`
- `layoutAttributesForSupplementaryElement(ofKind:at:)`

### Animating Multiple Changes

- `performBatchUpdates(_:completionHandler:)`

### Working with the Responder Chain

- `isFirstResponder`

### Getting a Drag Image

- `draggingImageForItems(at:with:offset:)`

### Legacy Collection View Support

- `itemPrototype`
- `newItem(forRepresentedObject:)`
- `selectionIndexes`
- `maxNumberOfRows`
- `maxNumberOfColumns`
- `minItemSize`
- `maxItemSize`
- `item(at:)`
- `frameForItem(at:)`
- `frameForItem(at:withNumberOfItems:)`
- `draggingImageForItems(at:with:offset:)`
- `setDraggingSourceOperationMask(_:forLocal:)`

### Constants

- `NSCollectionView.DropOperation`
- `NSCollectionView.ScrollPosition`

### Type Aliases

- `NSCollectionView.DecorationElementKind`

### Type Properties

- `elementKindInterItemGapIndicator`
- `elementKindSectionFooter`
- `elementKindSectionHeader`

### Enumerations

- `NSCollectionView.ScrollDirection`
- `NSCollectionView.UpdateAction`

## See Also

- `NSCollectionViewSectionHeaderView`
