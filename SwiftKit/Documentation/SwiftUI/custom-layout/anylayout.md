---
url: https://developer.apple.com/documentation/swiftui/anylayout
framework: SwiftUI
category: Custom layout
title: AnyLayout
kind: struct
captured: 2026-05-02
---

# AnyLayout

A type-erased instance of the layout protocol.

## Declaration

```swift
@frozen struct AnyLayout
```

### Overview

Use an `AnyLayout` instance to enable dynamically changing the type of a layout container without destroying the state of the subviews. For example, you can create a layout that changes between horizontal and vertical layouts based on the current Dynamic Type setting:

```swift
struct DynamicLayoutExample: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize

    var body: some View {
        let layout = dynamicTypeSize <= .medium ?
            AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())

        layout {
            Text("First label")
            Text("Second label")
        }
    }
}
```

The types that you use with `AnyLayout` must conform to the `Layout` protocol. The above example chooses between the `HStackLayout` and `VStackLayout` types, which are versions of the built-in `HStack` and `VStack` containers that conform to the protocol. You can also use custom layout types that you define.





## Relationships

**Conforms To**: `Animatable`, `Layout`, `Sendable`, `SendableMetatype`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Creating the layout

- `init(_:)`

## See Also

- `HStackLayout`
- `VStackLayout`
- `ZStackLayout`
- `GridLayout`
