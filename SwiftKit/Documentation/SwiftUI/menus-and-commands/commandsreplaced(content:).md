---
url: https://developer.apple.com/documentation/swiftui/scene/commandsreplaced(content:)
framework: SwiftUI
category: Menus and commands
title: commandsReplaced(content:)
kind: method
captured: 2026-05-02
---

# commandsReplaced(content:)

Replaces all commands defined by the modified scene with the commands from the builder.

## Declaration

```swift
nonisolated func commandsReplaced<Content>(@CommandsBuilder content: () -> Content) -> some Scene where Content : Commands

```

### Return Value

A scene that replaces any commands defined by its children with alternative content.

### Discussion

`WindowGroup`, `Window`, and other scene types all have an associated set of commands that they include by default. Apply this modifier to a scene to replace those commands with the output from the given builder.

For example, the following code adds a scene for showing the contents of the pasteboard in a dedicated window. We replace the scene’s default Window > Clipboard menu command with a custom Edit > Show Clipboard command that we place next to the other pasteboard commands.

```swift
@main
struct Example: App {
    @Environment(\.openWindow) var openWindow

    var body: some Scene {
        ...

        Window("Clipboard", id: "clipboard") {
            ClipboardContentView()
        }
        .commandsReplaced {
            CommandGroup(after: .pasteboard) {
                Section {
                    Button("Show Clipboard") {
                        openWindow(id: "clipboard")
                    }
                }
            }
        }
    }
}
```

## Parameters

- **content**: A `Commands` builder whose output will be used to replace the commands normally provided by the modified scene.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- visionOS 1.0



## See Also

- `commands(content:)`
- `commandsRemoved()`
- `Commands`
- `CommandMenu`
- `CommandGroup`
- `CommandsBuilder`
- `CommandGroupPlacement`
