---
url: https://developer.apple.com/documentation/swiftui/equatableview
framework: SwiftUI
category: View fundamentals
title: EquatableView
kind: struct
captured: 2026-05-02
---

# EquatableView

A view type that compares itself against its previous value and prevents its child updating if its new value is the same as its old value.

## Declaration

```swift
@frozen struct EquatableView<Content> where Content : Equatable, Content : View
```







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

### Creating an equatable view

- `init(content:)`
- `content`

## See Also

- `AnyView`
- `EmptyView`
- `SubscriptionView`
- `TupleView`
