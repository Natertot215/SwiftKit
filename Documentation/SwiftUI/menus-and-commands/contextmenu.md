---
url: https://developer.apple.com/documentation/swiftui/contextmenu
framework: SwiftUI
category: Menus and commands
title: ContextMenu
kind: struct
captured: 2026-05-02
---

# ContextMenu

A container for views that you present as menu items in a context menu.

## Declaration

```swift
struct ContextMenu<MenuItems> where MenuItems : View
```

### Overview

A context menu view allows you to present a situationally specific menu that enables taking actions relevant to the current task.

You can create a context menu by first defining a `ContextMenu` container with the controls that represent the actions people can take, and then using the `View/contextMenu(_:)` view modifier to apply the menu to a view.

The example below creates and applies a two item context menu container to a `Text` view. The Boolean value `shouldShowMenu`, which defaults to true, controls the availability of context menu:

```swift
private let menuItems = ContextMenu {
    Button {
        // Add this item to a list of favorites.
    } label: {
        Label("Add to Favorites", systemImage: "heart")
    }
    Button {
        // Open Maps and center it on this item.
    } label: {
        Label("Show in Maps", systemImage: "mappin")
    }
}

private struct ContextMenuMenuItems: View {
    @State private var shouldShowMenu = true

    var body: some View {
        Text("Turtle Rock")
            .contextMenu(shouldShowMenu ? menuItems : nil)
    }
}
```







## Availability

- iOS 13.0 (deprecated 26.5)
- iPadOS 13.0 (deprecated 26.5)
- Mac Catalyst 13.0 (deprecated 26.5)
- macOS 10.15 (deprecated 26.5)
- visionOS 1.0 (deprecated 26.5)
- watchOS 6.0 (deprecated 7.0)

## Topics

### Creating a context menu

- `init(menuItems:)`

## See Also

- `MenuButton`
- `PullDownButton`
