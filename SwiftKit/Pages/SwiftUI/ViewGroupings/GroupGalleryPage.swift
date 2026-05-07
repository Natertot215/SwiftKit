import SwiftUI

struct GroupGalleryPage: View {
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

extension GroupGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewGroupings.group",
        title: "Group",
        folder: "View groupings",
        framework: .swiftUI,
        absorbedSymbols: [
            "Group",
            "GroupElementsOfContent",
            "GroupSectionsOfContent",
            "swiftui.view-groupings.creating-custom-container-views"
        ],
        blurb: "Collects multiple instances of a content type — views, scenes, commands, or subviews — into a single unit without affecting their layout. Modifiers applied to a Group apply to every member.",
        signature: "@frozen struct Group<Content>",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-groupings/group.md",
        page: { AnyView(GroupGalleryPage()) }
    )
}

#Preview {
    GroupGalleryPage()
        .frame(width: 900, height: 700)
}
