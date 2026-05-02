---
url: https://developer.apple.com/documentation/swiftui/binding
framework: SwiftUI
category: Model data
title: Binding
kind: struct
captured: 2026-05-01
---

# Binding

## Declaration

```swift
@frozen @propertyWrapper @dynamicMemberLookup struct Binding<Value>
```

## Abstract

A property wrapper type that can read and write a value owned by a source of truth.

## Overview

Use a binding to create a two-way connection between a property that stores data, and a view that displays and changes the data. A binding connects a property to a source of truth stored elsewhere, instead of storing data directly. For example, a button that toggles between play and pause can create a binding to a property of its parent view using the `Binding` property wrapper.

```swift
struct PlayButton: View {
    @Binding var isPlaying: Bool

    var body: some View {
        Button(isPlaying ? "Pause" : "Play") {
            isPlaying.toggle()
        }
    }
}
```

The parent view declares a property to hold the playing state, using the `@State` property wrapper to indicate that this property is the value's source of truth.

```swift
struct PlayerView: View {
    var episode: Episode
    @State private var isPlaying: Bool = false

    var body: some View {
        VStack {
            Text(episode.title)
                .foregroundStyle(isPlaying ? .primary : .secondary)
            PlayButton(isPlaying: $isPlaying) // Pass a binding.
        }
    }
}
```

When `PlayerView` initializes `PlayButton`, it passes a binding of its state property into the button's binding property. Applying the `$` prefix to a property wrapped value returns its `projectedValue`, which for a state property wrapper returns a binding to the value.

Whenever the user taps the `PlayButton`, the `PlayerView` updates its `isPlaying` state.

A binding conforms to `Sendable` only if its wrapped value type also conforms to `Sendable`. It is always safe to pass a sendable binding between different concurrency domains. However, reading from or writing to a binding's wrapped value from a different concurrency domain may or may not be safe, depending on how the binding was created. SwiftUI will issue a warning at runtime if it detects a binding being used in a way that may compromise data safety.

> **Note:** To create bindings to properties of a type that conforms to the `Observable` protocol, use the `Bindable` property wrapper. For more information, see [Migrating from the Observable Object protocol to the Observable macro](/documentation/swiftui/migrating-from-the-observable-object-protocol-to-the-observable-macro).

## Availability

- **iOS** 13.0+
- **iPadOS** 13.0+
- **Mac Catalyst** 13.0+
- **macOS** 10.15+
- **tvOS** 13.0+
- **visionOS** 1.0+
- **watchOS** 6.0+

## See Also

### Creating and sharing view state

- `State`
- `Bindable`
- [Managing User Interface State](/documentation/swiftui/managing-user-interface-state)
