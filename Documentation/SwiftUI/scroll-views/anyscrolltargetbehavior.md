---
url: https://developer.apple.com/documentation/swiftui/anyscrolltargetbehavior
framework: SwiftUI
category: Scroll views
title: AnyScrollTargetBehavior
kind: struct
captured: 2026-05-02
---

# AnyScrollTargetBehavior

A type-erased scroll target behavior.

## Declaration

```swift
@frozen struct AnyScrollTargetBehavior
```

### Overview

Provide this to the `View/scrollTargetBehavior(_:)` modifier. When the underlying behavior changes, the scroll view to which this behavior applies will be updated.

Use this to dynamically control the scroll target behavior at runtime. For example, you could provide a paging behavior in compact size classes and a view aligned behavior otherwise.

```swift
@Environment(\.horizontalSizeClass) var sizeClass

var body: some View {
    ScrollView { ... }
        .scrollTargetBehavior(scrollTargetBehavior)
}

 var scrollTargetBehavior: some ScrollTargetBehavior {
    sizeClass == .compact
        ? AnyScrollTargetBehavior(.paging)
        : AnyScrollTargetBehavior(.viewAligned)
}
```





## Relationships

**Conforms To**: `ScrollTargetBehavior`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Initializers

- `init(_:)`

### Instance Properties

- `base`

## See Also

- `scrollTargetBehavior(_:)`
- `scrollTargetLayout(isEnabled:)`
- `ScrollTarget`
- `ScrollTargetBehavior`
- `ScrollTargetBehaviorContext`
- `PagingScrollTargetBehavior`
- `ViewAlignedScrollTargetBehavior`
- `ScrollTargetBehaviorProperties`
- `ScrollTargetBehaviorPropertiesContext`
