---
url: https://developer.apple.com/documentation/swiftui/progressviewstyle
framework: SwiftUI
category: View styles
title: ProgressViewStyle
kind: protocol
captured: 2026-05-02
---

# ProgressViewStyle

A type that applies standard interaction behavior to all progress views within a view hierarchy.

## Declaration

```swift
@MainActor @preconcurrency protocol ProgressViewStyle
```

### Overview

To configure the current progress view style for a view hierarchy, use the `View/progressViewStyle(_:)` modifier.

A type conforming to this protocol inherits `@preconcurrency @MainActor` isolation from the protocol if the conformance is included in the type’s base declaration:

```swift
struct MyCustomType: Transition {
    // `@preconcurrency @MainActor` isolation by default
}
```

Isolation to the main actor is the default, but it’s not required. Declare the conformance in an extension to opt out of main actor isolation:

```swift
extension MyCustomType: Transition {
    // `nonisolated` by default
}
```





## Relationships

**Conforming Types**: `CircularProgressViewStyle`, `DefaultProgressViewStyle`, `LinearProgressViewStyle`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Getting built-in progress view styles

- `automatic`
- `circular`
- `linear`

### Creating custom progress view styles

- `makeBody(configuration:)`
- `ProgressViewStyle.Configuration`
- `Body`

### Supporting types

- `DefaultProgressViewStyle`
- `CircularProgressViewStyle`
- `LinearProgressViewStyle`

## See Also

- `gaugeStyle(_:)`
- `GaugeStyle`
- `GaugeStyleConfiguration`
- `progressViewStyle(_:)`
- `ProgressViewStyleConfiguration`
