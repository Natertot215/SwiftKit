import SwiftUI

struct ViewDimensionsGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: "Trailing-aligned with alignmentGuide",
                api: ".alignmentGuide(.trailing) { $0[.trailing] }"
            ) {
                VStack(alignment: .trailing) {
                    Text("Item")
                        .alignmentGuide(.trailing) { d in d[.trailing] }
                    Text("Longer item")
                        .alignmentGuide(.trailing) { d in d[.trailing] }
                }
                .padding(8)
                .background(.tint.opacity(0.12), in: RoundedRectangle(cornerRadius: 6))
            }

            VariantTile(
                name: "Read .width inside guide",
                api: ".alignmentGuide(.leading) { d in d.width / 2 }"
            ) {
                VStack {
                    Text("Centered via guide")
                        .alignmentGuide(HorizontalAlignment.leading) { d in d.width / 2 }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(8)
                .background(.tint.opacity(0.12), in: RoundedRectangle(cornerRadius: 6))
            }

            ReferenceTile(
                name: "ViewDimensions",
                signature: "struct ViewDimensions  { var width: CGFloat; var height: CGFloat }",
                note: "Passed into the closure of .alignmentGuide(_:computeValue:). Read width/height/horizontal+vertical guide values to compute a custom alignment."
            )

            ReferenceTile(
                name: "Subscript access",
                signature: "subscript(_ alignment: HorizontalAlignment) -> CGFloat  /  subscript(_ alignment: VerticalAlignment) -> CGFloat",
                note: "Read built-in guide positions: .leading, .trailing, .center, .firstTextBaseline, .lastTextBaseline. The closure may return any CGFloat to override the default."
            )

            ReferenceTile(
                name: "ViewDimensions3D",
                signature: "struct ViewDimensions3D  // adds depth axis",
                note: "Spatial counterpart for 3D layouts. Carries an extra axis for visionOS scenes that need front/back guide positions.",
                badge: "visionOS"
            )

            ReferenceTile(
                name: "Inspecting view layout",
                signature: "View/onGeometryChange(for:_:)  /  GeometryReader { geo in … }",
                note: "ViewDimensions is for alignment guides. To read the rendered frame of a view, use GeometryReader or onGeometryChange — these are different layout-introspection mechanisms."
            )
        }
    }
}

extension ViewDimensionsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.viewDimensions",
        title: "ViewDimensions",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "ViewDimensions",
            "ViewDimensions3D",
            "Inspecting view layout",
            "swiftui.layout-adjustments.inspecting-view-layout",
            "swiftui.layout-adjustments.viewdimensions",
            "swiftui.layout-adjustments.viewdimensions3d",
        ],
        blurb: "A view's measured size and alignment-guide values, exposed inside alignmentGuide(_:computeValue:) closures. ViewDimensions3D adds a depth axis for spatial layouts.",
        signature: "struct ViewDimensions",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/viewdimensions.md",
        page: { AnyView(ViewDimensionsGalleryPage()) }
    )
}

#Preview {
    ViewDimensionsGalleryPage()
        .frame(width: 900, height: 700)
}
