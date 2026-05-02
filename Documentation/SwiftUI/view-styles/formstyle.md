---
url: https://developer.apple.com/documentation/swiftui/formstyle
framework: SwiftUI
category: View styles
title: FormStyle
kind: protocol
captured: 2026-05-02
---

# FormStyle

The appearance and behavior of a form.

## Declaration

```swift
@MainActor @preconcurrency protocol FormStyle
```

### Overview

To configure the style for a single `Form` or for all form instances in a view hierarchy, use the `View/formStyle(_:)` modifier.

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

**Conforming Types**: `AutomaticFormStyle`, `ColumnsFormStyle`, `GroupedFormStyle`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Getting built-in form styles

- `automatic`
- `columns`
- `grouped`

### Creating custom form styles

- `makeBody(configuration:)`
- `FormStyle.Configuration`
- `Body`

### Supporting types

- `AutomaticFormStyle`
- `ColumnsFormStyle`
- `GroupedFormStyle`

## See Also

- `controlGroupStyle(_:)`
- `ControlGroupStyle`
- `ControlGroupStyleConfiguration`
- `formStyle(_:)`
- `FormStyleConfiguration`
- `groupBoxStyle(_:)`
- `GroupBoxStyle`
- `GroupBoxStyleConfiguration`
- `indexViewStyle(_:)`
- `IndexViewStyle`
- `labeledContentStyle(_:)`
- `LabeledContentStyle`
- `LabeledContentStyleConfiguration`
