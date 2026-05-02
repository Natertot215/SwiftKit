---
url: https://developer.apple.com/documentation/swiftui/vstacklayout
framework: SwiftUI
category: Custom layout
title: VStackLayout
kind: struct
captured: 2026-05-02
---

# VStackLayout

A vertical container that you can use in conditional layouts.

## Declaration

```swift
@frozen struct VStackLayout
```

### Overview

This layout container behaves like a `VStack`, but conforms to the `Layout` protocol so you can use it in the conditional layouts that you construct with `AnyLayout`. If you don’t need a conditional layout, use `VStack` instead.





## Relationships

**Conforms To**: `Animatable`, `BitwiseCopyable`, `Copyable`, `Layout`, `Sendable`, `SendableMetatype`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Creating a vertical stack

- `init(alignment:spacing:)`

### Getting the stack’s properties

- `alignment`
- `spacing`

## See Also

- `AnyLayout`
- `HStackLayout`
- `ZStackLayout`
- `GridLayout`
