import SwiftUI

struct OffsetGalleryPage: View {
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

extension OffsetGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.offset",
        title: "Offset",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/offset(_:)",
            "View/offset(x:y:)",
            "View/offset(z:)",
            "Making fine adjustments to a view's position",
            "swiftui.layout-adjustments.making-fine-adjustments-to-a-view-s-position",
            "swiftui.layout-adjustments.offset(_:)",
            "swiftui.layout-adjustments.offset(x:y:)",
            "swiftui.layout-adjustments.offset(z:)",
        ],
        blurb: "Shift a view's rendering by a CGSize without changing its allocated layout slot. offset is the modifier-of-choice for animation nudges and visual fine-tuning that shouldn't disturb sibling layout.",
        signature: "func offset(x: CGFloat = 0, y: CGFloat = 0) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/offset(x:y:).md",
        page: { AnyView(OffsetGalleryPage()) }
    )
}

#Preview {
    OffsetGalleryPage()
        .frame(width: 900, height: 700)
}
