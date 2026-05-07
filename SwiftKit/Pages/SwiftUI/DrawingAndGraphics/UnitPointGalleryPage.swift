import SwiftUI

struct UnitPointGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Predefined points — visualized as a marker on a square canvas

            unitPointTile(name: ".topLeading",     api: "UnitPoint.topLeading",     point: .topLeading)
            unitPointTile(name: ".top",            api: "UnitPoint.top",            point: .top)
            unitPointTile(name: ".topTrailing",    api: "UnitPoint.topTrailing",    point: .topTrailing)
            unitPointTile(name: ".leading",        api: "UnitPoint.leading",        point: .leading)
            unitPointTile(name: ".center",         api: "UnitPoint.center",         point: .center)
            unitPointTile(name: ".trailing",       api: "UnitPoint.trailing",       point: .trailing)
            unitPointTile(name: ".bottomLeading",  api: "UnitPoint.bottomLeading",  point: .bottomLeading)
            unitPointTile(name: ".bottom",         api: "UnitPoint.bottom",         point: .bottom)
            unitPointTile(name: ".bottomTrailing", api: "UnitPoint.bottomTrailing", point: .bottomTrailing)

            // MARK: Custom point

            VariantTile(
                name: "UnitPoint(x: 0.25, y: 0.75)",
                api: "UnitPoint(x: 0.25, y: 0.75)"
            ) {
                UnitPointMarker(point: UnitPoint(x: 0.25, y: 0.75))
            }

            // MARK: Applied — gradient anchor

            VariantTile(
                name: "gradient with .topLeading start",
                api: "LinearGradient(... startPoint: .topLeading, endPoint: .bottomTrailing)"
            ) {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(LinearGradient(
                        colors: [Color.accentColor, .pink],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .frame(width: 120, height: 80)
            }

            // MARK: Reference

            ReferenceTile(
                name: "UnitPoint",
                signature: "@frozen struct UnitPoint  ·  init(x: CGFloat, y: CGFloat)",
                note: "A normalized 2D point in a view's coordinate space. (0, 0) is the top-leading corner; (1, 1) is the bottom-trailing corner. Used by gradients, transforms, and anchors to describe locations independent of size."
            )

            ReferenceTile(
                name: "UnitPoint3D",
                signature: "@frozen struct UnitPoint3D  ·  init(x: CGFloat, y: CGFloat, z: CGFloat)",
                note: "Three-dimensional sibling of UnitPoint used by depth-aware layout and 3D rotation APIs.",
                badge: "macOS 14+"
            )

            ReferenceTile(
                name: "Predefined values",
                signature: ".zero  ·  .center  ·  .leading / .trailing  ·  .top / .bottom  ·  .topLeading … .bottomTrailing",
                note: "Cardinal and diagonal anchor points cover the most common needs; construct UnitPoint(x:y:) directly for off-grid positions."
            )

            ReferenceTile(
                name: "Animatable",
                signature: "extension UnitPoint : Animatable, Hashable, Sendable",
                note: "UnitPoint conforms to Animatable — SwiftUI interpolates between gradient anchors and transform pivots smoothly."
            )
        }
    }

    private func unitPointTile(name: String, api: String, point: UnitPoint) -> some View {
        VariantTile(name: name, api: api) {
            UnitPointMarker(point: point)
        }
    }
}

/// Square canvas with a marker placed at the supplied UnitPoint.
private struct UnitPointMarker: View {
    let point: UnitPoint
    private let canvas: CGFloat = 80

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .fill(Color.secondary.opacity(0.15))
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .strokeBorder(.separator.opacity(0.6), lineWidth: 0.5)

            Circle()
                .fill(.tint)
                .frame(width: 12, height: 12)
                .position(
                    x: point.x * canvas,
                    y: point.y * canvas
                )
        }
        .frame(width: canvas, height: canvas)
    }
}

extension UnitPointGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.unitPoint",
        title: "UnitPoint",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["UnitPoint", "UnitPoint3D"],
        blurb: "A normalized 2D point in a view's coordinate space — and its 3D sibling — letting you describe locations as fractions of a view's size without knowing its rendered dimensions.",
        signature: "@frozen struct UnitPoint",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/unitpoint.md",
        page: { AnyView(UnitPointGalleryPage()) }
    )
}

#Preview {
    UnitPointGalleryPage()
        .frame(width: 900, height: 700)
}
