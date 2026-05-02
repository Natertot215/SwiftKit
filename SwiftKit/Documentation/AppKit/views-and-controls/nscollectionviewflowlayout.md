---
url: https://developer.apple.com/documentation/appkit/nscollectionviewflowlayout
framework: AppKit
category: Views and controls
title: NSCollectionViewFlowLayout
kind: class
captured: 2026-05-02
---

# NSCollectionViewFlowLayout

A layout that organizes items into a flexible and configurable arrangement.

## Declaration

```swift
class NSCollectionViewFlowLayout
```

### Overview

In a flow layout, the first item is positioned in the top-left corner and other items are laid out either horizontally or vertically based on the scroll direction, which is configurable. Items may be the same size or different sizes, and you may use the flow layout object or the collection view’s delegate object to specify the size of items and the spacing around them. The flow layout also lets you specify custom header and footer views for each section.

You can use an `NSCollectionViewFlowLayout` object as-is or subclass it to modify more aspects of the layout behavior. There are several ways to customize the basic layout behavior that do not require subclassing. For example, you can use a delegate object to change the size and spacing of items dynamically. Subclassing is appropriate for more advanced layout changes, such as adding supplementary views or decoration views, supporting custom layout attributes, or customizing the layout animations when inserting or deleting items.

#### Configuring a Collection View to Use a Flow Layout

You can configure a collection view to use a flow layout object programmatically or at design time:

- At design time, set the Layout attribute of your collection view to Flow.
- Create an `NSCollectionViewFlowLayout` object programmatically and assign it to the collection view’s `NSCollectionView/collectionViewLayout` property.

Normally, you specify the size of items and their spacing using the properties of this class. If you want to customize the values for your items, implement the methods of the `NSCollectionViewDelegateFlowLayout` protocol in the object assigned as the collection view’s `NSCollectionView/delegate`. The delegate methods let you adjust layout information dynamically and change the values later as needed. If you do not provide a delegate, the flow layout object uses the same values for all items.

For more information about customizing the layout dynamically using a delegate, see `NSCollectionViewDelegateFlowLayout`.

#### Adding Header and Footer Views to Sections

The flow layout supports custom header and footer views for each section, displaying them as supplementary views in the layout. `/documentation/appkit/nscollectionviewflowlayout#1965629` shows how header and footer views are presented in your layout. The header view appears above the items in a section and the footer view appears below those items.

The size of the header and footer views is configurable using the `NSCollectionViewFlowLayout/headerReferenceSize` and `NSCollectionViewFlowLayout/footerReferenceSize` properties of this class or using the delegate object. For a vertically scrolling flow layout, the header and footer views span the width of the collection view and the height is based on the values you specify. For a horizontal layout, the footers span the height of the collection view and the width is configurable.

To add header or footer views to your flow layout, you must do the following:

1. Register your header and footer views using the `NSCollectionView/register(_:forSupplementaryViewOfKind:withIdentifier:)-3dqa` or `NSCollectionView/register(_:forSupplementaryViewOfKind:withIdentifier:)-7gvf2` method.
2. Implement the `NSCollectionViewDataSource/collectionView(_:viewForSupplementaryElementOfKind:at:)` method in your collection view’s data source object.

When registering your header view, specify `NSCollectionView/elementKindSectionHeader` for the kind string. When registering your footer view, specify the `NSCollectionView/elementKindSectionFooter` string. You also pass those strings to the `NSCollectionView/makeSupplementaryView(ofKind:withIdentifier:for:)` method when creating new views in your data source object.

You configure the contents of your header and footer views in the same way you configure items. Use your app data to configure the content of the supplementary view and its subviews. When you want to update the content in a header or footer, call the `NSCollectionView/reloadSections(_:)` method and force the collection view to update the section, including its headers and footers. Reloading the section is safer than maintaining references to the views themselves because of how the collection view recycles views. If you do want to update views directly, use the methods of the `NSCollectionViewDelegate` protocol to track when your views are added and removed from the collection view.

#### Understanding How the Flow Layout is Generated

The flow layout builds its grid dynamically, using the item size and spacing information to place items sequentially into rows (for a vertically scrolling layout) or columns (for a horizontally scrolling layout). The number of items displayed in each row or column is determined by the collection view’s size and the size of the items in that row. When items have a uniform size, the number of items in each row is the same, but when items are different sizes, some rows may contain more or fewer items. `/documentation/appkit/nscollectionviewflowlayout#1965630` illustrates how the flow layout places items in a row until there is no more space and then begins a new row and continues the layout process.

The flow layout follows a specific set of steps to determine the size of each item. Whenever possible, the flow layout uses previously calculated information. When that information is not available, it falls back on other techniques to retrieve the size of the item. Specifically, the flow layout takes the following steps, stopping when it acquires a valid item size:

1. Get the size of the item from the already computed layout attributes.
2. Call the `NSCollectionViewDelegateFlowLayout/collectionView(_:layout:sizeForItemAt:)` method of the delegate to get the item size.
3. Use the `NSCollectionViewFlowLayout/estimatedItemSize` property, if it is not set to `NSZeroSize`.
4. Use the `NSCollectionViewFlowLayout/itemSize` property to get the size.

