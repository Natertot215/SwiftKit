import SwiftUI

struct CircleGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Default", api: "Circle().fill(.tint)") {
                Circle().fill(.tint).frame(width: 60, height: 60)
            }

            VariantTile(name: "fill", api: "Circle().fill(.tint)") {
                Circle().fill(.tint).frame(width: 60, height: 60)
            }

            VariantTile(name: "stroke", api: "Circle().stroke(.tint, lineWidth: 3)") {
                Circle().stroke(.tint, lineWidth: 3).frame(width: 60, height: 60)
            }

            VariantTile(name: "strokeBorder", api: ".strokeBorder(.tint, lineWidth: 4)") {
                Circle().strokeBorder(.tint, lineWidth: 4).frame(width: 60, height: 60)
            }

            VariantTile(name: "RadialGradient fill", api: ".fill(RadialGradient(...))") {
                Circle()
                    .fill(RadialGradient(
                        colors: [Color.accentColor, Color.accentColor.opacity(0)],
                        center: .center,
                        startRadius: 0,
                        endRadius: 30
                    ))
                    .frame(width: 60, height: 60)
            }

            VariantTile(
                name: "trim → progress ring",
                api: ".trim(from: 0, to: 0.75).stroke(...).rotationEffect(.degrees(-90))"
            ) {
                ZStack {
                    Circle().stroke(.secondary.opacity(0.3), lineWidth: 5).frame(width: 56, height: 56)
                    Circle()
                        .trim(from: 0, to: 0.75)
                        .stroke(.tint, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                        .frame(width: 56, height: 56)
                        .rotationEffect(.degrees(-90))
                }
            }

            VariantTile(name: "Concentric rings", api: "ZStack { Circle().stroke(...) × 5 }") {
                ZStack {
                    ForEach(0..<5) { i in
                        let size = CGFloat(80 - i * 12)
                        Circle()
                            .stroke(.tint.opacity(0.15 + Double(i) * 0.17), lineWidth: 2)
                            .frame(width: size, height: size)
                    }
                    Circle().fill(.tint).frame(width: 14, height: 14)
                }
                .frame(width: 90, height: 90)
            }

            VariantTile(name: "clipShape avatar", api: ".clipShape(Circle())") {
                Image(systemName: "person.fill")
                    .font(.title)
                    .frame(width: 56, height: 56)
                    .background(.secondary.opacity(0.2))
                    .clipShape(Circle())
            }
        }
    }
}

extension CircleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.shapes.circle",
        title: "Circle",
        folder: "Shapes & Drawing",
        framework: .swiftUI,
        absorbedSymbols: ["Circle"],
        blurb: "A circle inscribed in its frame's smallest dimension. Always 1:1 — use Ellipse for non-circular ovals.",
        signature: "struct Circle : Shape, InsettableShape",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/shapes/circle.md",
        page: { AnyView(CircleGalleryPage()) }
    )
}

#Preview {
    CircleGalleryPage()
        .frame(width: 900, height: 700)
}
