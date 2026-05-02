---
url: https://developer.apple.com/documentation/swiftui/viewmodifier
framework: SwiftUI
category: View fundamentals
title: ViewModifier
kind: protocol
captured: 2026-05-01
---

# ViewModifier

## Declaration

```swift
@MainActor @preconcurrency protocol ViewModifier
```

## Abstract

A modifier that you apply to a view or another view modifier, producing a different version of the original value.

## Overview

Adopt the `ViewModifier` protocol when you want to create a reusable modifier that you can apply to any view. The example below combines several modifiers to create a new modifier that you can use to create blue caption text surrounded by a rounded rectangle:

```swift
struct BorderedCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
            )
            .foregroundColor(Color.blue)
    }
}
```

You can apply the modifier directly to a view, but a more common and idiomatic approach uses an extension to `View` itself that incorporates the view modifier:

```swift
extension View {
    func borderedCaption() -> some View {
        modifier(BorderedCaption())
    }
}
```

You can then apply the bordered caption to any view:

```swift
Image(systemName: "bus")
    .resizable()
    .frame(width:50, height:50)
Text("Downtown Bus")
    .borderedCaption()
```

### Main Actor Isolation

A type conforming to this protocol inherits `@preconcurrency @MainActor` isolation from the protocol if the conformance is included in the type's base declaration:

```swift
struct MyCustomType: ViewModifier {
    // `@preconcurrency @MainActor` isolation by default
}
```

Isolation to the main actor is the default, but it's not required. Declare the conformance in an extension to opt out of main actor isolation:

```swift
extension MyCustomType: ViewModifier {
    // `nonisolated` by default
}
```

## Topics

### Creating a view modifier

- `func body(content: Content) -> some View` - Gets the current body of the caller.
- `associatedtype Body: View` - The type of view representing the body.
- `typealias Content` - The content view type passed to `body()`.

### Adding animations to a view

- `func animation(Animation?) -> some ViewModifier` - Returns a new version of the modifier that will apply animation to all animatable values within the modifier.
- `func concat<T>(T) -> ModifiedContent<Self, T>` - Returns a new modifier that is the result of concatenating `self` with `modifier`.

### Handling view taps and gestures

- `func transaction((inout Transaction) -> Void) -> some ViewModifier` - Returns a new version of the modifier that will apply the transaction mutation function to all transactions within the modifier.

## Availability

- iOS 13.0+
- iPadOS 13.0+
- Mac Catalyst 13.0+
- macOS 10.15+
- tvOS 13.0+
- visionOS 1.0+
- watchOS 6.0+

## See Also

- [Configuring views](https://developer.apple.com/documentation/swiftui/configuring-views)
- [Reducing view modifier maintenance](https://developer.apple.com/documentation/swiftui/reducing-view-modifier-maintenance)
- `View.modifier(_:)`
- `EmptyModifier`
- `ModifiedContent`
- `EnvironmentalModifier`
