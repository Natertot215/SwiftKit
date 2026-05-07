import SwiftUI

struct OutlineGroupGalleryPage: View {
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

extension OutlineGroupGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.lists.outlineGroup",
        title: "OutlineGroup",
        folder: "Lists",
        framework: .swiftUI,
        absorbedSymbols: [
            "OutlineGroup"
        ],
        blurb: "A structure that computes views and disclosure groups on demand from an underlying collection of tree-structured, identified data.",
        signature: "struct OutlineGroup<Data, ID, Parent, Leaf, Subgroup> where Data : RandomAccessCollection, ID : Hashable",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/lists/outlinegroup.md",
        page: { AnyView(OutlineGroupGalleryPage()) }
    )
}

#Preview {
    OutlineGroupGalleryPage()
        .frame(width: 900, height: 700)
}
