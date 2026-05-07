import SwiftUI

struct EquatableViewGalleryPage: View {
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

extension EquatableViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewFundamentals.equatableView",
        title: "EquatableView",
        folder: "View fundamentals",
        framework: .swiftUI,
        absorbedSymbols: ["View/equatable()"],
        blurb: "A view that compares itself against its previous value and prevents its child from updating when the new value equals the old. Apply with the equatable() modifier on any Equatable-conforming view.",
        signature: "@frozen struct EquatableView<Content> where Content : Equatable, Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-fundamentals/equatableview.md",
        page: { AnyView(EquatableViewGalleryPage()) }
    )
}

#Preview {
    EquatableViewGalleryPage()
        .frame(width: 900, height: 700)
}
