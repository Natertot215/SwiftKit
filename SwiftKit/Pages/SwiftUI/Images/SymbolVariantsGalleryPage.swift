import SwiftUI

struct SymbolVariantsGalleryPage: View {
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

extension SymbolVariantsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.images.symbolVariants",
        title: "SymbolVariants",
        folder: "Images",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.images.symbolvariants",
            "swiftui.images.symbolvariant(_:)",
            "SymbolVariants",
            "View/symbolVariant(_:)"
        ],
        blurb: "A variant of an SF Symbol — fill, circle, square, slash, rectangle. Apply the symbolVariant(_:) modifier to set a variant on a view's environment so descendant Image and Label views render the chosen form.",
        signature: "struct SymbolVariants",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/images/symbolvariants.md",
        page: { AnyView(SymbolVariantsGalleryPage()) }
    )
}

#Preview {
    SymbolVariantsGalleryPage()
        .frame(width: 900, height: 700)
}
