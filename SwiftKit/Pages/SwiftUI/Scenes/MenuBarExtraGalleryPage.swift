import SwiftUI

struct MenuBarExtraGalleryPage: View {
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

extension MenuBarExtraGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scenes.menuBarExtra",
        title: "MenuBarExtra",
        folder: "Scenes",
        framework: .swiftUI,
        absorbedSymbols: [
            "MenuBarExtra",
            "MenuBarExtraStyle",
            "Scene/menuBarExtraStyle(_:)",
            "swiftui.scenes.menubarextra",
            "swiftui.scenes.menubarextrastyle",
            "swiftui.scenes.menubarextrastyle(_:)"
        ],
        blurb: "A scene that renders itself as a persistent control in the system menu bar. Pair with menuBarExtraStyle(_:) and a MenuBarExtraStyle conformance to choose between a pull-down menu and a custom popover-style window.",
        signature: "struct MenuBarExtra<Label, Content> : Scene where Label : View, Content : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/scenes/menubarextra.md",
        page: { AnyView(MenuBarExtraGalleryPage()) }
    )
}

#Preview {
    MenuBarExtraGalleryPage()
        .frame(width: 900, height: 700)
}
