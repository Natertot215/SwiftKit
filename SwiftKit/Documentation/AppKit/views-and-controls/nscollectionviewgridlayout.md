---
url: https://developer.apple.com/documentation/appkit/nscollectionviewgridlayout
framework: AppKit
category: Views and controls
title: NSCollectionViewGridLayout
kind: class
captured: 2026-05-02
---

# NSCollectionViewGridLayout

A layout that displays a single section of items in a row and column grid.

## Declaration

```swift
class NSCollectionViewGridLayout
```

### Overview

The `NSCollectionViewGridLayout` object provides the same layout behavior offered by the `NSCollectionView` class prior to macOS 10.11, and you can use it in cases where you want to maintain the old appearance while still taking advantage of newer collection view features.

#### Configuring a Collection View to Use a Grid Layout

You can configure a collection view to use a grid layout object programmatically or at design time:

- At design time, set the Layout attribute of your collection view to Grid.
- Create an `NSCollectionViewGridLayout` object programmatically and assign it to the collection view’s `NSCollectionView/collectionViewLayout` property.

A grid layout displays only items and does not display supplementary views or decoration views. Use the properties of this class to configure the number of rows and columns in the grid. You can also use these properties to configure the spacing between items and the minimum sizes.





## Relationships

**Inherits From**: `NSCollectionViewLayout`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.11

## Topics

### Specifying the Grid Parameters

- `maximumNumberOfRows`
- `maximumNumberOfColumns`
- `minimumItemSize`
- `maximumItemSize`

### Specifying the Grid Layout Attributes

- `minimumInteritemSpacing`
- `minimumLineSpacing`
- `margins`

### Specifying the Grid Background Color

- `backgroundColors`

## See Also

- `Implementing modern collection views`
- `NSCollectionViewFlowLayout`
- `NSCollectionViewDelegateFlowLayout`
- `NSCollectionViewTransitionLayout`
- `NSCollectionViewLayoutAttributes`
- `NSCollectionViewLayout`
- `NSCollectionViewCompositionalLayout`
- `NSCollectionViewCompositionalLayoutConfiguration`
- `NSCollectionViewCompositionalLayoutSectionProvider`
- `NSCollectionLayoutSectionOrthogonalScrollingBehavior`
