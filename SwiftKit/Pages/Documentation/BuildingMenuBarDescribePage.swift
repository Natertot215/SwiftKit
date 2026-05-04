import SwiftUI

struct BuildingMenuBarDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Building and Customizing the Menu Bar with SwiftUI",
            docPath: "Documentation/SwiftUI/menus-and-commands/building-and-customizing-the-menu-bar-with-swiftui.md",
            availability: "macOS 13.0+",
            blurb: """
            Provide a seamless, cross-platform user experience by building a native menu bar for iPadOS and macOS.

            ## Overview

            On iPadOS and macOS, the menu bar provides access to crucial system-provided actions, such as Cut, Copy, Paste, and window management. Apps can add contextual actions, like showing and hiding a sidebar, and can also create custom menus and menu items to allow people to perform app-specific actions from the menu bar. You can also bind menu bar items to keyboard shortcuts.

            Apps include instances of Scene which display the main views of the app. Each scene provides different default menu sets and actions in the menu bar. Contextually relevant menus and actions are specified with the commands(content:) modifier.

            ## Populate the Menu Bar

            When your app launches, the menu bar populates with menus and menu items based on the implemented scenes and commands. Each scene includes a set of default menus and menu items, which you can supplement using the commands(content:) modifier.

            A WindowGroup scene includes commands for quitting and hiding the app, as well as Copy and Paste support and window management:

            ```swift
            @main
            struct MyApp: App {
                var body: some Scene {
                    WindowGroup {
                        ContentView()
                    }
                }
            }
            ```

            On macOS, the Settings scene adds an action for presenting the app's Settings window:

            ```swift
            @main
            struct MyApp: App {
                var body: some Scene {
                    WindowGroup { ContentView() }
                    #if os(macOS)
                    Settings { SettingsView() }
                    #endif
                }
            }
            ```

            ## Add Contextual System-Provided Menu Items

            Some common menu items are optional but helpful if the app contains certain capabilities. For scenes that include a navigation sidebar, include SidebarCommands using the commands(content:) modifier:

            ```swift
            .commands {
                SidebarCommands()
            }
            ```

            For more information on system-provided command groups such as text formatting, toolbars, and inspectors, see the Commands documentation.

            ## Create Custom Menus and Menu Items

            Organize and group your app's custom menu items using CommandMenu. The system inserts custom menus into the menu bar after the View menu:

            ```swift
            WindowGroup {
                ContentView()
            }
            .commands {
                CommandMenu("Actions") {
                    Button("Run", systemImage: "play.fill") { ... }
                        .keyboardShortcut("R")
                    Button("Stop", systemImage: "stop.fill") { ... }
                        .keyboardShortcut(".")
                }
            }
            ```

            ## Modify Standard Menus

            Modify system-provided menus using CommandGroup. These groups either extend menus with additional menu items or replace existing menu items at a specified location:

            ```swift
            .commands {
                CommandGroup(before: .systemServices) {
                    Button("Check for Updates") { ... }
                }
                CommandGroup(after: .newItem) {
                    Button("New from Clipboard") { ... }
                }
                CommandGroup(replacing: .help) {
                    Button("User Manual") { ... }
                }
            }
            ```

            ## Update Menus and Menu Items Dynamically

            Use FocusedValue to create contextual dependencies with your menus and menu items. A focused value is state data that requires an active scene with its view hierarchy in focus:

            ```swift
            struct MessageCommands: Commands {
                @FocusedValue(DataModel.self) private var dataModel: DataModel?

                var body: some Commands {
                    CommandGroup(after: .newItem) {
                        Button("New Message") {
                            dataModel?.messages.append(...)
                        }
                        .disabled(dataModel == nil)
                    }
                }
            }
            ```

            To share value-typed values, extend FocusedValues with a custom entry using the @Entry macro, and pass the resulting key path when declaring the FocusedValue property.
            """,
            notes: [
                "Full article: Documentation/SwiftUI/menus-and-commands/building-and-customizing-the-menu-bar-with-swiftui.md",
                "Also indexed under: swiftui.scenes.building-and-customizing-the-menu-bar-with-swiftui."
            ]
        )
    }
}

#Preview {
    BuildingMenuBarDescribePage()
        .frame(width: 900, height: 900)
}
