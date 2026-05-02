---
url: https://developer.apple.com/documentation/swiftui/presentationsizing
framework: SwiftUI
category: Modal presentations
title: PresentationSizing
kind: protocol
captured: 2026-05-02
---

# PresentationSizing

A type that defines the size of the presentation content and how the presentation size adjusts to its content’s size changing.

## Declaration

```swift
protocol PresentationSizing
```

### Overview

You don’t need to define your own version of this protocol. The system implementations of `PresentationSizing/form`, `PresentationSizing/page`, and `PresentationSizing/fitted` are conveniences that automatically adapt to different device and screen sizes. If you do want to define your own sizing, first consider using the modifiers `PresenationSizing/sticky(horizontal:vertical:)` and `PresentationSizing/fitted(horizontal:vertical:)`. For example, to define your own sizing that proposes a 400x400 square size:

```swift
protocol SquareSizing: PresentationSizing {
    func proposedSize(
        for subview: PresentationSizingRoot,
        context: PresentationSizingContext
    ) {
        .init(width: 400, height: 400)
    }
}

extension PresentationSizing where Self == SquareSizing {
    public static var square: Self { SquareSizing() }
}
```

Then, at the callsite, you can modify `.square` just like system sizings, for example, to fit its content vertically:

```swift
.presentationSizing(.square.fitted(horizontal: false, vertical: true))
```

> **NOTE:** `View/presentationSizing(_:)`





## Relationships

**Conforming Types**: `AutomaticPresentationSizing`, `FittedPresentationSizing`, `FormPresentationSizing`, `PagePresentationSizing`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Getting built-in presentation size

- `automatic`
- `fitted`
- `form`
- `page`

### Creating custom presentation size

- `fitted(horizontal:vertical:)`
- `proposedSize(for:context:)`
- `sticky(horizontal:vertical:)`

### Supporting types

- `AutomaticPresentationSizing`
- `FittedPresentationSizing`
- `FormPresentationSizing`
- `PagePresentationSizing`

## See Also

- `presentationCompactAdaptation(horizontal:vertical:)`
- `presentationCompactAdaptation(_:)`
- `PresentationAdaptation`
- `presentationSizing(_:)`
- `PresentationSizingRoot`
- `PresentationSizingContext`
