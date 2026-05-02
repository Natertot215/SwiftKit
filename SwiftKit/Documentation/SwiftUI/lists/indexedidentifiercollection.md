---
url: https://developer.apple.com/documentation/swiftui/indexedidentifiercollection
framework: SwiftUI
category: Lists
title: IndexedIdentifierCollection
kind: struct
captured: 2026-05-02
---

# IndexedIdentifierCollection

A collection wrapper that iterates over the indices and identifiers of a collection together.

## Declaration

```swift
struct IndexedIdentifierCollection<Base, ID> where Base : Collection, ID : Hashable
```

### Overview

You don’t use this type directly. Instead SwiftUI creates this type on your behalf.





## Relationships

**Conforms To**: `BidirectionalCollection`, `Collection`, `Copyable`, `Escapable`, `RandomAccessCollection`, `Sequence`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `moveDisabled(_:)`
- `deleteDisabled(_:)`
- `editMode`
- `EditMode`
- `EditActions`
- `EditableCollectionContent`
