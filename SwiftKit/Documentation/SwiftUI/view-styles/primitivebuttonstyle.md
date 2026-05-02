---
url: https://developer.apple.com/documentation/swiftui/primitivebuttonstyle
framework: SwiftUI
category: View styles
title: PrimitiveButtonStyle
kind: protocol
captured: 2026-05-02
---

# PrimitiveButtonStyle

A type that applies custom interaction behavior and a custom appearance to all buttons within a view hierarchy.

## Declaration

```swift
@MainActor @preconcurrency protocol PrimitiveButtonStyle
```

### Overview

To configure the current button style for a view hierarchy, use the `View/buttonStyle(_:)` modifier. Specify a style that conforms to `PrimitiveButtonStyle` to create a button with custom interaction behavior. To create a button with the standard button interaction behavior defined for each platform, use `ButtonStyle` instead.

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

**Conforming Types**: `AccessoryBarActionButtonStyle`, `AccessoryBarButtonStyle`, `BorderedButtonStyle`, `BorderedProminentButtonStyle`, `BorderlessButtonStyle`, `CardButtonStyle`, `DefaultButtonStyle`, `GlassButtonStyle`, `GlassProminentButtonStyle`, `LinkButtonStyle`, `PlainButtonStyle`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting built-in button styles

- `automatic`
- `accessoryBar`
- `accessoryBarAction`
- `bordered`
- `borderedProminent`
- `borderless`
- `card`
- `glass`
- `glassProminent`
- `glass(_:)`
- `link`
- `plain`

### Creating custom button styles

- `makeBody(configuration:)`
- `PrimitiveButtonStyle.Configuration`
- `Body`

### Supporting types

- `DefaultButtonStyle`
- `AccessoryBarButtonStyle`
- `AccessoryBarActionButtonStyle`
- `BorderedButtonStyle`
- `BorderedProminentButtonStyle`
- `BorderlessButtonStyle`
- `CardButtonStyle`
- `LinkButtonStyle`
- `PlainButtonStyle`

## See Also

- `buttonStyle(_:)`
- `ButtonStyle`
- `ButtonStyleConfiguration`
- `PrimitiveButtonStyleConfiguration`
- `signInWithAppleButtonStyle(_:)`
