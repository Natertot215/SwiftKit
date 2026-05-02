---
url: https://developer.apple.com/documentation/swiftui/textselectability
framework: SwiftUI
category: Text input and output
title: TextSelectability
kind: protocol
captured: 2026-05-02
---

# TextSelectability

A type that describes the ability to select text.

## Declaration

```swift
protocol TextSelectability
```

### Overview

To configure whether people can select text in your app, use the `View/textSelection(_:)` modifier, passing in a text selectability value like `TextSelectability/enabled` or `TextSelectability/disabled`.





## Relationships

**Conforming Types**: `DisabledTextSelectability`, `EnabledTextSelectability`

## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- visionOS 1.0

## Topics

### Getting selectability options

- `enabled`
- `disabled`

### Specifying selectability

- `allowsSelection`

### Supporting types

- `EnabledTextSelectability`
- `DisabledTextSelectability`

## See Also

- `textSelection(_:)`
- `TextSelection`
- `textSelectionAffinity(_:)`
- `textSelectionAffinity`
- `TextSelectionAffinity`
- `AttributedTextSelection`
