---
url: https://developer.apple.com/documentation/swiftui/tablestyle
framework: SwiftUI
category: View styles
title: TableStyle
kind: protocol
captured: 2026-05-02
---

# TableStyle

A type that applies a custom appearance to all tables within a view.

## Declaration

```swift
@MainActor @preconcurrency protocol TableStyle
```

### Overview

To configure the current table style for a view hierarchy, use the `View/tableStyle(_:)` modifier.

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

**Conforming Types**: `AutomaticTableStyle`, `BorderedTableStyle`, `InsetTableStyle`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 12.0
- visionOS 1.0

## Topics

### Getting built-in table styles

- `automatic`
- `inset`
- `bordered`

### Creating custom table styles

- `makeBody(configuration:)`
- `TableStyle.Configuration`
- `Body`

### Deprecated styles

- `inset(alternatesRowBackgrounds:)`
- `bordered(alternatesRowBackgrounds:)`

### Supporting types

- `AutomaticTableStyle`
- `InsetTableStyle`
- `BorderedTableStyle`

## See Also

- `listStyle(_:)`
- `ListStyle`
- `tableStyle(_:)`
- `TableStyleConfiguration`
- `disclosureGroupStyle(_:)`
- `DisclosureGroupStyle`
