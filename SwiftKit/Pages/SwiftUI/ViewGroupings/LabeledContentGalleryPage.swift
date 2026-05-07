import SwiftUI

struct LabeledContentGalleryPage: View {
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

extension LabeledContentGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewGroupings.labeledContent",
        title: "LabeledContent",
        folder: "View groupings",
        framework: .swiftUI,
        absorbedSymbols: ["LabeledContent"],
        blurb: "A container for attaching a label to a value-bearing view. Adapts to its container — Form, toolbar, etc. — and matches the layout of adjacent framework controls like Picker.",
        signature: "struct LabeledContent<Label, Content>",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/view-groupings/labeledcontent.md",
        page: { AnyView(LabeledContentGalleryPage()) }
    )
}

#Preview {
    LabeledContentGalleryPage()
        .frame(width: 900, height: 700)
}
