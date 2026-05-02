---
url: https://developer.apple.com/documentation/swiftui/toolbaritemgroup
framework: SwiftUI
category: Toolbars
title: ToolbarItemGroup
kind: struct
captured: 2026-05-02
---

# ToolbarItemGroup

A model that represents a group of `ToolbarItem`s which can be placed in the toolbar or navigation bar.

## Declaration

```swift
struct ToolbarItemGroup<Content> where Content : View
```







## Relationships

**Conforms To**: `ToolbarContent`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Creating a toolbar item group

- `init(placement:content:)`
- `init(placement:content:label:)`

### Supporting types

- `LabeledToolbarItemGroupContent`

## See Also

- `toolbar(content:)`
- `ToolbarItem`
- `ToolbarItemPlacement`
- `ToolbarContent`
- `ToolbarContentBuilder`
- `ToolbarSpacer`
- `DefaultToolbarItem`
