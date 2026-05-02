---
url: https://developer.apple.com/documentation/swiftui/toolbaritem
framework: SwiftUI
category: Toolbars
title: ToolbarItem
kind: struct
captured: 2026-05-02
---

# ToolbarItem

A model that represents an item which can be placed in the toolbar or navigation bar.

## Declaration

```swift
struct ToolbarItem<ID, Content> where Content : View
```







## Relationships

**Conforms To**: `Copyable`, `CustomizableToolbarContent`, `Escapable`, `Identifiable`, `ToolbarContent`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Creating a toolbar item

- `init(placement:content:)`
- `init(id:placement:content:)`
- `init(id:placement:showsByDefault:content:)`

## See Also

- `toolbar(content:)`
- `ToolbarItemGroup`
- `ToolbarItemPlacement`
- `ToolbarContent`
- `ToolbarContentBuilder`
- `ToolbarSpacer`
- `DefaultToolbarItem`
