import SwiftUI

struct AnyShapeGalleryPage: View {
    @State private var isRound: Bool = true

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Type-erase Circle", api: "AnyShape(Circle()).fill(.tint)") {
                AnyShape(Circle()).fill(.tint).frame(width: 64, height: 64)
            }

            VariantTile(name: "Type-erase Capsule", api: "AnyShape(Capsule()).fill(.tint)") {
                AnyShape(Capsule()).fill(.tint).frame(width: 120, height: 50)
            }

            VariantTile(
                name: "Conditional shape switch",
                api: "isRound ? AnyShape(Circle()) : AnyShape(Rectangle())"
            ) {
                VStack(spacing: 10) {
                    let shape: AnyShape = isRound ? AnyShape(Circle()) : AnyShape(Rectangle())
                    shape
                        .fill(.tint)
                        .frame(width: 64, height: 64)
                        .animation(.spring, value: isRound)
                    Toggle("Round", isOn: $isRound)
                        .toggleStyle(.switch)
                        .controlSize(.small)
                        .labelsHidden()
                }
            }

            VariantTile(name: "ShapeRole.fill", api: "Circle().fill(.tint)") {
                Circle().fill(.tint).frame(width: 56, height: 56)
            }

            VariantTile(name: "ShapeRole.stroke", api: "Circle().stroke(.tint, lineWidth: 3)") {
                Circle().stroke(.tint, lineWidth: 3).frame(width: 56, height: 56)
            }

            VariantTile(name: "ShapeRole.separator", api: "Rectangle().fill(.separator)") {
                Rectangle()
                    .fill(.separator)
                    .frame(height: 1)
                    .frame(maxWidth: 120)
            }

            ReferenceTile(
                name: "ShapeRole",
                signature: "enum ShapeRole  // .fill, .stroke, .separator",
                note: "Used by some Shape-protocol APIs to indicate intent. The role conveys how the shape's path should be styled by the surrounding context."
            )
        }
    }
}

extension AnyShapeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.shapes.anyShape",
        title: "AnyShape",
        folder: "Shapes & Drawing",
        framework: .swiftUI,
        absorbedSymbols: ["AnyShape", "ShapeRole"],
        blurb: "A type-erased shape value. Use to switch between concrete shapes at runtime when the compiler needs a single static type.",
        signature: "struct AnyShape : Shape",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/shapes/anyshape.md",
        page: { AnyView(AnyShapeGalleryPage()) }
    )
}

#Preview {
    AnyShapeGalleryPage()
        .frame(width: 900, height: 700)
}
