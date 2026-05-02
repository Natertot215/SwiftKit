---
url: https://developer.apple.com/documentation/swiftui/toolbaritemplacement
framework: SwiftUI
category: Toolbars
title: ToolbarItemPlacement
kind: struct
captured: 2026-05-02
---

# ToolbarItemPlacement

A structure that defines the placement of a toolbar item.

## Declaration

```swift
struct ToolbarItemPlacement
```

### Overview

There are two types of placements:

- Semantic placements, such as `ToolbarItemPlacement/principal` and `ToolbarItemPlacement/navigation`, denote the intent of the item being added. SwiftUI determines the appropriate placement for the item based on this intent and its surrounding context, like the current platform.
- Positional placements, such as `ToolbarItemPlacement/navigationBarLeading`, denote a precise placement for the item, usually for a particular platform.

In iOS, iPadOS, and macOS, the system uses the space available to the toolbar when determining how many items to render in the toolbar. If not all items fit in the available space, an overflow menu may be created and remaining items placed in that menu.







## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Getting semantic placement

- `automatic`
- `principal`
- `status`

### Getting placement for specific actions

- `primaryAction`
- `secondaryAction`
- `confirmationAction`
- `cancellationAction`
- `destructiveAction`
- `navigation`

### Getting explicit placement

- `topBarLeading`
- `topBarTrailing`
- `bottomBar`
- `bottomOrnament`
- `keyboard`
- `accessoryBar(id:)`

### Deprecated symbols

- `init(id:)`
- `navigationBarLeading`
- `navigationBarTrailing`

### Type Properties

- `largeSubtitle`
- `largeTitle`
- `subtitle`
- `title`

## See Also

- `toolbar(content:)`
- `ToolbarItem`
- `ToolbarItemGroup`
- `ToolbarContent`
- `ToolbarContentBuilder`
- `ToolbarSpacer`
- `DefaultToolbarItem`
