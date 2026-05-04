import SwiftUI

struct CommandsFamilyDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Scene Commands",
            docPath: "Documentation/SwiftUI/menus-and-commands/",
            availability: "macOS 11.0+",
            blurb: """
            SwiftUI's command system populates and modifies the macOS menu bar from a Scene scope. Commands is the protocol; CommandsBuilder is its result builder. CommandMenu adds a new top-level menu between the app's built-in menus. CommandGroup inserts content relative to an existing system group identified by CommandGroupPlacement — you can place items .before, .after, or .replacing any of the named placements like .newItem, .saveItem, .undoRedo, or .windowArrangement. The Scene modifiers commands(content:), commandsRemoved(), and commandsReplaced(content:) wire these into a WindowGroup or other scene.

            Apple ships several ready-made Commands-conforming types for common additions: SidebarCommands adds View > Show/Hide Sidebar; TextEditingCommands adds Edit menu text actions; TextFormattingCommands adds Format menu items; ToolbarCommands adds View > Show/Hide Toolbar; ImportFromDevicesCommands adds File > Import From; InspectorCommands adds inspector show/hide; EmptyCommands is a no-op stub. All of these live at Scene scope — none can be instantiated inside a child view.
            """,
            signatures: [
                "WindowGroup { … }.commands { CommandMenu(\"Help\") { … } }",
                "CommandMenu(\"Title\") { Button … }",
                "CommandGroup(after: .newItem) { Button … }",
                "CommandGroupPlacement — .newItem, .saveItem, .undoRedo, .pasteboard, .windowArrangement, …",
                "protocol Commands",
                "CommandsBuilder",
                "Scene.commandsRemoved()",
                "Scene.commandsReplaced(content:)",
                "SidebarCommands(), TextEditingCommands(), TextFormattingCommands()",
                "ToolbarCommands(), ImportFromDevicesCommands()",
                "InspectorCommands(), EmptyCommands()"
            ],
            notes: [
                "Commands are attached to scenes, not views: .commands { … } is a Scene modifier, not a View modifier.",
                "CommandGroupPlacement has named static properties for every built-in macOS menu group.",
                "To test Commands, run the app from Xcode — Previews do not show the menu bar."
            ]
        )
    }
}

#Preview {
    CommandsFamilyDescribePage()
        .frame(width: 900, height: 700)
}
