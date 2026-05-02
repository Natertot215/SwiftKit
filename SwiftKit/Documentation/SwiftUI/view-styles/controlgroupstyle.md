---
url: https://developer.apple.com/documentation/swiftui/controlgroupstyle
framework: SwiftUI
category: View styles
title: ControlGroupStyle
kind: protocol
captured: 2026-05-02
---

# ControlGroupStyle

Defines the implementation of all control groups within a view hierarchy.

## Declaration

```swift
@MainActor @preconcurrency protocol ControlGroupStyle
```

### Overview

To configure the current `ControlGroupStyle` for a view hierarchy, use the `View/controlGroupStyle(_:)` modifier.

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

**Conforming Types**: `AutomaticControlGroupStyle`, `CompactMenuControlGroupStyle`, `MenuControlGroupStyle`, `NavigationControlGroupStyle`, `PaletteControlGroupStyle`

## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 17.0
- visionOS 1.0

## Topics

### Getting built-in control group styles

- `automatic`
- `compactMenu`
- `menu`
- `navigation`
- `palette`

### Creating custom control group styles

- `makeBody(configuration:)`
- `ControlGroupStyle.Configuration`
- `Body`

### Supporting types

- `AutomaticControlGroupStyle`
- `CompactMenuControlGroupStyle`
- `MenuControlGroupStyle`
- `NavigationControlGroupStyle`
- `PaletteControlGroupStyle`

## See Also

- `controlGroupStyle(_:)`
- `ControlGroupStyleConfiguration`
- `formStyle(_:)`
- `FormStyle`
- `FormStyleConfiguration`
- `groupBoxStyle(_:)`
- `GroupBoxStyle`
- `GroupBoxStyleConfiguration`
- `indexViewStyle(_:)`
- `IndexViewStyle`
- `labeledContentStyle(_:)`
- `LabeledContentStyle`
- `LabeledContentStyleConfiguration`
