---
url: https://developer.apple.com/documentation/swiftui/subscriptionview
framework: SwiftUI
category: View fundamentals
title: SubscriptionView
kind: struct
captured: 2026-05-02
---

# SubscriptionView

A view that subscribes to a publisher with an action.

## Declaration

```swift
@frozen struct SubscriptionView<PublisherType, Content> where PublisherType : Publisher, Content : View, PublisherType.Failure == Never
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

### Creating a subscription view

- `init(content:publisher:action:)`

### Managing the subscription

- `publisher`
- `action`
- `content`

## See Also

- `AnyView`
- `EmptyView`
- `EquatableView`
- `TupleView`
