---
url: https://developer.apple.com/documentation/swiftui/scene/commands(content:)
framework: SwiftUI
category: Menus and commands
title: commands(content:)
kind: method
captured: 2026-05-02
---

# commands(content:)

Adds commands to the scene.

## Declaration

```swift
nonisolated func commands<Content>(@CommandsBuilder content: () -> Content) -> some Scene where Content : Commands

```

### Discussion

Commands are realized in different ways on different platforms. On macOS, the main menu uses the available command menus and groups to organize its main menu items. Each menu is represented as a top-level menu bar menu, and each command group has a corresponding set of menu items in one of the top-level menus, delimited by separator menu items.

On iPadOS, commands with keyboard shortcuts are exposed in the shortcut discoverability HUD that users see when they hold down the Command (⌘) key.







## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- visionOS 1.0



## See Also

- `commandsRemoved()`
- `commandsReplaced(content:)`
- `Commands`
- `CommandMenu`
- `CommandGroup`
- `CommandsBuilder`
- `CommandGroupPlacement`
