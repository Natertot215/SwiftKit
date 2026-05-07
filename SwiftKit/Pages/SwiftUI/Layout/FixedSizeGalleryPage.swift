import SwiftUI

struct FixedSizeGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: "Without fixedSize — text truncates",
                api: "Text(\"This is a long sentence that wraps or truncates.\")"
            ) {
                Text("This is a long sentence that wraps or truncates.")
                    .frame(width: 140)
                    .background(.tint.opacity(0.18), in: RoundedRectangle(cornerRadius: 6))
            }

            VariantTile(
                name: ".fixedSize()",
                api: ".fixedSize()  // both axes"
            ) {
                Text("This is a long sentence that wraps or truncates.")
                    .fixedSize()
                    .frame(width: 140, alignment: .leading)
                    .background(.tint.opacity(0.18), in: RoundedRectangle(cornerRadius: 6))
            }

            VariantTile(
                name: ".fixedSize(horizontal: false, vertical: true)",
                api: ".fixedSize(horizontal: false, vertical: true)"
            ) {
                Text("This is a long sentence that wraps to its ideal vertical size.")
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 140)
                    .background(.tint.opacity(0.18), in: RoundedRectangle(cornerRadius: 6))
            }

            VariantTile(
                name: ".fixedSize(horizontal: true, vertical: false)",
                api: ".fixedSize(horizontal: true, vertical: false)"
            ) {
                Text("Very long single line")
                    .lineLimit(1)
                    .fixedSize(horizontal: true, vertical: false)
                    .frame(width: 80, alignment: .leading)
                    .background(.tint.opacity(0.18), in: RoundedRectangle(cornerRadius: 6))
            }

            ReferenceTile(
                name: "Signatures",
                signature: "func fixedSize() -> some View  /  func fixedSize(horizontal: Bool, vertical: Bool) -> some View",
                note: "Tells the layout system to pass the unbounded size proposal to the receiver in the chosen axes. The view returns its ideal size and ignores the parent's offer."
            )

            ReferenceTile(
                name: "Common use",
                signature: "Multi-line Text inside an HStack",
                note: "Stacks propose .infinity along their axis and 0 across — Text receives 0 height. fixedSize(horizontal: false, vertical: true) lets the Text grow vertically to fit its wrapped content."
            )

            ReferenceTile(
                name: "Caveat",
                signature: ".fixedSize() removes flexibility entirely",
                note: "Don't reach for the parameter-less form on flexible content (Spacer, GeometryReader-driven views) — it can collapse them to zero. Prefer the explicit horizontal/vertical form when only one axis matters."
            )
        }
    }
}

extension FixedSizeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.fixedSize",
        title: "FixedSize",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/fixedSize()",
            "View/fixedSize(horizontal:vertical:)",
            "swiftui.layout-adjustments.fixedsize()",
            "swiftui.layout-adjustments.fixedsize(horizontal:vertical:)",
        ],
        blurb: "Lock a view to its ideal size in one or both axes, ignoring the parent's size proposal. Useful for letting a Text reach its natural multi-line size or preventing a flexible view from shrinking.",
        signature: "func fixedSize(horizontal: Bool, vertical: Bool) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/fixedsize().md",
        page: { AnyView(FixedSizeGalleryPage()) }
    )
}

#Preview {
    FixedSizeGalleryPage()
        .frame(width: 900, height: 700)
}
