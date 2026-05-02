---
url: https://developer.apple.com/documentation/swiftui/scene/commandsremoved()
framework: SwiftUI
category: Menus and commands
title: commandsRemoved()
kind: method
captured: 2026-05-02
---

# commandsRemoved()

Removes all commands defined by the modified scene.

## Declaration

```swift
nonisolated func commandsRemoved() -> some Scene

```

### Return Value

A scene that excludes any commands defined by its children.

### Discussion

`WindowGroup`, `Window`, and other scene types all have an associated set of commands that they include by default. Apply this modifier to a scene to exclude those commands.

For example, the following code adds a scene for presenting the details of an individual data model in a separate window. To ensure that the window can only appear programmatically, we remove the scene’s commands, including File > New Note Window.

```swift
@main
struct Example: App {
    var body: some Scene {
        ...

        WindowGroup("Note", id: "note", for: Note.ID.self) {
            NoteDetailView(id: $0)
        }
        .commandsRemoved()
    }
}
```







## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- visionOS 1.0



## See Also

- `commands(content:)`
- `commandsReplaced(content:)`
- `Commands`
- `CommandMenu`
- `CommandGroup`
- `CommandsBuilder`
- `CommandGroupPlacement`
