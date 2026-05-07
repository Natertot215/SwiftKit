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
            ReferenceTile(
                name: "Pull-down menu form",
                signature: "MenuBarExtra(\"Status\", systemImage: \"hammer\") { Button(\"Action\") { } Divider() Button(\"Quit\") { } }",
                note: "Default style — a system menu drops down when the user clicks the menu bar item. Children must be Buttons, Toggles, Dividers, or other menu-eligible items."
            )

            ReferenceTile(
                name: "Custom window form",
                signature: ".menuBarExtraStyle(.window)",
                note: "Switches to a popover-style window that hosts an arbitrary SwiftUI view — appropriate for richer status panels (volume sliders, mini-players, dashboards). Default is the menu form."
            )

            ReferenceTile(
                name: "Visibility binding",
                signature: "MenuBarExtra(\"…\", isInserted: $showMenuBar) { … }",
                note: "Bind isInserted to a Bool to programmatically add or remove the menu bar item — useful for letting the user hide it from a Settings toggle."
            )

            ReferenceTile(
                name: "MenuBarExtraStyle",
                signature: "protocol MenuBarExtraStyle  // .menu (default) and .window",
                note: "Built-in styles: .menu renders a system pull-down; .window renders a popover-style window. Apply via .menuBarExtraStyle(_:) on the MenuBarExtra scene."
            )

            ReferenceTile(
                name: "App configuration",
                signature: "Set LSUIElement = true in Info.plist to suppress the Dock icon",
                note: "MenuBarExtra-only utilities typically run as accessory apps. Add LSUIElement (\"Application is agent\") = YES in Info.plist so the app appears only in the menu bar without a Dock presence or app menu."
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
