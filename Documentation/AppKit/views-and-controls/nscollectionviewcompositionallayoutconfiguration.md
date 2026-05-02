---
url: https://developer.apple.com/documentation/appkit/nscollectionviewcompositionallayoutconfiguration
framework: AppKit
category: Views and controls
title: NSCollectionViewCompositionalLayoutConfiguration
kind: class
captured: 2026-05-02
---

# NSCollectionViewCompositionalLayoutConfiguration

An object that defines scroll direction, section spacing, and headers or footers for the layout.

## Declaration

```swift
@MainActor class NSCollectionViewCompositionalLayoutConfiguration
```

### Overview

You use a layout configuration to modify a collection view layout’s default scroll direction, add extra spacing between each section of the layout, and add headers or footers to the entire layout.

You can pass in this configuration when creating an `NSCollectionViewCompositionalLayout`, or you can set the `NSCollectionViewCompositionalLayout/configuration` property on an existing layout. If you modify the configuration on an existing layout, the system invalidates the layout so that it will be updated with the new configuration.

```swift
let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .estimated(44))

let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerFooterSize,
                                                        elementKind: "header",
                                                          alignment: .top)
let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerFooterSize,
                                                        elementKind: "footer",
                                                          alignment: .bottom)

let config = NSCollectionViewCompositionalLayoutConfiguration()
config.interSectionSpacing = 20
config.scrollDirection = .horizontal
config.boundarySupplementaryItems = [header, footer]
```





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS 10.15

## Topics

### Specifying Scroll Direction

- `scrollDirection`

### Configuring Spacing

- `interSectionSpacing`

### Configuring Additional Views

- `boundarySupplementaryItems`

## See Also

- `Implementing modern collection views`
- `NSCollectionViewFlowLayout`
- `NSCollectionViewDelegateFlowLayout`
- `NSCollectionViewGridLayout`
- `NSCollectionViewTransitionLayout`
- `NSCollectionViewLayoutAttributes`
- `NSCollectionViewLayout`
- `NSCollectionViewCompositionalLayout`
- `NSCollectionViewCompositionalLayoutSectionProvider`
- `NSCollectionLayoutSectionOrthogonalScrollingBehavior`
