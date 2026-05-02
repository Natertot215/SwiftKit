---
url: https://developer.apple.com/documentation/swiftui/subview
framework: SwiftUI
category: View groupings
title: Subview
kind: struct
captured: 2026-05-02
---

# Subview

An opaque value representing a subview of another view.

## Declaration

```swift
struct Subview
```

### Overview

Access to a `Subview` can be obtained by using `ForEach(subviews:)` or `Group(subviews:)`.

Subviews are proxies to the resolved view they represent, meaning that modifiers applied to the original view will be applied before modifiers applied to the subview, and the view is resolved using the environment of its container, *not*not the environment of the its subview proxy. Additionally, because subviews must represent a single leaf view, or container, a subview may represent a view after the application of styles. As such, attempting to apply a style to it may have no affect.





## Relationships

**Conforms To**: `Identifiable`, `View`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Structures

- `Subview.ID`

### Instance Properties

- `containerValues`
- `id`

### Enumerations

- `Subview.ContainerSizingOptions`

## See Also

- `SubviewsCollection`
- `SubviewsCollectionSlice`
- `containerValue(_:_:)`
- `ContainerValues`
- `ContainerValueKey`
