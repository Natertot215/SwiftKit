import SwiftUI

struct OpacityGalleryPage: View {
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

extension OpacityGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.opacity",
        title: "Opacity",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: ["View/opacity(_:)"],
        blurb: "Sets the transparency of this view. Values range from 0 (fully transparent) to 1 (fully opaque); stacked modifiers multiply.",
        signature: "func opacity(_ opacity: Double) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-configuration/opacity(_:).md",
        page: { AnyView(OpacityGalleryPage()) }
    )
}

#Preview {
    OpacityGalleryPage()
        .frame(width: 900, height: 700)
}
