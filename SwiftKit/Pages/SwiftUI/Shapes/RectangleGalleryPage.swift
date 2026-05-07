import SwiftUI

struct RectangleGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Default", api: "Rectangle().fill(.tint)") {
                Rectangle().fill(.tint).frame(width: 130, height: 70)
            }

            VariantTile(name: "fill .tint", api: ".fill(.tint)") {
                Rectangle().fill(.tint).frame(width: 80, height: 50)
            }

            VariantTile(name: "fill .secondary", api: ".fill(.secondary)") {
                Rectangle().fill(.secondary).frame(width: 80, height: 50)
            }

            VariantTile(name: "LinearGradient fill", api: ".fill(LinearGradient(...))") {
                Rectangle()
                    .fill(LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .frame(width: 100, height: 50)
            }

            VariantTile(name: "stroke lineWidth 2", api: ".stroke(.tint, lineWidth: 2)") {
                Rectangle().stroke(.tint, lineWidth: 2).frame(width: 80, height: 50)
            }

            VariantTile(name: "stroke lineWidth 6", api: ".stroke(.tint, lineWidth: 6)") {
                Rectangle().stroke(.tint, lineWidth: 6).frame(width: 80, height: 50)
            }

            VariantTile(name: "StrokeStyle dashed", api: "StrokeStyle(lineWidth: 3, dash: [8, 4])") {
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: 3, dash: [8, 4]))
                    .frame(width: 90, height: 50)
                    .foregroundStyle(.tint)
            }

            VariantTile(name: "trim 0–0.5", api: ".trim(from: 0, to: 0.5).stroke(...)") {
                Rectangle().trim(from: 0, to: 0.5).stroke(.tint, lineWidth: 3).frame(width: 90, height: 50)
            }

            VariantTile(name: "trim 0.25–0.75", api: ".trim(from: 0.25, to: 0.75)") {
                Rectangle().trim(from: 0.25, to: 0.75).stroke(.tint, lineWidth: 3).frame(width: 90, height: 50)
            }

            VariantTile(name: "fill + stroke overlay", api: ".fill(...).overlay { .stroke(...) }") {
                Rectangle()
                    .fill(.tint.opacity(0.3))
                    .overlay { Rectangle().stroke(.tint, lineWidth: 2) }
                    .frame(width: 90, height: 50)
            }

            VariantTile(name: "scaleEffect", api: ".scaleEffect(0.6)") {
                Rectangle().fill(.tint).frame(width: 90, height: 50).scaleEffect(0.6)
            }

            VariantTile(name: "rotationEffect", api: ".rotationEffect(.degrees(15))") {
                Rectangle().fill(.tint).frame(width: 80, height: 50).rotationEffect(.degrees(15))
            }

            VariantTile(name: "clipShape image", api: ".clipShape(Rectangle())") {
                Image(systemName: "photo")
                    .font(.title)
                    .frame(width: 100, height: 56)
                    .background(.secondary.opacity(0.3))
                    .clipShape(Rectangle())
            }
        }
    }
}

extension RectangleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.shapes.rectangle",
        title: "Rectangle",
        folder: "Shapes & Drawing",
        framework: .swiftUI,
        absorbedSymbols: ["Rectangle"],
        blurb: "A rectangle that fills the available frame. Pair with .frame(...) or place inside a sized container.",
        signature: "struct Rectangle : Shape, InsettableShape",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/shapes/rectangle.md",
        page: { AnyView(RectangleGalleryPage()) }
    )
}

#Preview {
    RectangleGalleryPage()
        .frame(width: 900, height: 700)
}
