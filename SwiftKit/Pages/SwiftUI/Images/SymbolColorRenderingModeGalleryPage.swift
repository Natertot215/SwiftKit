import SwiftUI

struct SymbolColorRenderingModeGalleryPage: View {
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

extension SymbolColorRenderingModeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.images.symbolColorRenderingMode",
        title: "SymbolColorRenderingMode",
        folder: "Images",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.images.symbolcolorrenderingmode",
            "SymbolColorRenderingMode"
        ],
        blurb: "A method of filling a layer in an SF Symbol image. Pairs with Image's symbolColorRenderingMode(_:) instance method to control per-layer color application.",
        signature: "struct SymbolColorRenderingMode",
        availability: "macOS 26.0+",
        docPath: "Documentation/SwiftUI/images/symbolcolorrenderingmode.md",
        page: { AnyView(SymbolColorRenderingModeGalleryPage()) }
    )
}

#Preview {
    SymbolColorRenderingModeGalleryPage()
        .frame(width: 900, height: 700)
}
