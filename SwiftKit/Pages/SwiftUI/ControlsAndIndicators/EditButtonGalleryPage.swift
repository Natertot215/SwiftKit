import SwiftUI

struct EditButtonGalleryPage: View {
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

extension EditButtonGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.editButton",
        title: "EditButton",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["EditButton"],
        blurb: "A button that toggles the edit mode environment value within a container that supports editing, such as List inside a NavigationView.",
        signature: "struct EditButton",
        availability: nil,
        docPath: "Documentation/SwiftUI/controls-and-indicators/editbutton.md",
        page: { AnyView(EditButtonGalleryPage()) }
    )
}

#Preview {
    EditButtonGalleryPage()
        .frame(width: 900, height: 700)
}
