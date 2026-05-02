---
url: https://developer.apple.com/documentation/swiftui/gridlayout
framework: SwiftUI
category: Custom layout
title: GridLayout
kind: struct
captured: 2026-05-02
---

# GridLayout

A grid that you can use in conditional layouts.

## Declaration

```swift
@frozen struct GridLayout
```

### Overview

This layout container behaves like a `Grid`, but conforms to the `Layout` protocol so you can use it in the conditional layouts that you construct with `AnyLayout`. If you don’t need a conditional layout, use `Grid` instead.





## Relationships

**Conforms To**: `Animatable`, `BitwiseCopyable`, `Copyable`, `Escapable`, `Layout`, `Sendable`, `SendableMetatype`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Creating a grid

- `init(alignment:horizontalSpacing:verticalSpacing:)`

### Getting the grid’s properties

- `alignment`
- `horizontalSpacing`
- `verticalSpacing`

### Type Aliases

- `GridLayout.Body`

### Default Implementations

- `Layout Implementations`

## See Also

- `AnyLayout`
- `HStackLayout`
- `VStackLayout`
- `ZStackLayout`
