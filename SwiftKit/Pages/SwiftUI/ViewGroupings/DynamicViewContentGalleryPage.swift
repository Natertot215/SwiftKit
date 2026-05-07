import SwiftUI

struct DynamicViewContentGalleryPage: View {
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

extension DynamicViewContentGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewGroupings.dynamicViewContent",
        title: "DynamicViewContent",
        folder: "View groupings",
        framework: .swiftUI,
        absorbedSymbols: ["DynamicViewContent"],
        blurb: "A view that generates content from an underlying collection of data. ForEach conforms to it, unlocking onDelete, onInsert, onMove, and dropDestination modifiers for List rows.",
        signature: "protocol DynamicViewContent<Data> : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-groupings/dynamicviewcontent.md",
        page: { AnyView(DynamicViewContentGalleryPage()) }
    )
}

#Preview {
    DynamicViewContentGalleryPage()
        .frame(width: 900, height: 700)
}
