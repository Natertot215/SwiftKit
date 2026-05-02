---
url: https://developer.apple.com/documentation/swiftui/labeledcontentstyle
framework: SwiftUI
category: View styles
title: LabeledContentStyle
kind: protocol
captured: 2026-05-02
---

# LabeledContentStyle

The appearance and behavior of a labeled content instance..

## Declaration

```swift
@MainActor @preconcurrency protocol LabeledContentStyle
```

### Overview

Use `View/labeledContentStyle(_:)` to set a style on a view.

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

**Conforming Types**: `AutomaticLabeledContentStyle`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Getting built-in labeled content styles

- `automatic`

### Creating custom labeled content styles

- `makeBody(configuration:)`
- `LabeledContentStyle.Configuration`
- `Body`

### Supporting types

- `AutomaticLabeledContentStyle`

## See Also

- `controlGroupStyle(_:)`
- `ControlGroupStyle`
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
- `LabeledContentStyleConfiguration`
