---
url: https://developer.apple.com/documentation/swiftui/presentationadaptation
framework: SwiftUI
category: Modal presentations
title: PresentationAdaptation
kind: struct
captured: 2026-05-02
---

# PresentationAdaptation

Strategies for adapting a presentation to a different size class.

## Declaration

```swift
struct PresentationAdaptation
```

### Overview

Use values of this type with the `View/presentationCompactAdaptation(_:)` and `View/presentationCompactAdaptation(horizontal:vertical:)` modifiers.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- iOS 16.4
- iPadOS 16.4
- Mac Catalyst 16.4
- macOS 13.3
- tvOS 16.4
- visionOS 1.0
- watchOS 9.4

## Topics

### Getting adaptation strategies

- `automatic`
- `none`
- `fullScreenCover`
- `popover`
- `sheet`

## See Also

- `presentationCompactAdaptation(horizontal:vertical:)`
- `presentationCompactAdaptation(_:)`
- `presentationSizing(_:)`
- `PresentationSizing`
- `PresentationSizingRoot`
- `PresentationSizingContext`
