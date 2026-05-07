import SwiftUI

struct ContextMenuGalleryPage: View {
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

extension ContextMenuGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.menusAndCommands.contextMenu",
        title: "ContextMenu",
        folder: "Menus and commands",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.menus-and-commands.contextmenu",
            "View/contextMenu(menuItems:)",
            "View/contextMenu(menuItems:preview:)",
            "View/contextMenu(forSelectionType:menu:primaryAction:)"
        ],
        blurb: "A container for views you present as menu items in a context menu. Attach via the contextMenu modifier — with or without a custom preview — or build an item-based menu over a List or Table selection.",
        signature: "struct ContextMenu<MenuItems> where MenuItems : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/menus-and-commands/contextmenu.md",
        page: { AnyView(ContextMenuGalleryPage()) }
    )
}

#Preview {
    ContextMenuGalleryPage()
        .frame(width: 900, height: 700)
}
