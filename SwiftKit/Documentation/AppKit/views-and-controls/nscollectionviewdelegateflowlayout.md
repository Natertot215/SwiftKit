---
url: https://developer.apple.com/documentation/appkit/nscollectionviewdelegateflowlayout
framework: AppKit
category: Views and controls
title: NSCollectionViewDelegateFlowLayout
kind: protocol
captured: 2026-05-02
---

# NSCollectionViewDelegateFlowLayout

A set of methods that a delegate implements to provide layout information to a flow layout object in a collection view.

## Declaration

```swift
protocol NSCollectionViewDelegateFlowLayout : NSCollectionViewDelegate
```

### Overview

Implement the methods of this protocol when you want to customize the layout behavior and perhaps return different values for different items or sections.

All of the methods in this protocol are optional, so you can implement only the methods you need to achieve the desired layout. If you do not implement a particular method, the flow layout object obtains default values from its own properties and applies them uniformly. Implement your methods in the object you assign to the `NSCollectionView/delegate` property of the collection view itself.





## Relationships

**Inherits From**: `NSCollectionViewDelegate`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Getting the Size of Items

- `collectionView(_:layout:sizeForItemAt:)`

### Getting the Section Spacing

- `collectionView(_:layout:insetForSectionAt:)`
- `collectionView(_:layout:minimumLineSpacingForSectionAt:)`
- `collectionView(_:layout:minimumInteritemSpacingForSectionAt:)`

### Getting the Header and Footer Sizes

- `collectionView(_:layout:referenceSizeForHeaderInSection:)`
- `collectionView(_:layout:referenceSizeForFooterInSection:)`

## See Also

- `Implementing modern collection views`
- `NSCollectionViewFlowLayout`
- `NSCollectionViewGridLayout`
- `NSCollectionViewTransitionLayout`
- `NSCollectionViewLayoutAttributes`
- `NSCollectionViewLayout`
- `NSCollectionViewCompositionalLayout`
- `NSCollectionViewCompositionalLayoutConfiguration`
- `NSCollectionViewCompositionalLayoutSectionProvider`
- `NSCollectionLayoutSectionOrthogonalScrollingBehavior`
