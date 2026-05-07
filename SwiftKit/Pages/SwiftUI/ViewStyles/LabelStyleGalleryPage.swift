import SwiftUI

struct LabelStyleGalleryPage: View {
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

extension LabelStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewStyles.labelStyle",
        title: "LabelStyle",
        folder: "View styles",
        framework: .swiftUI,
        absorbedSymbols: [
            "LabelStyle",
            "View/labelStyle(_:)",
            "LabelStyleConfiguration"
        ],
        blurb: "A type that applies a custom appearance to all labels within a view. Apply via View/labelStyle(_:); a custom conformer's makeBody receives a LabelStyleConfiguration.",
        signature: "@MainActor @preconcurrency protocol LabelStyle",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/view-styles/labelstyle.md",
        page: { AnyView(LabelStyleGalleryPage()) }
    )
}

#Preview {
    LabelStyleGalleryPage()
        .frame(width: 900, height: 700)
}
