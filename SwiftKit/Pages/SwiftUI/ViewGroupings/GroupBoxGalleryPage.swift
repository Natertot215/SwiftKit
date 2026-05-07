import SwiftUI

struct GroupBoxGalleryPage: View {
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

extension GroupBoxGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewGroupings.groupBox",
        title: "GroupBox",
        folder: "View groupings",
        framework: .swiftUI,
        absorbedSymbols: ["GroupBox"],
        blurb: "A stylized container, with an optional label, that visually collects a logical grouping of content. Often used in settings panes and inspectors to box related controls.",
        signature: "struct GroupBox<Label, Content> where Label : View, Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-groupings/groupbox.md",
        page: { AnyView(GroupBoxGalleryPage()) }
    )
}

#Preview {
    GroupBoxGalleryPage()
        .frame(width: 900, height: 700)
}
