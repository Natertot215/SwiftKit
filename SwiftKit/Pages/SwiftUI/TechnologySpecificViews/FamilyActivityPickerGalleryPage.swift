import SwiftUI

struct FamilyActivityPickerGalleryPage: View {
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

extension FamilyActivityPickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.familyActivityPicker",
        title: "FamilyActivityPicker",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/familyActivityPicker(isPresented:selection:)",
            "View/familyActivityPicker(headerText:footerText:isPresented:selection:)"
        ],
        blurb: "FamilyControls picker that lets users select apps, web domains, and categories to subject to Screen Time controls.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/familyactivitypicker(ispresented:selection:).md",
        page: { AnyView(FamilyActivityPickerGalleryPage()) }
    )
}

#Preview {
    FamilyActivityPickerGalleryPage()
        .frame(width: 900, height: 700)
}
