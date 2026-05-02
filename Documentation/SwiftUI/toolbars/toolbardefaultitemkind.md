---
url: https://developer.apple.com/documentation/swiftui/toolbardefaultitemkind
framework: SwiftUI
category: Toolbars
title: ToolbarDefaultItemKind
kind: struct
captured: 2026-05-02
---

# ToolbarDefaultItemKind

A kind of toolbar item a `View` adds by default.

## Declaration

```swift
struct ToolbarDefaultItemKind
```

### Overview

`View`s can add toolbar items clients may wish to remove or customize. A default item kind can be passed to the `View/toolbar(removing:)` modifier to remove the item. Documentation on the `View` placing the default item should reference the `ToolbarDefaultItemKind` used to remove the item.







## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Getting the default item types

- `sidebarToggle`

### Type Properties

- `search`
- `title`

## See Also

- `toolbar(removing:)`
