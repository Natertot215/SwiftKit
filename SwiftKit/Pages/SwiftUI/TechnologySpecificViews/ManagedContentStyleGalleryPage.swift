import SwiftUI

struct ManagedContentStyleGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "managedContentStyle(_:)",
                signature: "func managedContentStyle(_ style: some ManagedContentStyle) -> some View",
                note: "Configures the visual style applied to managed-content surfaces (e.g. items rendered inside a managed-content list under DeviceManagement / FamilyControls).",
                badge: "macOS 26.4+"
            )

            ReferenceTile(
                name: "Required import",
                signature: "import DeviceManagement  //  or FamilyControls / ManagedSettings",
                note: "Lives alongside the managed-content APIs. Style options are framework-supplied conformers — there is no public custom-style protocol expected from app code."
            )

            ReferenceTile(
                name: "Use case",
                signature: "MDM / parental-control admin surfaces",
                note: "Pairs with the managed-content list views Apple introduced for IT admins and parental-controls UIs. Restricted distribution — most apps will never need it."
            )
        }
    }
}

extension ManagedContentStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.managedContentStyle",
        title: "ManagedContentStyle",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/managedContentStyle(_:)"
        ],
        blurb: "Style modifier for managed-content surfaces in DeviceManagement and FamilyControls.",
        signature: nil,
        availability: "macOS 26.4+",
        docPath: "Documentation/SwiftUI/technology-specific-views/managedcontentstyle(_:).md",
        page: { AnyView(ManagedContentStyleGalleryPage()) }
    )
}

#Preview {
    ManagedContentStyleGalleryPage()
        .frame(width: 900, height: 700)
}
