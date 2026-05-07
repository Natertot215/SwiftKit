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
            ReferenceTile(
                name: "familyActivityPicker(isPresented:selection:)",
                signature: "func familyActivityPicker(isPresented: Binding<Bool>, selection: Binding<FamilyActivitySelection>) -> some View",
                note: "Presents the system picker that lets the user choose apps, web domains, and categories to subject to Screen Time controls. The selection is opaque tokens — your app never receives identifiable bundle IDs."
            )

            ReferenceTile(
                name: "familyActivityPicker(headerText:footerText:isPresented:selection:)",
                signature: "func familyActivityPicker(headerText: String?, footerText: String?, isPresented: Binding<Bool>, selection: Binding<FamilyActivitySelection>) -> some View",
                note: "Same picker with optional header/footer copy explaining context to the user."
            )

            ReferenceTile(
                name: "Required import & entitlement",
                signature: "import FamilyControls  //  com.apple.developer.family-controls",
                note: "Family Controls entitlement is gated by Apple — restricted to apps in the parental-controls / education space. AuthorizationCenter.shared.requestAuthorization(for: .individual) must succeed before presenting."
            )

            ReferenceTile(
                name: "FamilyActivitySelection",
                signature: "struct FamilyActivitySelection: Codable, Hashable",
                note: "Holds opaque ApplicationToken / WebDomainToken / ActivityCategoryToken sets. Persist it (e.g. in @AppStorage with Codable) and pass to ManagedSettings or DeviceActivity to enforce restrictions."
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
