---
url: https://developer.apple.com/documentation/swiftui/state
framework: SwiftUI
category: Model data
title: State
kind: struct
captured: 2026-05-01
---

# State

## Declaration

```swift
@frozen @propertyWrapper struct State<Value>
```

## Abstract

A property wrapper type that can read and write a value managed by SwiftUI.

## Overview

Use state as the single source of truth for a given value type that you store in a view hierarchy. Create a state value in an `App`, `Scene`, or `View` by applying the `@State` attribute to a property declaration and providing an initial value. Declare state as private to prevent setting it in a memberwise initializer, which can conflict with the storage management that SwiftUI provides:

```swift
struct PlayButton: View {
    @State private var isPlaying: Bool = false // Create the state.

    var body: some View {
        Button(isPlaying ? "Pause" : "Play") { // Read the state.
            isPlaying.toggle() // Write the state.
        }
    }
}
```

SwiftUI manages the property's storage. When the value changes, SwiftUI updates the parts of the view hierarchy that depend on the value. To access a state's underlying value, you use its `wrappedValue` property. However, as a shortcut Swift enables you to access the wrapped value by referring directly to the state instance.

Declare state as private in the highest view in the view hierarchy that needs access to the value. Then share the state with any subviews that also need access, either directly for read-only access, or as a binding for read-write access. You can safely mutate state properties from any thread.

### Share state with subviews

If you pass a state property to a subview, SwiftUI updates the subview any time the value changes in the container view, but the subview can't modify the value. To enable the subview to modify the state's stored value, pass a `Binding` instead.

```swift
struct PlayButton: View {
    @Binding var isPlaying: Bool // Play button now receives a binding.

    var body: some View {
        Button(isPlaying ? "Pause" : "Play") {
            isPlaying.toggle()
        }
    }
}
```

Get the binding to the state value by accessing the state's `projectedValue`, which you get by prefixing the property name with a dollar sign (`$`):

```swift
struct PlayerView: View {
    @State private var isPlaying: Bool = false // Create the state here now.

    var body: some View {
        VStack {
            PlayButton(isPlaying: $isPlaying) // Pass a binding.
            // ...
        }
    }
}
```

### Store observable objects

You can also store observable objects that you create with the `@Observable` macro in `State`:

```swift
@Observable
class Library {
    var name = "My library of books"
    // ...
}

struct ContentView: View {
    @State private var library = Library()

    var body: some View {
        LibraryView(library: library)
    }
}
```

A `State` property always instantiates its default value when SwiftUI instantiates the view. For this reason, avoid side effects and performance-intensive work when initializing the default value. You can defer the creation of the object using the `View/task(priority:_:)` modifier:

```swift
struct ContentView: View {
    @State private var library: Library?

    var body: some View {
        LibraryView(library: library)
            .task {
                library = Library()
            }
    }
}
```

## Conformance

Conforms to:
- `DynamicProperty`
- `Sendable`
- `SendableMetatype`

## Topics

### Creating a state

- `init(wrappedValue:)` - Creates a state property that stores an initial wrapped value.
- `init(initialValue:)` - Creates a state property that stores an initial value.
- `init()` - Creates a state property without an initial value. Available when `Value` conforms to `ExpressibleByNilLiteral`.

### Getting the value

- `wrappedValue` - The underlying value referenced by the state variable.
- `projectedValue` - A binding to the state value.

## Availability

- iOS 13.0+
- iPadOS 13.0+
- macOS 10.15+
- tvOS 13.0+
- watchOS 6.0+
- visionOS 1.0+

## See Also

- `Managing User Interface State` - Encapsulate view-specific data within your app's view hierarchy
- `Bindable` - A property wrapper type that supports creating bindings to observable objects
- `Binding` - A property wrapper type that can read and write a value owned by a source of truth
