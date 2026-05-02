---
url: https://developer.apple.com/documentation/appkit/nscollectionviewtransitionlayout
framework: AppKit
category: Views and controls
title: NSCollectionViewTransitionLayout
kind: class
captured: 2026-05-02
---

# NSCollectionViewTransitionLayout

An object that implements custom behaviors when changing from one layout to another in a collection view.

## Declaration

```swift
class NSCollectionViewTransitionLayout
```

### Overview

Transition layout objects are commonly used to implement interactive transitions between layouts, where the transition itself is driven by a gesture recognizer.

> **NOTE:**  In macOS 10.11, collection views do not provide built-in support for driving layout transitions.





## Relationships

**Inherits From**: `NSCollectionViewLayout`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.11

## Topics

### Initializing the Transition Layout Object

- `init(currentLayout:nextLayout:)`

### Updating the Transition Information

- `transitionProgress`
- `updateValue(_:forAnimatedKey:)`
- `value(forAnimatedKey:)`
- `NSCollectionViewTransitionLayout.AnimatedKey`

### Accessing the Layout Objects

- `currentLayout`
- `nextLayout`

## See Also

- `Implementing modern collection views`
- `NSCollectionViewFlowLayout`
- `NSCollectionViewDelegateFlowLayout`
- `NSCollectionViewGridLayout`
- `NSCollectionViewLayoutAttributes`
- `NSCollectionViewLayout`
- `NSCollectionViewCompositionalLayout`
- `NSCollectionViewCompositionalLayoutConfiguration`
- `NSCollectionViewCompositionalLayoutSectionProvider`
- `NSCollectionLayoutSectionOrthogonalScrollingBehavior`
