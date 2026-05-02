---
url: https://developer.apple.com/documentation/swiftui/labelstyle
framework: SwiftUI
category: View styles
title: LabelStyle
kind: protocol
captured: 2026-05-02
---

# LabelStyle

A type that applies a custom appearance to all labels within a view.

## Declaration

```swift
@MainActor @preconcurrency protocol LabelStyle
```

### Overview

To configure the current label style for a view hierarchy, use the `View/labelStyle(_:)` modifier.

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

**Conforming Types**: `DefaultLabelStyle`, `IconOnlyLabelStyle`, `TitleAndIconLabelStyle`, `TitleOnlyLabelStyle`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Getting built-in label styles

- `automatic`
- `iconOnly`
- `titleAndIcon`
- `titleOnly`

### Creating custom label styles

- `makeBody(configuration:)`
- `LabelStyle.Configuration`
- `Body`

### Supporting types

- `DefaultLabelStyle`
- `IconOnlyLabelStyle`
- `TitleAndIconLabelStyle`
- `TitleOnlyLabelStyle`

## See Also

- `labelStyle(_:)`
- `LabelStyleConfiguration`
- `textFieldStyle(_:)`
- `TextFieldStyle`
- `textEditorStyle(_:)`
- `TextEditorStyle`
- `TextEditorStyleConfiguration`
