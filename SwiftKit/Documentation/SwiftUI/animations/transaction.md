---
url: https://developer.apple.com/documentation/swiftui/transaction
framework: SwiftUI
category: Animations
title: Transaction
kind: struct
captured: 2026-05-02
---

# Transaction

The context of the current state-processing update.

## Declaration

```swift
@frozen struct Transaction
```

### Overview

Use a transaction to pass an animation between views in a view hierarchy.

The root transaction for a state change comes from the binding that changed, plus any global values set by calling `withTransaction(_:_:)` or `withAnimation(_:_:)`.







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a transaction

- `init()`
- `init(animation:)`

### Managing animations

- `animation`
- `disablesAnimations`
- `addAnimationCompletion(criteria:_:)`

### Managing window dismissal

- `dismissBehavior`

### Getting information about a transaction

- `isContinuous`
- `scrollTargetAnchor`
- `tracksVelocity`
- `subscript(_:)`

### Instance Properties

- `scrollContentOffsetAdjustmentBehavior`
- `scrollPositionUpdatePreservesVelocity`

## See Also

- `withTransaction(_:_:)`
- `withTransaction(_:_:_:)`
- `transaction(_:)`
- `transaction(value:_:)`
- `transaction(_:body:)`
- `Entry()`
- `TransactionKey`
