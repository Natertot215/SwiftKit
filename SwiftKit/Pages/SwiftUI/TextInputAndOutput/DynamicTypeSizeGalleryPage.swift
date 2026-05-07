import SwiftUI

struct DynamicTypeSizeGalleryPage: View {
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

extension DynamicTypeSizeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.dynamicTypeSize",
        title: "DynamicTypeSize",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.dynamictypesize",
            "swiftui.text-input-and-output.dynamictypesize(_:)",
            "swiftui.text-input-and-output.scaledmetric",
            "swiftui.text-input-and-output.contentsizecategory"
        ],
        blurb: "Dynamic Type sizing — the DynamicTypeSize enum, the dynamicTypeSize(_:) modifier, the ScaledMetric property wrapper, and the legacy ContentSizeCategory enum it replaced.",
        signature: "enum DynamicTypeSize · func dynamicTypeSize(_:) · @propertyWrapper struct ScaledMetric<Value>",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/dynamictypesize.md",
        page: { AnyView(DynamicTypeSizeGalleryPage()) }
    )
}

#Preview {
    DynamicTypeSizeGalleryPage()
        .frame(width: 900, height: 700)
}
