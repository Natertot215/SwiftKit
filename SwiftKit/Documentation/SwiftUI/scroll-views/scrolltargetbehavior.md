---
url: https://developer.apple.com/documentation/swiftui/scrolltargetbehavior
framework: SwiftUI
category: Scroll views
title: ScrollTargetBehavior
kind: protocol
captured: 2026-05-02
---

# ScrollTargetBehavior

A type that defines the scroll behavior of a scrollable view.

## Declaration

```swift
protocol ScrollTargetBehavior
```

### Overview

A scrollable view calculates where scroll gestures should end using its deceleration rate and the state of its scroll gesture by default. A scroll behavior allows for customizing this logic.

You define a scroll behavior using the `ScrollTargetBehavior/updateTarget(_:context:)` method.

Using this method, you can control where someone can scroll in a scrollable view. For example, you can create a custom scroll behavior that aligns to every 10 points by doing the following:

```swift
struct BasicScrollTargetBehavior: ScrollTargetBehavior {
    func updateTarget(_ target: inout Target, context: TargetContext) {
        // Align to every 1/10 the size of the scroll view.
        target.rect.x.round(
            toMultipleOf: round(context.containerSize.width / 10.0))
    }
}
```

#### Paging Behavior

SwiftUI offers built in scroll behaviors. One such behavior is the `PagingScrollTargetBehavior` which uses the geometry of the scroll view to decide where to allow scrolls to end.

In the following example, every view in the lazy stack is flexible in both directions and the scroll view will settle to container aligned boundaries.

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

#### View Aligned Behavior

SwiftUI also offers a `ViewAlignedScrollTargetBehavior` scroll behavior that will always settle on the geometry of individual views.

```swift
ScrollView(.horizontal) {
    LazyHStack(spacing: 10.0) {
        ForEach(items) { item in
            ItemView(item)
        }
    }
    .scrollTargetLayout()
}
.scrollTargetBehavior(.viewAligned)
.safeAreaPadding(.horizontal, 20.0)
```

You configure which views should be used for settling using the `View/scrollTargetLayout(isEnabled:)` modifier. Apply this modifier to a layout container like `LazyVStack` or `HStack` and each individual view in that layout will be considered for alignment.

Use types conforming to this protocol with the `View/scrollTargetBehavior(_:)` modifier.





## Relationships

**Conforming Types**: `AnyScrollTargetBehavior`, `PagingScrollTargetBehavior`, `ViewAlignedScrollTargetBehavior`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Getting the scroll target behavior

- `paging`
- `viewAligned`
- `viewAligned(limitBehavior:)`

### Updating the proposed target

- `updateTarget(_:context:)`
- `ScrollTargetBehavior.TargetContext`

### Instance Methods

- `properties(context:)`

### Type Aliases

- `ScrollTargetBehavior.Properties`
- `ScrollTargetBehavior.PropertiesContext`

### Type Methods

- `viewAligned(anchor:)`
- `viewAligned(limitBehavior:anchor:)`

## See Also

- `scrollTargetBehavior(_:)`
- `scrollTargetLayout(isEnabled:)`
- `ScrollTarget`
- `ScrollTargetBehaviorContext`
- `PagingScrollTargetBehavior`
- `ViewAlignedScrollTargetBehavior`
- `AnyScrollTargetBehavior`
- `ScrollTargetBehaviorProperties`
- `ScrollTargetBehaviorPropertiesContext`
