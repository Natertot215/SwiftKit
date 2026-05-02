---
url: https://developer.apple.com/documentation/swiftui/texteditorstyle
framework: SwiftUI
category: View styles
title: TextEditorStyle
kind: protocol
captured: 2026-05-02
---

# TextEditorStyle

A specification for the appearance and interaction of a text editor.

## Declaration

```swift
@MainActor @preconcurrency protocol TextEditorStyle
```

### Overview

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

**Conforming Types**: `AutomaticTextEditorStyle`, `PlainTextEditorStyle`, `RoundedBorderTextEditorStyle`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- visionOS 1.0

## Topics

### Getting built-in styles

- `automatic`
- `plain`
- `roundedBorder`

### Creating custom styles

- `makeBody(configuration:)`
- `TextEditorStyle.Configuration`
- `Body`

### Supporting types

- `AutomaticTextEditorStyle`
- `PlainTextEditorStyle`
- `RoundedBorderTextEditorStyle`

## See Also

- `labelStyle(_:)`
- `LabelStyle`
- `LabelStyleConfiguration`
- `textFieldStyle(_:)`
- `TextFieldStyle`
- `textEditorStyle(_:)`
- `TextEditorStyleConfiguration`
