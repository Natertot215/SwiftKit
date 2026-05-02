---
url: https://developer.apple.com/documentation/appkit/nscollectionviewsectionheaderview
framework: AppKit
category: Views and controls
title: NSCollectionViewSectionHeaderView
kind: protocol
captured: 2026-05-02
---

# NSCollectionViewSectionHeaderView

A protocol that defines a button to control the collapse of a collection view’s section.

## Declaration

```swift
protocol NSCollectionViewSectionHeaderView : NSCollectionViewElement
```

### Overview

A collection view can support a section that can collapse into a single horizontally scrollable row, similar to the groupings in the icon view in Finder. To ensure that the collection view can communicate with the button that controls the collapsing of a section, the section header view object should conform to this protocol and connect the button’s outlet to `NSCollectionViewSectionHeaderView/sectionCollapseButton`.





## Relationships

**Inherits From**: `NSCollectionViewElement`, `NSObjectProtocol`, `NSUserInterfaceItemIdentification`

## Availability

- macOS ?

## Topics

### Providing a Collapse Button

- `sectionCollapseButton`

## See Also

- `NSCollectionView`
