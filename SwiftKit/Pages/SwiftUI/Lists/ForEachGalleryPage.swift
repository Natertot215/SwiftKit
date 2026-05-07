import SwiftUI

struct ForEachGalleryPage: View {
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

extension ForEachGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.lists.foreach",
        title: "ForEach",
        folder: "Lists",
        framework: .swiftUI,
        absorbedSymbols: [
            "ForEach"
        ],
        blurb: "A structure that computes views on demand from an underlying collection of identified data. Either the collection's elements conform to Identifiable, or the initializer provides an id key path.",
        signature: "struct ForEach<Data, ID, Content> where Data : RandomAccessCollection, ID : Hashable",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/lists/foreach.md",
        page: { AnyView(ForEachGalleryPage()) }
    )
}

#Preview {
    ForEachGalleryPage()
        .frame(width: 900, height: 700)
}
