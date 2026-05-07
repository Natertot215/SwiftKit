import SwiftUI

struct EllipseGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Default", api: "Ellipse().fill(.tint).frame(width: 120, height: 70)") {
                Ellipse().fill(.tint).frame(width: 120, height: 60)
            }

            VariantTile(name: "fill", api: "Ellipse().fill(.tint)") {
                Ellipse().fill(.tint).frame(width: 110, height: 56)
            }

            VariantTile(name: "stroke", api: "Ellipse().stroke(.tint, lineWidth: 3)") {
                Ellipse().stroke(.tint, lineWidth: 3).frame(width: 110, height: 56)
            }

            VariantTile(name: "fill + stroke overlay", api: ".fill(.tint.opacity(0.25)).overlay { stroke }") {
                Ellipse()
                    .fill(.tint.opacity(0.25))
                    .overlay { Ellipse().stroke(.tint, lineWidth: 2) }
                    .frame(width: 110, height: 56)
            }
        }
    }
}

extension EllipseGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.shapes.ellipse",
        title: "Ellipse",
        folder: "Shapes & Drawing",
        framework: .swiftUI,
        absorbedSymbols: ["Ellipse"],
        blurb: "An ellipse that stretches to fill its frame. Use distinct width and height to produce a true oval.",
        signature: "struct Ellipse : Shape, InsettableShape",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/shapes/ellipse.md",
        page: { AnyView(EllipseGalleryPage()) }
    )
}

#Preview {
    EllipseGalleryPage()
        .frame(width: 900, height: 700)
}
