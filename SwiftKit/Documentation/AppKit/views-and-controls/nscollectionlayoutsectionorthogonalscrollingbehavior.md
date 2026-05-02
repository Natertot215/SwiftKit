---
url: https://developer.apple.com/documentation/appkit/nscollectionlayoutsectionorthogonalscrollingbehavior
framework: AppKit
category: Views and controls
title: NSCollectionLayoutSectionOrthogonalScrollingBehavior
kind: enum
captured: 2026-05-02
---

# NSCollectionLayoutSectionOrthogonalScrollingBehavior

The scrolling behavior of the layout’s sections in relation to the main layout axis.

## Declaration

```swift
enum NSCollectionLayoutSectionOrthogonalScrollingBehavior
```

### Overview

By default, each section lays out its content along the main axis of its layout, defined by the layout configuration’s `NSCollectionViewCompositionalLayoutConfiguration/scrollDirection` property. You can change this behavior for a particular section by setting its `NSCollectionLayoutSection/orthogonalScrollingBehavior` property to a different value than its default `NSCollectionLayoutSectionOrthogonalScrollingBehavior/none`. Setting any other value for this property makes the section lay out its content orthogonally to the main layout axis.





## Relationships

**Conforms To**: `BitwiseCopyable`, `Equatable`, `Hashable`, `RawRepresentable`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.15

## Topics

### Enumeration Cases

- `NSCollectionLayoutSectionOrthogonalScrollingBehavior.none`
- `NSCollectionLayoutSectionOrthogonalScrollingBehavior.continuous`
- `NSCollectionLayoutSectionOrthogonalScrollingBehavior.continuousGroupLeadingBoundary`
- `NSCollectionLayoutSectionOrthogonalScrollingBehavior.paging`
- `NSCollectionLayoutSectionOrthogonalScrollingBehavior.groupPaging`
- `NSCollectionLayoutSectionOrthogonalScrollingBehavior.groupPagingCentered`

### Initializers

- `init(rawValue:)`

## See Also

- `Implementing modern collection views`
- `NSCollectionViewFlowLayout`
- `NSCollectionViewDelegateFlowLayout`
- `NSCollectionViewGridLayout`
- `NSCollectionViewTransitionLayout`
- `NSCollectionViewLayoutAttributes`
- `NSCollectionViewLayout`
- `NSCollectionViewCompositionalLayout`
- `NSCollectionViewCompositionalLayoutConfiguration`
- `NSCollectionViewCompositionalLayoutSectionProvider`
