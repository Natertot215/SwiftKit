---
url: https://developer.apple.com/documentation/swiftui/commandgroup
framework: SwiftUI
category: Menus and commands
title: CommandGroup
kind: struct
captured: 2026-05-02
---

# CommandGroup

Groups of controls that you can add to existing command menus.

## Declaration

```swift
struct CommandGroup<Content> where Content : View
```

### Overview

In macOS, SwiftUI realizes command groups as collections of menu items in a menu bar menu. In iOS, iPadOS, and tvOS, SwiftUI creates key commands for each of a group’s commands that has a keyboard shortcut.





## Relationships

**Conforms To**: `Commands`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- visionOS 1.0

## Topics

### Creating a command group

- `init(after:addition:)`
- `init(before:addition:)`
- `init(replacing:addition:)`

## See Also

- `commands(content:)`
- `commandsRemoved()`
- `commandsReplaced(content:)`
- `Commands`
- `CommandMenu`
- `CommandsBuilder`
- `CommandGroupPlacement`
