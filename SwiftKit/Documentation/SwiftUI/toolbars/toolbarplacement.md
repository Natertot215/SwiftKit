---
url: https://developer.apple.com/documentation/swiftui/toolbarplacement
framework: SwiftUI
category: Toolbars
title: ToolbarPlacement
kind: struct
captured: 2026-05-02
---

# ToolbarPlacement

The placement of a toolbar.

## Declaration

```swift
struct ToolbarPlacement
```

### Overview

Use this type in conjunction with modifiers like `View/toolbarBackground(_:for:)` and `View/toolbar(_:for:)` to customize the appearance of different bars managed by SwiftUI. Not all bars support all types of customizations.

See `ToolbarItemPlacement` to learn about the different regions of these toolbars that you can place your own controls into.







## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Getting placements

- `automatic`
- `accessoryBar(id:)`
- `bottomBar`
- `bottomOrnament`
- `navigationBar`
- `tabBar`
- `windowToolbar`

### Deprecated symbols

- `init(id:)`

## See Also

- `toolbar(_:for:)`
- `toolbarVisibility(_:for:)`
- `toolbarBackgroundVisibility(_:for:)`
- `ContentToolbarPlacement`
