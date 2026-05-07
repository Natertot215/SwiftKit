import SwiftUI

struct ContactAccessPickerGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "contactAccessPicker(isPresented:completionHandler:)",
                signature: "func contactAccessPicker(isPresented: Binding<Bool>, completionHandler: @escaping (Set<String>) -> Void) -> some View",
                note: "Presents the system Limited Contacts Access picker. Users select which contacts to grant access to without giving the app the full Contacts authorization. completionHandler returns the granted contact identifiers."
            )

            ReferenceTile(
                name: "Required import",
                signature: "import ContactsUI",
                note: "ContactsUI brings in the picker. No NSContactsUsageDescription is required for limited-access mode, since the user explicitly chooses each contact."
            )

            ReferenceTile(
                name: "Pairs with ContactAccessButton",
                signature: "ContactAccessButton + .contactAccessPicker",
                note: "Use ContactAccessButton for inline single-contact grants, the picker modifier for multi-contact bulk grants. Both feed your app contact identifiers — read details via CNContactStore using those IDs."
            )

            ReferenceTile(
                name: "Use case",
                signature: "Limited Contacts Access flow",
                note: "Privacy-friendlier than CNContactStore.requestAccess(for:). Recommended whenever you only need a small subset of contacts (invites, sharing, lookup)."
            )
        }
    }
}

extension ContactAccessPickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.contactAccessPicker",
        title: "ContactAccessPicker",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/contactAccessPicker(isPresented:completionHandler:)"
        ],
        blurb: "ContactsUI modifier that presents a contact access picker so users can grant the app limited access to selected contacts.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/contactaccesspicker(ispresented:completionhandler:).md",
        page: { AnyView(ContactAccessPickerGalleryPage()) }
    )
}

#Preview {
    ContactAccessPickerGalleryPage()
        .frame(width: 900, height: 700)
}
