import SwiftUI

struct MenuButtonGalleryPage: View {
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

extension MenuButtonGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.menusAndCommands.menuButton",
        title: "MenuButton",
        folder: "Menus and commands",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.menus-and-commands.menubutton"
        ],
        blurb: "A button that displays a menu containing a list of choices when pressed. Deprecated in macOS 26.5 — use Menu for new code.",
        signature: "struct MenuButton<Label, Content> where Label : View, Content : View",
        availability: "macOS 10.15 (deprecated 26.5)",
        docPath: "Documentation/SwiftUI/menus-and-commands/menubutton.md",
        page: { AnyView(MenuButtonGalleryPage()) }
    )
}

#Preview {
    MenuButtonGalleryPage()
        .frame(width: 900, height: 700)
}
