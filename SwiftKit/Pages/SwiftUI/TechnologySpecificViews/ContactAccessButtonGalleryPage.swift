import SwiftUI

struct ContactAccessButtonGalleryPage: View {
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

extension ContactAccessButtonGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.contactAccessButton",
        title: "ContactAccessButton",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "ContactAccessButton",
            "View/contactAccessButtonCaption(_:)",
            "View/contactAccessButtonStyle(_:)"
        ],
        blurb: "ContactsUI ContactAccessButton that grants limited contact access for a single search query. Companion modifiers configure caption visibility and button style.",
        signature: "struct ContactAccessButton : View",
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/contactaccessbuttonstyle(_:).md",
        page: { AnyView(ContactAccessButtonGalleryPage()) }
    )
}

#Preview {
    ContactAccessButtonGalleryPage()
        .frame(width: 900, height: 700)
}
