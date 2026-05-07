import SwiftUI

struct IndexViewStyleGalleryPage: View {
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

extension IndexViewStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewStyles.indexViewStyle",
        title: "IndexViewStyle",
        folder: "View styles",
        framework: .swiftUI,
        absorbedSymbols: [
            "IndexViewStyle",
            "View/indexViewStyle(_:)"
        ],
        blurb: "Defines the implementation of all IndexView instances within a view hierarchy. Built-in conformer: PageIndexViewStyle. Apply via View/indexViewStyle(_:).",
        signature: "protocol IndexViewStyle",
        availability: nil,
        docPath: "Documentation/SwiftUI/view-styles/indexviewstyle.md",
        page: { AnyView(IndexViewStyleGalleryPage()) }
    )
}

#Preview {
    IndexViewStyleGalleryPage()
        .frame(width: 900, height: 700)
}
