---
url: https://developer.apple.com/documentation/swiftui/toolbarspacer
framework: SwiftUI
category: Toolbars
title: ToolbarSpacer
kind: struct
captured: 2026-05-02
---

# ToolbarSpacer

A standard space item in toolbars.

## Declaration

```swift
struct ToolbarSpacer
```

### Overview

A space item creates visual breaks in the toolbar between items. Spacers can have a standard fixed size or be flexible and push items apart.

Spacers can also be used in customizable toolbars:

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

Space items are customizable and can be added, removed, and rearranged by users. If a customizable toolbar supports a spacer of a given type, users can also add in multiple copies of that spacer from the customization panel.





## Relationships

**Conforms To**: `CustomizableToolbarContent`, `ToolbarContent`

## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0

## Topics

### Initializers

- `init(_:placement:)`

## See Also

- `toolbar(content:)`
- `ToolbarItem`
- `ToolbarItemGroup`
- `ToolbarItemPlacement`
- `ToolbarContent`
- `ToolbarContentBuilder`
- `DefaultToolbarItem`
