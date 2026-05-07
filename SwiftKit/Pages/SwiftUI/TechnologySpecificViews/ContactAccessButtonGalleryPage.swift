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
            ReferenceTile(
                name: "ContactAccessButton",
                signature: "struct ContactAccessButton : View",
                note: "Limited-access alternative to full Contacts authorization. Renders the system-styled contact pill for a given query string and grants one-shot read access to that single contact when tapped.",
                badge: "iOS only"
            )

            ReferenceTile(
                name: "init(queryString:completionHandler:)",
                signature: "init(queryString: String, completionHandler: @escaping (Set<String>) -> Void)",
                note: "queryString is what the user typed (e.g. \"Sam\"). completionHandler receives the contact identifiers the user actually granted access to."
            )

            ReferenceTile(
                name: "contactAccessButtonCaption(_:)",
                signature: "func contactAccessButtonCaption(_ caption: ContactAccessButton.Caption) -> some View",
                note: "Captions: .defaultText, .email, .phone, .generic. Controls the secondary line under the contact name."
            )

            ReferenceTile(
                name: "contactAccessButtonStyle(_:)",
                signature: "func contactAccessButtonStyle(_ style: ContactAccessButton.Style) -> some View",
                note: "Configures size/typography presentation. Like other Apple-supplied controls, the style API is intentionally narrow — you cannot recolor or restyle the pill."
            )

            ReferenceTile(
                name: "Required import",
                signature: "import ContactsUI",
                note: "ContactsUI must be linked. No Contacts privacy entitlement needed — that is the whole point of the Limited Access flow."
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
