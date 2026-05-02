---
url: https://developer.apple.com/documentation/swiftui/layoutproperties
framework: SwiftUI
category: Custom layout
title: LayoutProperties
kind: struct
captured: 2026-05-02
---

# LayoutProperties

Layout-specific properties of a layout container.

## Declaration

```swift
struct LayoutProperties
```

### Overview

This structure contains configuration information that’s applicable to a layout container. For example, the `LayoutProperties/stackOrientation` value indicates the layout’s primary axis, if any.

You can use an instance of this type to characterize a custom layout container, which is a type that conforms to the `Layout` protocol. Implement the protocol’s `Layout/layoutProperties` property to return an instance. For example, you can indicate that your layout has a vertical stack orientation:

```swift
extension BasicVStack {
    static var layoutProperties: LayoutProperties {
        var properties = LayoutProperties()
        properties.stackOrientation = .vertical
        return properties
    }
}
```

If you don’t implement the property in your custom layout, the protocol provides a default implementation that returns a `LayoutProperties` instance with default values.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Creating a layout properties instance

- `init()`

### Getting layout properties

- `stackOrientation`

## See Also

- `ProposedViewSize`
- `ViewSpacing`
