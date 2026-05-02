---
url: https://developer.apple.com/documentation/appkit/nscollectionviewlayoutattributes
framework: AppKit
category: Views and controls
title: NSCollectionViewLayoutAttributes
kind: class
captured: 2026-05-02
---

# NSCollectionViewLayoutAttributes

An object that contains layout-related attributes for an element in a collection view.

## Declaration

```swift
@MainActor class NSCollectionViewLayoutAttributes
```

### Overview

During the layout, the layout object creates instances of `NSCollectionViewLayoutAttributes` for each element displayed in the collection view. The layout attributes describe the position of an element and other information such as its alpha and position on the z axis. The collection view later applies the layout attributes to the onscreen elements.

The only time you interact with layout attribute objects is when you implement a custom layout, and the interactions are straightforward. When asked for layout attributes for a specific element, your layout object uses the methods of this class to create an appropriate instance of the class based on the type of the requested element. It then configures the properties of the object and returns it to the requester.

#### Subclassing Notes

If you implement a custom layout object and your layout object requires additional attributes, you can subclass `NSCollectionViewLayoutAttributes` and add custom properties to your subclass. In your subclass, be sure to do the following:

- Provide an `NSObject-swift.class/init()` method with no parameters to initialize your subclass.
- Implement support for the `NSCopying` protocol. The collection view caches layout attribute objects for later use.
- Override the inherited `NSObjectProtocol/isEqual(_:)` method to perform any relevant equality checks.

Supporting equality checks is important because of how the collection view manages layout attributes. As an optimization, the collection view applies layout attributes only when they change. When the layout object returns a layout attributes object, the collection view checks to see if the new attributes are equal to any cached attributes. Therefore, if you want to include any new properties in the equality check, you must override the `NSObjectProtocol/isEqual(_:)` method.

In addition to defining your `NSCollectionViewLayoutAttributes` subclass, override the `NSCollectionViewLayout/layoutAttributesClass` method of your layout object. That method is a funnel point for creating new layout attribute objects. Returning your custom class from that method ensures that the correct class is instantiated.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS 10.11

## Topics

### Creating Layout Attributes

- `init(forItemWith:)`
- `init(forSupplementaryViewOfKind:with:)`
- `init(forDecorationViewOfKind:with:)`
- `init(forInterItemGapBefore:)`
- `NSCollectionView.DecorationElementKind`

### Identifying the Element

- `representedElementCategory`
- `indexPath`
- `representedElementKind`
- `elementKindInterItemGapIndicator`
- `elementKindSectionFooter`
- `elementKindSectionHeader`

### Accessing the Layout Attributes

- `frame`
- `size`
- `alpha`
- `isHidden`
- `zIndex`

### Constants

- `NSCollectionElementCategory`
- `Inter-Item Gap Support`

### Initializers

- `init(forDecorationViewOfKind:withIndexPath:)`
- `init(forInterItemGapBeforeIndexPath:)`
- `init(forItemWithIndexPath:)`
- `init(forSupplementaryViewOfKind:withIndexPath:)`

## See Also

- `Implementing modern collection views`
- `NSCollectionViewFlowLayout`
- `NSCollectionViewDelegateFlowLayout`
- `NSCollectionViewGridLayout`
- `NSCollectionViewTransitionLayout`
- `NSCollectionViewLayout`
- `NSCollectionViewCompositionalLayout`
- `NSCollectionViewCompositionalLayoutConfiguration`
- `NSCollectionViewCompositionalLayoutSectionProvider`
- `NSCollectionLayoutSectionOrthogonalScrollingBehavior`
