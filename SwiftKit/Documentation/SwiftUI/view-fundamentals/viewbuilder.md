---
url: https://developer.apple.com/documentation/swiftui/viewbuilder
framework: SwiftUI
category: View fundamentals
title: ViewBuilder
kind: struct
captured: 2026-05-02
---

# ViewBuilder

A custom parameter attribute that constructs views from closures.

## Declaration

```swift
@resultBuilder struct ViewBuilder
```

### Overview

You typically use `ViewBuilder` as a parameter attribute for child view-producing closure parameters, allowing those closures to provide multiple child views. For example, the following `contextMenu` function accepts a closure that produces one or more views via the view builder.

```swift
func contextMenu<MenuItems: View>(
    @ViewBuilder menuItems: () -> MenuItems
) -> some View
```

Clients of this function can use multiple-statement closures to provide several child views, as shown in the following example:

```swift
myView.contextMenu {
    Text("Cut")
    Text("Copy")
    Text("Paste")
    if isSymbol {
        Text("Jump to Definition")
    }
}
```







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Building content

- `buildBlock()`
- `buildBlock(_:)`
- `buildExpression(_:)`

### Conditionally building content

- `buildEither(first:)`
- `buildEither(second:)`
- `buildIf(_:)`
- `buildLimitedAvailability(_:)`

## See Also

- `Declaring a custom view`
- `View`