Individual spacing between items and between different lines of items is controlled by the properties of this class and the delegate. For line spacing, the largest item in the line defines the line’s height and thereby controls the spacing between that line and other lines. The minimum inter-item spacing controls only how many items are placed on the line, and does not set the spacing between items.

#### Subclassing Notes

When you want to do more than specify the size or spacing of items, subclass `NSCollectionViewFlowLayout` and override the appropriate methods. When subclassing, the best approach is to take advantage of the built-in flow layout behavior and then make tweaks as needed.

##### Adding New Supplementary or Decoration Views to the Layout

The standard flow layout object supports only header and footer supplementary views for each section. To support additional supplementary views, or to add decoration views, you must override the following methods:

- `NSCollectionViewLayout/layoutAttributesForElements(in:)` (Required)
- `NSCollectionViewLayout/layoutAttributesForItem(at:)` (Required)
- `NSCollectionViewLayout/layoutAttributesForSupplementaryView(ofKind:at:)` (Required only if you are adding supplementary views)
- `NSCollectionViewLayout/layoutAttributesForDecorationView(ofKind:at:)` (Required only if you are adding decoration views)

Your implementations of these methods should adjust the position of items and views to accommodate your custom content. For each of your implementations, call `super` first so that you can modify the attributes returned by the default flow layout behavior before adding any custom layout attributes.

##### Tweaking the Layout Attributes

To tweak the flow layout algorithm, override the `NSCollectionViewLayout/layoutAttributesForElements(in:)` method and any other methods that return layout attributes that you need to modify. In each method, call `super` first and then modify the attributes returned by the default flow layout behavior.

##### Changing the Initial or Final Attributes of Elements

To customize the insertion or deletion animations performed by the layout, override some or all of the following methods:

- `NSCollectionViewLayout/initialLayoutAttributesForAppearingItem(at:)`
- `NSCollectionViewLayout/initialLayoutAttributesForAppearingSupplementaryElement(ofKind:at:)`
- `NSCollectionViewLayout/initialLayoutAttributesForAppearingDecorationElement(ofKind:at:)`
- `NSCollectionViewLayout/finalLayoutAttributesForDisappearingItem(at:)`
- `NSCollectionViewLayout/finalLayoutAttributesForDisappearingSupplementaryElement(ofKind:at:)`
- `NSCollectionViewLayout/finalLayoutAttributesForDisappearingDecorationElement(ofKind:at:)`

In your custom implementations, specify the layout attributes for each item or view being inserted or deleted. The flow layout handles the creation of the appropriate animations, using the initial or final attributes that you provide. It is also recommended that you override the `NSCollectionViewLayout/prepare(forCollectionViewUpdates:)` and `NSCollectionViewLayout/finalizeCollectionViewUpdates()` methods to track the insertions and deletions.

##### Supporting Custom Layout Attributes

Subclassing is required if you want the flow layout to manage attributes other than the size and visibility of items and views. If you subclass `NSCollectionViewLayoutAttributes` and define additional layout attributes, you must also subclass `NSCollectionViewFlowLayout` to provide values for those attributes . In your flow layout subclass, override the following:

- `NSCollectionViewLayout/layoutAttributesClass`
- `NSCollectionViewLayout/layoutAttributesForElements(in:)`
- `NSCollectionViewLayout/layoutAttributesForItem(at:)`
- All other methods that return layout attributes

The implementations of your custom methods should set the values of any layout attributes that you define. Call `super` first to retrieve the default layout attributes objects and then modify the returned objects by adding your custom data.

For more information about defining custom layout attributes, see `NSCollectionViewLayoutAttributes`.





## Relationships

**Inherits From**: `NSCollectionViewLayout`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.11

## Topics

### Configuring the Scroll Direction

- `scrollDirection`

### Configuring the Item Spacing

- `minimumLineSpacing`
- `minimumInteritemSpacing`
- `estimatedItemSize`
- `itemSize`
- `sectionInset`

### Configuring the Supplementary Views

- `headerReferenceSize`
- `footerReferenceSize`

### Constants

- `NSCollectionView.ScrollDirection`
- `Flow Layout Elements`

### Instance Properties

- `sectionFootersPinToVisibleBounds`
- `sectionHeadersPinToVisibleBounds`

### Instance Methods

- `collapseSection(at:)`
- `expandSection(at:)`
- `section(atIndexIsCollapsed:)`

## See Also

- `Implementing modern collection views`
- `NSCollectionViewDelegateFlowLayout`
- `NSCollectionViewGridLayout`
- `NSCollectionViewTransitionLayout`
- `NSCollectionViewLayoutAttributes`
- `NSCollectionViewLayout`
- `NSCollectionViewCompositionalLayout`
- `NSCollectionViewCompositionalLayoutConfiguration`
- `NSCollectionViewCompositionalLayoutSectionProvider`
- `NSCollectionLayoutSectionOrthogonalScrollingBehavior`
