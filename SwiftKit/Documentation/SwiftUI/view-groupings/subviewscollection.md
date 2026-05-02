---
url: https://developer.apple.com/documentation/swiftui/subviewscollection
framework: SwiftUI
category: View groupings
title: SubviewsCollection
kind: struct
captured: 2026-05-02
---

# SubviewsCollection

An opaque collection representing the subviews of view.

## Declaration

```swift
struct SubviewsCollection
```

### Overview

Subviews collection constructs subviews on demand, so only access the part of the collection you need to create the resulting content.

You can get access to a view’s subview collection by using the `Group/init(sectionsOf:transform:)` initializer.

The collection’s elements are the pieces that make up the given view, and the collection as a whole acts as a proxy for the original view.





## Relationships

**Conforms To**: `BidirectionalCollection`, `Collection`, `Copyable`, `Escapable`, `RandomAccessCollection`, `Sequence`, `View`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `Subview`
- `SubviewsCollectionSlice`
- `containerValue(_:_:)`
- `ContainerValues`
- `ContainerValueKey`
