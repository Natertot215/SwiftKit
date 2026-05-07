import SwiftUI

struct DisclosureGroupGalleryPage: View {
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

extension DisclosureGroupGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.lists.disclosureGroup",
        title: "DisclosureGroup",
        folder: "Lists",
        framework: .swiftUI,
        absorbedSymbols: [
            "DisclosureGroup"
        ],
        blurb: "A view that shows or hides another content view, based on the state of a disclosure control. Pair with OutlineGroup for hierarchical lists.",
        signature: "struct DisclosureGroup<Label, Content> where Label : View, Content : View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/lists/disclosuregroup.md",
        page: { AnyView(DisclosureGroupGalleryPage()) }
    )
}

#Preview {
    DisclosureGroupGalleryPage()
        .frame(width: 900, height: 700)
}
