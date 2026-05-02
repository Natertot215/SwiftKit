---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/defaultminlistrowheight
framework: SwiftUI
category: Environment values
title: defaultMinListRowHeight
kind: property
captured: 2026-05-02
---

# defaultMinListRowHeight

The default minimum height of rows in a list.

## Declaration

```swift
var defaultMinListRowHeight: CGFloat { get set }
```

### Discussion

The height of list rows is bounded below by this default value, and is otherwise determined by the height of the row’s content and the row insets.







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `listRowInsets(_:)`
- `defaultMinListHeaderHeight`
- `listRowSpacing(_:)`
- `listSectionSpacing(_:)`
- `ListSectionSpacing`
- `listSectionMargins(_:_:)`
