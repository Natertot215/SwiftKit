---
url: https://developer.apple.com/documentation/swiftui/anyview
framework: SwiftUI
category: View fundamentals
title: AnyView
kind: struct
captured: 2026-05-02
---

# AnyView

A type-erased view.

## Declaration

```swift
@frozen struct AnyView
```

### Overview

An `AnyView` allows changing the type of view used in a given view hierarchy. Whenever the type of view used with an `AnyView` changes, the old hierarchy is destroyed and a new hierarchy is created for the new type.





## Relationships

**Conforms To**: `View`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a view

- `init(_:)`
- `init(erasing:)`

## See Also

- `EmptyView`
- `EquatableView`
- `SubscriptionView`
- `TupleView`
