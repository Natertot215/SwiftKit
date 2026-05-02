---
url: https://developer.apple.com/documentation/swiftui/importfromdevicescommands
framework: SwiftUI
category: Menus and commands
title: ImportFromDevicesCommands
kind: struct
captured: 2026-05-02
---

# ImportFromDevicesCommands

A built-in set of commands that enables importing content from nearby devices.

## Declaration

```swift
struct ImportFromDevicesCommands
```

### Overview

This set of commands adds items based on nearby devices and capabilities, like taking photos or scanning documents. Views can receive imported content from these menu items by using the `View/importsItemProviders(_:onImport:)` modifier.

These commands are optional and you can explicitly request them by passing a value of this type to the `Scene/commands(content:)` modifier.





## Relationships

**Conforms To**: `Commands`

## Availability

- macOS 12.0

## Topics

### Creating the command group

- `init()`

## See Also

- `SidebarCommands`
- `TextEditingCommands`
- `TextFormattingCommands`
- `ToolbarCommands`
- `InspectorCommands`
- `EmptyCommands`
