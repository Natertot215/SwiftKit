---
url: https://developer.apple.com/documentation/swiftui/emptymodifier
framework: SwiftUI
category: View fundamentals
title: EmptyModifier
kind: struct
captured: 2026-05-02
---

# EmptyModifier

An empty, or identity, modifier, used during development to switch modifiers at compile time.

## Declaration

```swift
@frozen struct EmptyModifier
```

### Overview

Use the empty modifier to switch modifiers at compile time during development. In the example below, in a debug build the `Text` view inside `ContentView` has a yellow background and a red border. A non-debug build reflects the default system, or container supplied appearance.

```swift
struct EmphasizedLayout: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.yellow)
            .border(Color.red)
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .modifier(modifier)
    }

    var modifier: some ViewModifier {
        #if DEBUG
            return EmphasizedLayout()
        #else
            return EmptyModifier()
        #endif
    }
}
```





## Relationships

**Conforms To**: `BitwiseCopyable`, `Copyable`, `Escapable`, `Sendable`, `SendableMetatype`, `ViewModifier`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating an empty modifier

- `init()`

### Getting the identity modifier

- `identity`

## See Also

- `Configuring views`
- `Reducing view modifier maintenance`
- `modifier(_:)`
- `ViewModifier`
- `ModifiedContent`
- `EnvironmentalModifier`
- `ManipulableModifier`
- `ManipulableResponderModifier`
- `ManipulableTransformBindingModifier`
- `ManipulationGeometryModifier`
- `ManipulationGestureModifier`
- `ManipulationUsingGestureStateModifier`
- `Manipulable`
