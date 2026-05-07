import SwiftUI

struct EditableListGalleryPage: View {
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

extension EditableListGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.lists.editableList",
        title: "EditableList",
        folder: "Lists",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/moveDisabled(_:)",
            "View/deleteDisabled(_:)",
            "EditMode",
            "EditActions",
            "EditableCollectionContent",
            "IndexedIdentifierCollection"
        ],
        blurb: "The editing surface of a List — moveDisabled and deleteDisabled gate per-row edit affordances; EditMode tracks the editing state; EditActions configures the available operations; EditableCollectionContent and IndexedIdentifierCollection back the data model.",
        signature: "func deleteDisabled(_ isDisabled: Bool) -> some View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/lists/editactions.md",
        page: { AnyView(EditableListGalleryPage()) }
    )
}

#Preview {
    EditableListGalleryPage()
        .frame(width: 900, height: 700)
}
