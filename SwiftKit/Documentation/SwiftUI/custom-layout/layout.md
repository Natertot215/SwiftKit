---
url: https://developer.apple.com/documentation/swiftui/layout
framework: SwiftUI
category: Custom layout
title: Layout
kind: protocol
captured: 2026-05-02
---

# Layout

A type that defines the geometry of a collection of views.

## Declaration

```swift
@preconcurrency protocol Layout : Sendable, Animatable
```

### Overview

You traditionally arrange views in your app’s user interface using built-in layout containers like `HStack` and `Grid`. If you need more complex layout behavior, you can define a custom layout container by creating a type that conforms to the `Layout` protocol and implementing its required methods:

- `Layout/sizeThatFits(proposal:subviews:cache:)` reports the size of the composite layout view.
- `Layout/placeSubviews(in:proposal:subviews:cache:)` assigns positions to the container’s subviews.

You can define a basic layout type with only these two methods:

```swift
struct BasicVStack: Layout {
    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        // Calculate and return the size of the layout container.
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        // Tell each subview where to appear.
    }
}
```

Use your layout the same way you use a built-in layout container, by providing a `ViewBuilder` with the list of subviews to arrange:

```swift
BasicVStack {
    Text("A Subview")
    Text("Another Subview")
}
```

#### Support additional behaviors

You can optionally implement other protocol methods and properties to provide more layout container features:

- Define explicit horizontal and vertical layout guides for the container by implementing `Layout/explicitAlignment(of:in:proposal:subviews:cache:)` for each dimension.
- Establish the preferred spacing around the container by implementing `Layout/spacing(subviews:cache:)`.
- Indicate the axis of orientation for a container that has characteristics of a stack by implementing the `Layout/layoutProperties` static property.
- Create and manage a cache to store computed values across different layout protocol calls by implementing `Layout/makeCache(subviews:)`.

The protocol provides default implementations for these symbols if you don’t implement them. See each method or property for details.

#### Add input parameters

You can define parameters as inputs to the layout, like you might for a `View`:

```swift
struct BasicVStack: Layout {
    var alignment: HorizontalAlignment

    // ...
}
```

Set the parameters at the point where you instantiate the layout:

```swift
BasicVStack(alignment: .leading) {
    // ...
}
```

If the layout provides default values for its parameters, you can omit the parameters at the call site, but you might need to keep the parentheses after the name of the layout, depending on how you specify the defaults. For example, suppose you set a default alignment for the basic stack in the parameter declaration:

```swift
struct BasicVStack: Layout {
    var alignment: HorizontalAlignment = .center

    // ...
}
```

To instantiate this layout using the default center alignment, you don’t have to specify the alignment value, but you do need to add empty parentheses:

```swift
BasicVStack() {
    // ...
}
```

The Swift compiler requires the parentheses in this case because of how the layout protocol implements this call site syntax. Specifically, the layout’s `Layout/callAsFunction(_:)` method looks for an initializer with exactly zero input arguments when you omit the parentheses from the call site. You can enable the simpler call site for a layout that doesn’t have an implicit initializer of this type by explicitly defining one:

```swift
init() {
    self.alignment = .center
}
```

For information about Swift initializers, see `https://docs.swift.org/swift-book/LanguageGuide/Initialization.html` in *The Swift Programming Language*The Swift Programming Language.

#### Interact with subviews through their proxies

To perform layout, you need information about all of its subviews, which are the views that your container arranges. While your layout can’t interact directly with its subviews, it can access a set of subview proxies through the `Layout/Subviews` collection that each protocol method receives as an input parameter. That type is an alias for the `LayoutSubviews` collection type, which in turn contains `LayoutSubview` instances that are the subview proxies.

You can get information about each subview from its proxy, like its dimensions and spacing preferences. This enables you to measure subviews before you commit to placing them. You also assign a position to each subview by calling its proxy’s `LayoutSubview/place(at:anchor:proposal:)` method. Call the method on each subview from within your implementation of the layout’s `Layout/placeSubviews(in:proposal:subviews:cache:)` method.

#### Access layout values

Views have layout values that you set with view modifiers. Layout containers can choose to condition their behavior accordingly. For example, a built-in `HStack` allocates space to its subviews based in part on the priorities that you set with the `View/layoutPriority(_:)` view modifier. Your layout container accesses this value for a subview by reading the proxy’s `LayoutSubview/priority` property.

You can also create custom layout values by creating a layout key. Set a value on a view with the `View/layoutValue(key:value:)` view modifier. Read the corresponding value from the subview’s proxy using the key as an index on the subview. For more information about creating, setting, and accessing custom layout values, see `LayoutValueKey`.





## Relationships

**Inherits From**: `Animatable`, `Sendable`, `SendableMetatype`

**Conforming Types**: `AnyLayout`, `GridLayout`, `HStackLayout`, `SpatialContainer`, `VStackLayout`, `ZStackLayout`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Sizing the container and placing subviews

- `sizeThatFits(proposal:subviews:cache:)`
- `placeSubviews(in:proposal:subviews:cache:)`
- `Layout.Subviews`

### Reporting layout container characteristics

- `explicitAlignment(of:in:proposal:subviews:cache:)`
- `spacing(subviews:cache:)`
- `layoutProperties`

### Managing a cache

- `makeCache(subviews:)`
- `updateCache(_:subviews:)`
- `Cache`

### Supporting types

- `callAsFunction(_:)`

### Instance Methods

- `depthAlignment(_:)`
- `depthAlignment(_:content:)`

## See Also

- `Composing custom layouts with SwiftUI`
- `LayoutSubview`
- `LayoutSubviews`
