---
url: https://developer.apple.com/documentation/swiftui/commandmenu
framework: SwiftUI
category: Menus and commands
title: CommandMenu
kind: struct
captured: 2026-05-02
---

# CommandMenu

Command menus are stand-alone, top-level containers for controls that perform related, app-specific commands.

## Declaration

```swift
struct CommandMenu<Content> where Content : View
```

### Overview

Command menus are realized as menu bar menus on macOS, inserted between the built-in View and Window menus in order of declaration. On iOS, iPadOS, and tvOS, SwiftUI creates key commands for each of a menu’s commands that has a keyboard shortcut.





## Relationships

**Conforms To**: `Commands`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- visionOS 1.0

## Topics

### Creating a command menu

- `init(_:content:)`

## See Also

- `commands(content:)`
- `commandsRemoved()`
- `commandsReplaced(content:)`
- `Commands`
- `CommandGroup`
- `CommandsBuilder`
- `CommandGroupPlacement`
