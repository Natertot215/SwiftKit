---
url: https://developer.apple.com/documentation/appkit/nscollectionlayoutsection
framework: AppKit
category: Views and controls
title: NSCollectionLayoutSection
kind: class
captured: 2026-05-01
---

# NSCollectionLayoutSection

## Declaration

```swift
@MainActor
class NSCollectionLayoutSection
```

## Abstract

A container that combines a set of groups into distinct visual groupings.

## Overview

A collection view layout has one or more sections. Sections provide a way to separate the layout into distinct pieces.

Each section can have the same layout or a different layout than the other sections in the collection view. A section's layout is determined by the properties of the group (`NSCollectionLayoutGroup`) that's used to create the section.

In the Photos app, each section in the Years page uses the same layout. In the App Store, the Apps page displays several sections with different content arrangements.

Each section can have its own background, header, and footer to distinguish it from other sections.

## Availability

- **macOS**: 10.15+

## Inheritance

- Inherits from: `NSObject`

## Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSCopying`
- `NSObject`
- `Sendable`

## Topics

### Creating a Section
- `init(group:)` - Creates a section containing the specified group.

### Specifying Scrolling Behavior
- `orthogonalScrollingBehavior` - The section's scrolling behavior in relation to the main layout axis.

### Configuring Section Spacing
- `interGroupSpacing` - The amount of space between the groups in the section.
- `contentInsets` - The amount of space between the content of the section and its boundaries.

### Configuring Additional Views
- `boundarySupplementaryItems` - An array of the supplementary items that are associated with the boundary edges of the section, such as headers and footers.
- `decorationItems` - An array of the decoration items that are anchored to the section, such as background decoration views.

### Rendering Items
- `visibleItemsInvalidationHandler` - A closure called before each layout cycle to allow modification of the items in the section immediately before they're displayed.

### Deprecated
- `supplementariesFollowContentInsets` - A Boolean value that indicates whether the section's supplementary items follow the specified content insets for the section.

## See Also

- `NSCollectionLayoutItem` - The most basic component of a collection view's layout.
- `NSCollectionLayoutGroup` - A container for a set of items that lays out the items along a path.
