---
url: https://developer.apple.com/documentation/appkit/nscollectionviewcompositionallayout
framework: AppKit
category: Views and controls
title: NSCollectionViewCompositionalLayout
kind: class
captured: 2026-05-02
---

# NSCollectionViewCompositionalLayout

A layout object that lets you combine items in highly adaptive and flexible visual arrangements.

## Declaration

```swift
class NSCollectionViewCompositionalLayout
```

### Overview

A compositional layout is a type of collection view layout. It’s designed to be composable, flexible, and fast, letting you build any kind of visual arrangement for your content by combining—or compositing—each smaller component into a full layout.

A compositional layout is composed of one or more sections that break up the layout into distinct visual groupings. Each section is composed of groups of individual items, the smallest unit of data you want to present. A group might lay out its items in a horizontal row, a vertical column, or a custom arrangement.

You combine the components by building up from items into a group, from groups into a section, and finally into a full layout, like in this example of a basic list layout:

```swift
func createBasicListLayout() -> NSCollectionViewLayout {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                         heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
  
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                          heightDimension: .absolute(44))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                     subitems: [item])
  
    let section = NSCollectionLayoutSection(group: group)

    let layout = NSCollectionViewCompositionalLayout(section: section)
    return layout
}
```





## Relationships

**Inherits From**: `NSCollectionViewLayout`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.15

## Topics

### Creating a Layout

- `init(section:)`
- `init(section:configuration:)`
- `init(sectionProvider:)`
- `init(sectionProvider:configuration:)`

### Configuring the Layout

- `configuration`

## See Also

- `Implementing modern collection views`
- `NSCollectionViewFlowLayout`
- `NSCollectionViewDelegateFlowLayout`
- `NSCollectionViewGridLayout`
- `NSCollectionViewTransitionLayout`
- `NSCollectionViewLayoutAttributes`
- `NSCollectionViewLayout`
- `NSCollectionViewCompositionalLayoutConfiguration`
- `NSCollectionViewCompositionalLayoutSectionProvider`
- `NSCollectionLayoutSectionOrthogonalScrollingBehavior`
