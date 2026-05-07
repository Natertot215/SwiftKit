import SwiftUI

struct ColorSchemeGalleryPage: View {
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

extension ColorSchemeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.colorScheme",
        title: "ColorScheme",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: ["ColorScheme"],
        blurb: "The light or dark appearance currently applied to a view. Read with @Environment(\\.colorScheme) and override at presentation boundaries with preferredColorScheme(_:).",
        signature: "enum ColorScheme",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-configuration/colorscheme.md",
        page: { AnyView(ColorSchemeGalleryPage()) }
    )
}

#Preview {
    ColorSchemeGalleryPage()
        .frame(width: 900, height: 700)
}
