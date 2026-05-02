---
url: https://developer.apple.com/documentation/swiftui/pagingscrolltargetbehavior
framework: SwiftUI
category: Scroll views
title: PagingScrollTargetBehavior
kind: struct
captured: 2026-05-02
---

# PagingScrollTargetBehavior

The scroll behavior that aligns scroll targets to container-based geometry.

## Declaration

```swift
struct PagingScrollTargetBehavior
```

### Overview

In the following example, every view in the lazy stack is flexible in both directions and the scroll view settles to container-aligned boundaries.

```swift
ScrollView {
    LazyVStack(spacing: 0.0) {
        ForEach(items) { item in
            FullScreenItem(item)
        }
    }
}
.scrollTargetBehavior(.paging)
```





## Relationships

**Conforms To**: `ChartScrollTargetBehavior`, `Copyable`, `Escapable`, `ScrollTargetBehavior`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Creating the target behavior

- `init()`

## See Also

- `scrollTargetBehavior(_:)`
- `scrollTargetLayout(isEnabled:)`
- `ScrollTarget`
- `ScrollTargetBehavior`
- `ScrollTargetBehaviorContext`
- `ViewAlignedScrollTargetBehavior`
- `AnyScrollTargetBehavior`
- `ScrollTargetBehaviorProperties`
- `ScrollTargetBehaviorPropertiesContext`
