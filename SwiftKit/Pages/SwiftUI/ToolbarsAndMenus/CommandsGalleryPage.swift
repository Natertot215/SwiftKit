import SwiftUI

/// Gallery page scaffold for Commands. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct CommandsGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "commands(content:)", api: nil) { Color.clear }
            VariantTile(name: "commandsRemoved()", api: nil) { Color.clear }
            VariantTile(name: "commandsReplaced(content:)", api: nil) { Color.clear }
            VariantTile(name: "CommandGroup", api: nil) { Color.clear }
            VariantTile(name: "CommandGroupPlacement", api: nil) { Color.clear }
            VariantTile(name: "CommandMenu", api: nil) { Color.clear }
            VariantTile(name: "CommandsBuilder", api: nil) { Color.clear }
            VariantTile(name: "Commands", api: nil) { Color.clear }
            VariantTile(name: "EmptyCommands", api: nil) { Color.clear }
            VariantTile(name: "SidebarCommands", api: nil) { Color.clear }
            VariantTile(name: "TextEditingCommands", api: nil) { Color.clear }
            VariantTile(name: "TextFormattingCommands", api: nil) { Color.clear }
            VariantTile(name: "ToolbarCommands", api: nil) { Color.clear }
            VariantTile(name: "ImportFromDevicesCommands", api: nil) { Color.clear }
            VariantTile(name: "InspectorCommands", api: nil) { Color.clear }
            VariantTile(name: "PullDownButton", api: nil) { Color.clear }
        }
    }
}

extension CommandsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.toolbarsAndMenus.commands",
        title: "Commands",
        folder: "Toolbars and Menus",
        framework: .swiftUI,
        absorbedSymbols: ["Commands", "commands", "commandsRemoved", "commandsReplaced"],
        blurb: "Commands — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(CommandsGalleryPage()) }
    )
}
