import SwiftUI

struct ClippingGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: clipped()

            VariantTile(
                name: "clipped()",
                api: ".clipped()"
            ) {
                clipSubject
                    .frame(width: 120, height: 64)
                    .clipped()
            }

            VariantTile(
                name: "no clip (overflow visible)",
                api: "// no clip applied"
            ) {
                clipSubject
                    .frame(width: 120, height: 64)
            }

            // MARK: clipShape variants

            VariantTile(
                name: "clipShape(Circle())",
                api: ".clipShape(Circle())"
            ) {
                clipSubject
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            }

            VariantTile(
                name: "clipShape(RoundedRectangle)",
                api: ".clipShape(RoundedRectangle(cornerRadius: 16))"
            ) {
                clipSubject
                    .frame(width: 140, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }

            VariantTile(
                name: "clipShape(Capsule())",
                api: ".clipShape(Capsule())"
            ) {
                clipSubject
                    .frame(width: 140, height: 56)
                    .clipShape(Capsule())
            }

            // MARK: mask

            VariantTile(
                name: "mask with text",
                api: ".mask { Text(\"Aa\") }"
            ) {
                clipSubject
                    .frame(width: 140, height: 80)
                    .mask {
                        Text("Aa")
                            .font(.system(size: 64, weight: .heavy))
                    }
            }

            VariantTile(
                name: "mask with gradient",
                api: ".mask { LinearGradient(...) }"
            ) {
                clipSubject
                    .frame(width: 140, height: 80)
                    .mask {
                        LinearGradient(
                            colors: [.black, .clear],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
            }

            // MARK: Reference

            ReferenceTile(
                name: "View.clipped(antialiased:)",
                signature: "func clipped(antialiased: Bool = false) -> some View",
                note: "Clips the view to its bounding rectangle. Cheap — uses the layer's bounds. Pass `antialiased: true` for smoother edges on rotated content."
            )

            ReferenceTile(
                name: "View.clipShape(_:style:)",
                signature: "func clipShape<S: Shape>(_ shape: S, style: FillStyle = FillStyle()) -> some View",
                note: "Clips the view to an arbitrary `Shape`. Pair with semantic shapes (Circle, RoundedRectangle, Capsule) or custom Path conformers."
            )

            ReferenceTile(
                name: "View.mask(alignment:_:)",
                signature: "func mask<Mask: View>(alignment: Alignment = .center, @ViewBuilder _ mask: () -> Mask) -> some View",
                note: "Uses another view as an alpha mask. Opaque pixels in the mask reveal the receiver; clear pixels hide it. Supports gradients, text, and symbols for soft edges and shaped reveals."
            )
        }
    }

    private var clipSubject: some View {
        LinearGradient(
            colors: [.blue, .purple, .pink],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

extension ClippingGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.clipping",
        title: "Clipping",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/clipped(antialiased:)",
            "View/clipShape(_:style:)",
            "View/mask(alignment:_:)"
        ],
        blurb: "Restricts a view's drawing to a region — clip to its bounding rectangle, clip to an arbitrary Shape, or use another view as an alpha mask.",
        signature: nil,
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/clipshape(_:style:).md",
        page: { AnyView(ClippingGalleryPage()) }
    )
}

#Preview {
    ClippingGalleryPage()
        .frame(width: 900, height: 700)
}
