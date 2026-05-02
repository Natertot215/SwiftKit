---
url: https://developer.apple.com/documentation/swiftui/groupboxstyle
framework: SwiftUI
category: View styles
title: GroupBoxStyle
kind: protocol
captured: 2026-05-02
---

# GroupBoxStyle

A type that specifies the appearance and interaction of all group boxes within a view hierarchy.

## Declaration

```swift
@MainActor @preconcurrency protocol GroupBoxStyle
```

### Overview

To configure the current `GroupBoxStyle` for a view hierarchy, use the `View/groupBoxStyle(_:)` modifier.

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

**Conforming Types**: `DefaultGroupBoxStyle`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- visionOS 1.0

## Topics

### Getting built-in group box styles

- `automatic`

### Creating custom group box styles

- `makeBody(configuration:)`
- `GroupBoxStyle.Configuration`
- `Body`

### Supporting types

- `DefaultGroupBoxStyle`

## See Also

- `controlGroupStyle(_:)`
- `ControlGroupStyle`
- `ControlGroupStyleConfiguration`
- `formStyle(_:)`
- `FormStyle`
- `FormStyleConfiguration`
- `groupBoxStyle(_:)`
- `GroupBoxStyleConfiguration`
- `indexViewStyle(_:)`
- `IndexViewStyle`
- `labeledContentStyle(_:)`
- `LabeledContentStyle`
- `LabeledContentStyleConfiguration`
