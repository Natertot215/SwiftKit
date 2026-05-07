import SwiftUI

struct SelectionDisabledGalleryPage: View {
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

extension SelectionDisabledGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.lists.selectionDisabled",
        title: "SelectionDisabled",
        folder: "Lists",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/selectionDisabled(_:)"
        ],
        blurb: "Adds a condition that controls whether users can select this view. Applies inside lists and other selectable containers like Picker and Table.",
        signature: "func selectionDisabled(_ isDisabled: Bool = true) -> some View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/lists/selectiondisabled(_:).md",
        page: { AnyView(SelectionDisabledGalleryPage()) }
    )
}

#Preview {
    SelectionDisabledGalleryPage()
        .frame(width: 900, height: 700)
}
