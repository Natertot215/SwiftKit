import SwiftUI

struct SymbolRenderingModeGalleryPage: View {
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

extension SymbolRenderingModeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.images.symbolRenderingMode",
        title: "SymbolRenderingMode",
        folder: "Images",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.images.symbolrenderingmode",
            "swiftui.images.symbolrenderingmode(_:)",
            "SymbolRenderingMode",
            "View/symbolRenderingMode(_:)"
        ],
        blurb: "A symbol rendering mode — monochrome, hierarchical, palette, or multicolor — applied to SF Symbol images in the view hierarchy via the symbolRenderingMode(_:) modifier.",
        signature: "struct SymbolRenderingMode",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/images/symbolrenderingmode.md",
        page: { AnyView(SymbolRenderingModeGalleryPage()) }
    )
}

#Preview {
    SymbolRenderingModeGalleryPage()
        .frame(width: 900, height: 700)
}
