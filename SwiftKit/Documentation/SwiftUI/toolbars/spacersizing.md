---
url: https://developer.apple.com/documentation/swiftui/spacersizing
framework: SwiftUI
category: Toolbars
title: SpacerSizing
kind: struct
captured: 2026-05-02
---

# SpacerSizing

A type which defines how spacers should size themselves.

## Declaration

```swift
struct SpacerSizing
```

### Overview

Use this type in coordination with the `ToolbarSpacer` type to define if the spacer should be a flexible size, or a fixed size using system-defined sizing rules.

For example, the following adds a fixed-size toolbar spacer between the share and more buttons in the toolbar:

```swift
ContentView()
    .toolbar(id: "main-toolbar") {
        ToolbarItem(id: "tag") {
           TagButton()
        }
        ToolbarItem(id: "share") {
           ShareButton()
        }
        ToolbarSpacer(.fixed)
        ToolbarItem(id: "more") {
           MoreButton()
        }
    }
```





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0

## Topics

### Type Properties

- `fixed`
- `flexible`

## See Also

- `toolbarBackground(_:for:)`
- `toolbarColorScheme(_:for:)`
- `toolbarForegroundStyle(_:for:)`
- `windowToolbarStyle(_:)`
- `WindowToolbarStyle`
- `toolbarLabelStyle`
- `ToolbarLabelStyle`
