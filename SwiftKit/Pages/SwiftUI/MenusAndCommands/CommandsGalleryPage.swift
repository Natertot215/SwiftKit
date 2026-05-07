import SwiftUI

struct CommandsGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
            )
        }
    }
}

extension CommandsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.menusAndCommands.commands",
        title: "Commands",
        folder: "Menus and commands",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.menus-and-commands.building-and-customizing-the-menu-bar-with-swiftui",
            "swiftui.menus-and-commands.commandgroup",
            "swiftui.menus-and-commands.commandgroupplacement",
            "swiftui.menus-and-commands.commandmenu",
            "swiftui.menus-and-commands.commands",
            "swiftui.menus-and-commands.commands(content:)",
            "swiftui.menus-and-commands.commandsbuilder",
            "swiftui.menus-and-commands.commandsremoved()",
            "swiftui.menus-and-commands.commandsreplaced(content:)",
            "swiftui.menus-and-commands.emptycommands",
            "swiftui.menus-and-commands.importfromdevicescommands",
            "swiftui.menus-and-commands.inspectorcommands",
            "swiftui.menus-and-commands.sidebarcommands",
            "swiftui.menus-and-commands.texteditingcommands",
            "swiftui.menus-and-commands.textformattingcommands",
            "swiftui.menus-and-commands.toolbarcommands"
        ],
        blurb: "The Commands protocol and its concrete conformers for customizing the macOS menu bar. Covers CommandGroup and CommandMenu for authoring custom menus alongside Apple's built-in command sets — SidebarCommands, ToolbarCommands, InspectorCommands, TextEditingCommands, TextFormattingCommands, ImportFromDevicesCommands, and EmptyCommands.",
        signature: "Commands \u{00b7} CommandGroup \u{00b7} CommandMenu \u{00b7} SidebarCommands \u{00b7} ToolbarCommands \u{00b7} InspectorCommands \u{00b7} TextEditingCommands \u{00b7} TextFormattingCommands \u{00b7} ImportFromDevicesCommands \u{00b7} EmptyCommands",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/menus-and-commands/commands.md",
        page: { AnyView(CommandsGalleryPage()) }
    )
}

#Preview {
    CommandsGalleryPage()
        .frame(width: 900, height: 700)
}
