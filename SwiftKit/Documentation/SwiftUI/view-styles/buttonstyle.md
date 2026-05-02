---
url: https://developer.apple.com/documentation/swiftui/buttonstyle
framework: SwiftUI
category: View styles
title: ButtonStyle
kind: protocol
captured: 2026-05-02
---

# ButtonStyle

A type that applies standard interaction behavior and a custom appearance to all buttons within a view hierarchy.

## Declaration

```swift
@MainActor @preconcurrency protocol ButtonStyle
```

### Overview

To configure the current button style for a view hierarchy, use the `View/buttonStyle(_:)` modifier. Specify a style that conforms to `ButtonStyle` when creating a button that uses the standard button interaction behavior defined for each platform. To create a button with custom interaction behavior, use `PrimitiveButtonStyle` instead.







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Custom button styles

- `makeBody(configuration:)`
- `ButtonStyle.Configuration`
- `Body`

## See Also

- `buttonStyle(_:)`
- `ButtonStyleConfiguration`
- `PrimitiveButtonStyle`
- `PrimitiveButtonStyleConfiguration`
- `signInWithAppleButtonStyle(_:)`
