import SwiftUI

struct GroupBoxStyleGalleryPage: View {
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

extension GroupBoxStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewStyles.groupBoxStyle",
        title: "GroupBoxStyle",
        folder: "View styles",
        framework: .swiftUI,
        absorbedSymbols: [
            "GroupBoxStyle",
            "View/groupBoxStyle(_:)",
            "GroupBoxStyleConfiguration"
        ],
        blurb: "A type that specifies the appearance and interaction of all group boxes within a view hierarchy. Apply via View/groupBoxStyle(_:); customize with a conformer whose makeBody receives a GroupBoxStyleConfiguration.",
        signature: "@MainActor @preconcurrency protocol GroupBoxStyle",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/view-styles/groupboxstyle.md",
        page: { AnyView(GroupBoxStyleGalleryPage()) }
    )
}

#Preview {
    GroupBoxStyleGalleryPage()
        .frame(width: 900, height: 700)
}
