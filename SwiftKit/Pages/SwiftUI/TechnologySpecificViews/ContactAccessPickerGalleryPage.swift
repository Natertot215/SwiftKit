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
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
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
