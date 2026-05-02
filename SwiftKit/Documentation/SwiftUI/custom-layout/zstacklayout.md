---
url: https://developer.apple.com/documentation/swiftui/zstacklayout
framework: SwiftUI
category: Custom layout
title: ZStackLayout
kind: struct
captured: 2026-05-02
---

# ZStackLayout

An overlaying container that you can use in conditional layouts.

## Declaration

```swift
@frozen struct ZStackLayout
```

### Overview

This layout container behaves like a `ZStack`, but conforms to the `Layout` protocol so you can use it in the conditional layouts that you construct with `AnyLayout`. If you don’t need a conditional layout, use `ZStack` instead.





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

### Creating a stack

- `init(alignment:)`

### Getting the stack’s properties

- `alignment`

## See Also

- `AnyLayout`
- `HStackLayout`
- `VStackLayout`
- `GridLayout`
