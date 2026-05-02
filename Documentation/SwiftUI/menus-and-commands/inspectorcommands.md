---
url: https://developer.apple.com/documentation/swiftui/inspectorcommands
framework: SwiftUI
category: Menus and commands
title: InspectorCommands
kind: struct
captured: 2026-05-02
---

# InspectorCommands

A built-in set of commands for manipulating inspectors.

## Declaration

```swift
struct InspectorCommands
```

### Overview

`InspectorCommands` include a command for toggling the presented state of the inspector with a keyboard shortcut of Control-Command-I.

These commands are optional and can be explicitly requested by passing a value of this type to the `Scene/commands(content:)` modifier:

```swift
@State var presented = true
WindowGroup {
    MainView()
        .inspector(isPresented: $presented) {
            InspectorView()
        }
}
.commands {
    InspectorCommands()
}
```





## Relationships

**Conforms To**: `Commands`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- visionOS 1.0

## Topics

### Creating a command

- `init()`

## See Also

- `SidebarCommands`
- `TextEditingCommands`
- `TextFormattingCommands`
- `ToolbarCommands`
- `ImportFromDevicesCommands`
- `EmptyCommands`
