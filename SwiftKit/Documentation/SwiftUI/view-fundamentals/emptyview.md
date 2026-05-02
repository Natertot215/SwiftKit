---
url: https://developer.apple.com/documentation/swiftui/emptyview
framework: SwiftUI
category: View fundamentals
title: EmptyView
kind: struct
captured: 2026-05-02
---

# EmptyView

A view that doesn’t contain any content.

## Declaration

```swift
@frozen struct EmptyView
```

### Overview

You will rarely, if ever, need to create an `EmptyView` directly. Instead, `EmptyView` represents the absence of a view.

SwiftUI uses `EmptyView` in situations where a SwiftUI view type defines one or more child views with generic parameters, and allows the child views to be absent. When absent, the child view’s type in the generic type parameter is `EmptyView`.

The following example creates an indeterminate `ProgressView` without a label. The `ProgressView` type declares two generic parameters, `Label` and `CurrentValueLabel`, for the types used by its subviews. When both subviews are absent, like they are here, the resulting type is `ProgressView<EmptyView, EmptyView>`, as indicated by the example’s output:

```swift
let progressView = ProgressView()
print("\(type(of:progressView))")
// Prints: ProgressView<EmptyView, EmptyView>
```





## Relationships

**Conforms To**: `BitwiseCopyable`, `Copyable`, `Sendable`, `SendableMetatype`, `View`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating an empty view

- `init()`

## See Also

- `AnyView`
- `EquatableView`
- `SubscriptionView`
- `TupleView`
