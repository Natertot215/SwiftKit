import SwiftUI

struct IDGalleryPage: View {
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

extension IDGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewFundamentals.id",
        title: "ID",
        folder: "View fundamentals",
        framework: .swiftUI,
        absorbedSymbols: ["View/id(_:)"],
        blurb: "Binds a view's identity to the given proxy value. When the proxy changes, the view's identity — and its state — is reset.",
        signature: "nonisolated func id<ID>(_ id: ID) -> some View where ID : Hashable",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-fundamentals/id(_:).md",
        page: { AnyView(IDGalleryPage()) }
    )
}

#Preview {
    IDGalleryPage()
        .frame(width: 900, height: 700)
}
