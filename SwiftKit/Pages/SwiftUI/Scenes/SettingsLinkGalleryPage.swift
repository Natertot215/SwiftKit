import SwiftUI

struct SettingsLinkGalleryPage: View {
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

extension SettingsLinkGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scenes.settingsLink",
        title: "SettingsLink",
        folder: "Scenes",
        framework: .swiftUI,
        absorbedSymbols: ["SettingsLink"],
        blurb: "A view that opens the Settings scene defined by an app. Embed one anywhere in the view hierarchy to expose the system-standard Settings entry point — for example inside a MenuBarExtra menu.",
        signature: "struct SettingsLink<Label> where Label : View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/scenes/settingslink.md",
        page: { AnyView(SettingsLinkGalleryPage()) }
    )
}

#Preview {
    SettingsLinkGalleryPage()
        .frame(width: 900, height: 700)
}
