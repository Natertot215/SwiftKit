---
url: https://developer.apple.com/documentation/swiftui/menustyle
framework: SwiftUI
category: View styles
title: MenuStyle
kind: protocol
captured: 2026-05-02
---

# MenuStyle

A type that applies standard interaction behavior and a custom appearance to all menus within a view hierarchy.

## Declaration

```swift
@MainActor @preconcurrency protocol MenuStyle
```

### Overview

To configure the current menu style for a view hierarchy, use the `View/menuStyle(_:)` modifier.

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

**Conforming Types**: `BorderedButtonMenuStyle`, `BorderlessButtonMenuStyle`, `ButtonMenuStyle`, `DefaultMenuStyle`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 17.0
- visionOS 1.0

## Topics

### Getting built-in menu styles

- `automatic`
- `button`
- `borderedButton`
- `borderlessButton`

### Creating custom menu styles

- `makeBody(configuration:)`
- `MenuStyle.Configuration`
- `Body`

### Supporting types

- `DefaultMenuStyle`
- `ButtonMenuStyle`
- `BorderlessButtonMenuStyle`
- `BorderedButtonMenuStyle`

## See Also

- `menuStyle(_:)`
- `MenuStyleConfiguration`
