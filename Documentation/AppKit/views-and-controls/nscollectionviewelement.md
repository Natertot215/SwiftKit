---
url: https://developer.apple.com/documentation/appkit/nscollectionviewelement
framework: AppKit
category: Views and controls
title: NSCollectionViewElement
kind: protocol
captured: 2026-05-02
---

# NSCollectionViewElement

A set of methods that you use to manage the content in a collection view.

## Declaration

```swift
protocol NSCollectionViewElement : NSUserInterfaceItemIdentification, NSObjectProtocol
```

### Overview

Adopt this protocol in the classes that you use to display content for items, supplementary views, and decoration views in a collection view. The methods of this protocol are optional and provide support for applying layout attributes and for cleaning up elements when they move offscreen and are recycled.

Collection view items—that is, instances of the `NSCollectionViewItem` class—already adopt this protocol. For supplementary and decoration views, adopt this protocol in the custom view classes you use to represent that content.





## Relationships

**Inherits From**: `NSObjectProtocol`, `NSUserInterfaceItemIdentification`

**Inherited By**: `NSCollectionViewSectionHeaderView`

**Conforming Types**: `NSCollectionViewItem`

## Availability

- macOS ?

## Topics

### Reusing Elements

- `prepareForReuse()`

### Managing Layout Changes

- `preferredLayoutAttributesFitting(_:)`
- `apply(_:)`
- `willTransition(from:to:)`
- `didTransition(from:to:)`

## See Also

- `NSCollectionViewItem`
