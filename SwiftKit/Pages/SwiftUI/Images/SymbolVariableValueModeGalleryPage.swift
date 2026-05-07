import SwiftUI

struct SymbolVariableValueModeGalleryPage: View {
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

extension SymbolVariableValueModeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.images.symbolVariableValueMode",
        title: "SymbolVariableValueMode",
        folder: "Images",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.images.symbolvariablevaluemode",
            "SymbolVariableValueMode"
        ],
        blurb: "A method of rendering the variable value of an SF Symbol image. Pairs with Image's symbolVariableValueMode(_:) instance method to control how variable-value symbols animate between value states.",
        signature: "struct SymbolVariableValueMode",
        availability: "macOS 26.0+",
        docPath: "Documentation/SwiftUI/images/symbolvariablevaluemode.md",
        page: { AnyView(SymbolVariableValueModeGalleryPage()) }
    )
}

#Preview {
    SymbolVariableValueModeGalleryPage()
        .frame(width: 900, height: 700)
}
