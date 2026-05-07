import SwiftUI

struct HelpGalleryPage: View {
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

extension HelpGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.help",
        title: "Help",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: ["View/help(_:)"],
        blurb: "Adds help text to a view — exposes a tooltip on macOS / visionOS and an accessibility hint on every platform. Accepts Text, LocalizedStringKey, or String forms.",
        signature: "func help(_ text: Text) -> some View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/view-configuration/help(_:).md",
        page: { AnyView(HelpGalleryPage()) }
    )
}

#Preview {
    HelpGalleryPage()
        .frame(width: 900, height: 700)
}
