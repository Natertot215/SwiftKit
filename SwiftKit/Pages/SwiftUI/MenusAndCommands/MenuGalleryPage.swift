import SwiftUI

struct MenuGalleryPage: View {
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

extension MenuGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.menusAndCommands.menu",
        title: "Menu",
        folder: "Menus and commands",
        framework: .swiftUI,
        absorbedSymbols: [
            "ContextMenu",
            "Menu",
            "MenuActionDismissBehavior",
            "PullDownButton",
            "View/contextMenu(forSelectionType:menu:primaryAction:)",
            "View/contextMenu(menuItems:)",
            "View/contextMenu(menuItems:preview:)",
            "View/menuActionDismissBehavior(_:)",
            "swiftui.menus-and-commands.contextmenu",
            "swiftui.menus-and-commands.menubutton",
            "swiftui.menus-and-commands.populating-swiftui-menus-with-adaptive-controls"
        ],
        blurb: "A control for presenting a menu of actions, covering Menu plus its related variants — the deprecated MenuButton, the legacy macOS PullDownButton typealias, and the right-click ContextMenu container. Build menus with Buttons, Toggles, Sections, Dividers, and nested Menus, attach context menus via the contextMenu modifier, and use menuActionDismissBehavior to control whether a menu closes after a selection.",
        signature: "Menu \u{00b7} MenuButton \u{00b7} PullDownButton \u{00b7} ContextMenu \u{00b7} MenuActionDismissBehavior \u{00b7} MenuStyle",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/menus-and-commands/menu.md",
        page: { AnyView(MenuGalleryPage()) }
    )
}

#Preview {
    MenuGalleryPage()
        .frame(width: 900, height: 700)
}
