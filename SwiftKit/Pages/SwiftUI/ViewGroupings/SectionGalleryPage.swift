import SwiftUI

struct SectionGalleryPage: View {
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

extension SectionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewGroupings.section",
        title: "Section",
        folder: "View groupings",
        framework: .swiftUI,
        absorbedSymbols: [
            "Section",
            "SectionCollection",
            "SectionConfiguration",
            "ForEachSectionCollection"
        ],
        blurb: "A container view that adds hierarchy within Lists, Pickers, and Forms. Supports headers, footers, and collapsible content via an isExpanded binding.",
        signature: "struct Section<Parent, Content, Footer>",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-groupings/section.md",
        page: { AnyView(SectionGalleryPage()) }
    )
}

#Preview {
    SectionGalleryPage()
        .frame(width: 900, height: 700)
}
