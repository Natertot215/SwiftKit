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
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
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
