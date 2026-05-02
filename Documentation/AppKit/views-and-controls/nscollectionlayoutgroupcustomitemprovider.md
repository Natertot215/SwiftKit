---
url: https://developer.apple.com/documentation/appkit/nscollectionlayoutgroupcustomitemprovider
framework: AppKit
category: Views and controls
title: NSCollectionLayoutGroupCustomItemProvider
kind: typealias
captured: 2026-05-02
---

# NSCollectionLayoutGroupCustomItemProvider

A closure that creates and returns each of the custom group’s items.

## Declaration

```swift
typealias NSCollectionLayoutGroupCustomItemProvider = (any NSCollectionLayoutEnvironment) -> [NSCollectionLayoutGroupCustomItem]
```

### Discussion

You use a custom item provider to supply the item arrangement when creating a group using the `NSCollectionLayoutGroup/custom(layoutSize:itemProvider:)` initializer.







## Availability

- macOS ?



## See Also

- `NSCollectionLayoutGroupCustomItem`
