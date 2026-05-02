---
url: https://developer.apple.com/documentation/swiftui/scrollphasechangecontext
framework: SwiftUI
category: Scroll views
title: ScrollPhaseChangeContext
kind: struct
captured: 2026-05-02
---

# ScrollPhaseChangeContext

A type that provides you with more content when the phase of a scroll view changes.

## Declaration

```swift
struct ScrollPhaseChangeContext
```

### Overview

You don’t create this type directly. Instead, SwiftUI provides an instance of this type in the `View/onScrollPhaseChange(_:)` modifier.







## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Instance Properties

- `geometry`
- `velocity`

## See Also

- `onScrollGeometryChange(for:of:action:)`
- `onScrollTargetVisibilityChange(idType:threshold:_:)`
- `onScrollVisibilityChange(threshold:_:)`
- `onScrollPhaseChange(_:)`
- `ScrollGeometry`
- `ScrollPhase`
