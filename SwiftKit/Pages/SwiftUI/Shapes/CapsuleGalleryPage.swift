import SwiftUI

struct CapsuleGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Default", api: "Capsule().fill(.tint).frame(width: 140, height: 55)") {
                Capsule().fill(.tint).frame(width: 130, height: 50)
            }

            VariantTile(name: "fill", api: "Capsule().fill(.tint)") {
                Capsule().fill(.tint).frame(width: 120, height: 44)
            }

            VariantTile(name: "stroke", api: "Capsule().stroke(.tint, lineWidth: 2)") {
                Capsule().stroke(.tint, lineWidth: 2).frame(width: 120, height: 44)
            }

            VariantTile(name: "style: .circular", api: "Capsule(style: .circular).fill(.tint)") {
                Capsule(style: .circular).fill(.tint).frame(width: 120, height: 44)
            }

            VariantTile(name: "clipShape image", api: ".clipShape(Capsule())") {
                Image(systemName: "photo")
                    .font(.title)
                    .frame(width: 110, height: 50)
                    .background(.secondary.opacity(0.2))
                    .clipShape(Capsule())
            }

            ReferenceTile(
                name: "RoundedCornerStyle",
                signature: "enum RoundedCornerStyle  // .continuous (default), .circular",
                note: "Capsule's `style:` parameter takes RoundedCornerStyle. Default is .continuous (smoother Apple-style curvature)."
            )
        }
    }
}

extension CapsuleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.shapes.capsule",
        title: "Capsule",
        folder: "Shapes & Drawing",
        framework: .swiftUI,
        absorbedSymbols: ["Capsule"],
        blurb: "A capsule with end-caps that are perfect semicircles. Cap radius equals half the smaller dimension and cannot be controlled independently.",
        signature: "struct Capsule : Shape, InsettableShape",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/shapes/capsule.md",
        page: { AnyView(CapsuleGalleryPage()) }
    )
}

#Preview {
    CapsuleGalleryPage()
        .frame(width: 900, height: 700)
}
