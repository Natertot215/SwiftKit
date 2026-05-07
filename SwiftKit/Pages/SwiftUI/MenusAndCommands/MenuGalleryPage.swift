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
            "Menu",
            "View/menuActionDismissBehavior(_:)",
            "MenuActionDismissBehavior",
            "swiftui.menus-and-commands.populating-swiftui-menus-with-adaptive-controls"
        ],
        blurb: "A control for presenting a menu of actions. Build menus with Buttons, Toggles, Sections, Dividers, and nested Menus; pair with menuActionDismissBehavior to control whether a menu closes after a selection.",
        signature: "struct Menu<Label, Content> where Label : View, Content : View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/menus-and-commands/menu.md",
        page: { AnyView(MenuGalleryPage()) }
    )
}

#Preview {
    MenuGalleryPage()
        .frame(width: 900, height: 700)
}
