import SwiftUI

struct DisclosureGroupStyleGalleryPage: View {
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

extension DisclosureGroupStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewStyles.disclosureGroupStyle",
        title: "DisclosureGroupStyle",
        folder: "View styles",
        framework: .swiftUI,
        absorbedSymbols: [
            "DisclosureGroupStyle",
            "View/disclosureGroupStyle(_:)"
        ],
        blurb: "A type that specifies the appearance and interaction of disclosure groups within a view hierarchy. Apply with View/disclosureGroupStyle(_:); customize via a type conforming to DisclosureGroupStyle.",
        signature: "@MainActor @preconcurrency protocol DisclosureGroupStyle",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/view-styles/disclosuregroupstyle.md",
        page: { AnyView(DisclosureGroupStyleGalleryPage()) }
    )
}

#Preview {
    DisclosureGroupStyleGalleryPage()
        .frame(width: 900, height: 700)
}
