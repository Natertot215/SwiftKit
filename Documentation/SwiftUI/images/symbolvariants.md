---
url: https://developer.apple.com/documentation/swiftui/symbolvariants
framework: SwiftUI
category: Images
title: SymbolVariants
kind: struct
captured: 2026-05-02
---

# SymbolVariants

A variant of a symbol.

## Declaration

```swift
struct SymbolVariants
```

### Overview

Many of the `doc://com.apple.documentation/design/Human-Interface-Guidelines/sf-symbols` that you can add to your app using an `Image` or a `Label` instance have common variants, like a filled version or a version that’s contained within a circle. The symbol’s name indicates the variant:

```swift
VStack(alignment: .leading) {
    Label("Default", systemImage: "heart")
    Label("Fill", systemImage: "heart.fill")
    Label("Circle", systemImage: "heart.circle")
    Label("Circle Fill", systemImage: "heart.circle.fill")
}
```

You can configure a part of your view hierarchy to use a particular variant for all symbols in that view and its child views using `SymbolVariants`. Add the `View/symbolVariant(_:)` modifier to a view to set a variant for that view’s environment. For example, you can use the modifier to create the same set of labels as in the example above, using only the base name of the symbol in the label declarations:

```swift
VStack(alignment: .leading) {
    Label("Default", systemImage: "heart")
    Label("Fill", systemImage: "heart")
        .symbolVariant(.fill)
    Label("Circle", systemImage: "heart")
        .symbolVariant(.circle)
    Label("Circle Fill", systemImage: "heart")
        .symbolVariant(.circle.fill)
}
```

Alternatively, you can set the variant in the environment directly by passing the `EnvironmentValues/symbolVariants` environment value to the `View/environment(_:_:)` modifier:

```swift
Label("Fill", systemImage: "heart")
    .environment(\.symbolVariants, .fill)
```

SwiftUI sets a variant for you in some environments. For example, SwiftUI automatically applies the `SymbolVariants/fill-swift.type.property` symbol variant for items that appear in the `content` closure of the `View/swipeActions(edge:allowsFullSwipe:content:)` method, or as the tab bar items of a `TabView`.





## Relationships

**Conforms To**: `Equatable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0

## Topics

### Getting symbol variants

- `none`
- `circle`
- `square`
- `rectangle`
- `fill`
- `slash`

### Modifying a variant

- `circle`
- `square`
- `rectangle`
- `fill`
- `slash`

### Comparing variants

- `contains(_:)`

## See Also

- `symbolVariant(_:)`
- `symbolVariants`
