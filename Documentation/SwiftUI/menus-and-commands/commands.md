---
url: https://developer.apple.com/documentation/swiftui/commands
framework: SwiftUI
category: Menus and commands
title: Commands
kind: protocol
captured: 2026-05-02
---

# Commands

Conforming types represent a group of related commands that can be exposed to the user via the main menu on macOS and key commands on iOS.

## Declaration

```swift
@MainActor @preconcurrency protocol Commands
```

### Overview

A type conforming to this protocol inherits `@preconcurrency @MainActor` isolation from the protocol if the conformance is included in the type’s base declaration:

```swift
struct MyCustomType: Transition {
    // `@preconcurrency @MainActor` isolation by default
}
```

Isolation to the main actor is the default, but it’s not required. Declare the conformance in an extension to opt out of main actor isolation:

```swift
extension MyCustomType: Transition {
    // `nonisolated` by default
}
```





## Relationships

**Conforming Types**: `CommandGroup`, `CommandMenu`, `EmptyCommands`, `Group`, `ImportFromDevicesCommands`, `InspectorCommands`, `SidebarCommands`, `TextEditingCommands`, `TextFormattingCommands`, `ToolbarCommands`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- visionOS 1.0

## Topics

### Implementing commands

- `body`
- `Body`

## See Also

- `commands(content:)`
- `commandsRemoved()`
- `commandsReplaced(content:)`
- `CommandMenu`
- `CommandGroup`
- `CommandsBuilder`
- `CommandGroupPlacement`
