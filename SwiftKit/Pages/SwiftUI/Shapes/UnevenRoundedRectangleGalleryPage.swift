import SwiftUI

struct UnevenRoundedRectangleGalleryPage: View {
    @State private var topLeading: CGFloat = 24
    @State private var topTrailing: CGFloat = 8
    @State private var bottomLeading: CGFloat = 8
    @State private var bottomTrailing: CGFloat = 24

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Default", api: "cornerRadii: .init(topLeading: 24, ...)") {
                UnevenRoundedRectangle(
                    cornerRadii: .init(topLeading: 24, bottomLeading: 4, bottomTrailing: 24, topTrailing: 4)
                )
                .fill(.tint)
                .frame(width: 130, height: 70)
            }

            VariantTile(name: "speech bubble TL", api: "topLeading: 20, bottomLeading: 20, bottomTrailing: 20, topTrailing: 4") {
                UnevenRoundedRectangle(
                    cornerRadii: .init(topLeading: 20, bottomLeading: 20, bottomTrailing: 20, topTrailing: 4)
                )
                .fill(.tint)
                .frame(width: 100, height: 64)
            }

            VariantTile(name: "asymmetric", api: "topLeading: 32, bottomTrailing: 32") {
                UnevenRoundedRectangle(
                    cornerRadii: .init(topLeading: 32, bottomLeading: 4, bottomTrailing: 32, topTrailing: 4)
                )
                .fill(.tint)
                .frame(width: 100, height: 64)
            }

            VariantTile(name: "bottom-only rounded", api: "bottomLeading: 20, bottomTrailing: 20") {
                UnevenRoundedRectangle(
                    cornerRadii: .init(topLeading: 0, bottomLeading: 20, bottomTrailing: 20, topTrailing: 0)
                )
                .fill(.tint)
                .frame(width: 100, height: 64)
            }

            VariantTile(name: "diagonal", api: "topLeading + topTrailing: 32") {
                UnevenRoundedRectangle(
                    cornerRadii: .init(topLeading: 32, bottomLeading: 4, bottomTrailing: 4, topTrailing: 32)
                )
                .fill(.tint)
                .frame(width: 100, height: 64)
            }

            VariantTile(name: "strokeBorder", api: ".strokeBorder(.tint, lineWidth: 3)") {
                UnevenRoundedRectangle(
                    cornerRadii: .init(topLeading: 24, bottomLeading: 4, bottomTrailing: 24, topTrailing: 4)
                )
                .strokeBorder(.tint, lineWidth: 3)
                .frame(width: 130, height: 70)
            }

            VariantTile(
                name: "ConcentricRectangle pattern",
                api: "ZStack { 3 nested UnevenRoundedRectangles }",
                height: 160
            ) {
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 8, bottomTrailing: 24, topTrailing: 8))
                        .fill(.tint.opacity(0.15))
                        .frame(width: 160, height: 100)
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 18, bottomLeading: 4, bottomTrailing: 18, topTrailing: 4))
                        .fill(.tint.opacity(0.4))
                        .frame(width: 132, height: 76)
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 12, bottomLeading: 2, bottomTrailing: 12, topTrailing: 2))
                        .fill(.tint)
                        .frame(width: 104, height: 56)
                }
            }

            VariantTile(
                name: "Per-corner interactive",
                api: "4 sliders → cornerRadii.init(...)",
                height: 320
            ) {
                VStack(alignment: .leading, spacing: 10) {
                    UnevenRoundedRectangle(
                        cornerRadii: .init(
                            topLeading: topLeading,
                            bottomLeading: bottomLeading,
                            bottomTrailing: bottomTrailing,
                            topTrailing: topTrailing
                        ),
                        style: .continuous
                    )
                    .fill(.tint)
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .animation(.spring, value: topLeading)
                    .animation(.spring, value: topTrailing)
                    .animation(.spring, value: bottomLeading)
                    .animation(.spring, value: bottomTrailing)

                    cornerSlider("TL", value: $topLeading)
                    cornerSlider("TR", value: $topTrailing)
                    cornerSlider("BL", value: $bottomLeading)
                    cornerSlider("BR", value: $bottomTrailing)
                }
            }

            ReferenceTile(
                name: "RectangleCornerRadii",
                signature: "struct RectangleCornerRadii  // init(topLeading:bottomLeading:bottomTrailing:topTrailing:)",
                note: "The parameter type passed to UnevenRoundedRectangle. Each corner radius is animatable independently."
            )

            ReferenceTile(
                name: "RectangleCornerInsets",
                signature: "struct RectangleCornerInsets",
                note: "Corner-aware inset descriptor.",
                badge: "macOS 26+"
            )

            ReferenceTile(
                name: "ConcentricRectangle",
                signature: "struct ConcentricRectangle : Shape",
                note: "Preserves corner-curve relationship under concentric inset.",
                badge: "macOS 26+"
            )
        }
    }

    @ViewBuilder
    private func cornerSlider(_ label: String, value: Binding<CGFloat>) -> some View {
        HStack(spacing: 8) {
            Text(label)
                .font(.caption2)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .frame(width: 24, alignment: .leading)
            Slider(value: value, in: 0...32)
            Text("\(Int(value.wrappedValue))")
                .font(.caption2)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .frame(width: 22, alignment: .trailing)
        }
    }
}

extension UnevenRoundedRectangleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.shapes.unevenRoundedRectangle",
        title: "UnevenRoundedRectangle",
        folder: "Shapes & Drawing",
        framework: .swiftUI,
        absorbedSymbols: ["UnevenRoundedRectangle", "RectangleCornerRadii", "RectangleCornerInsets", "ConcentricRectangle"],
        blurb: "A rounded rectangle with independently-controlled corner radii. Use RectangleCornerRadii to specify each corner; ConcentricRectangle (macOS 26+) gives concentric inset behavior.",
        signature: "struct UnevenRoundedRectangle : Shape, InsettableShape",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/shapes/unevenroundedrectangle.md",
        page: { AnyView(UnevenRoundedRectangleGalleryPage()) }
    )
}

#Preview {
    UnevenRoundedRectangleGalleryPage()
        .frame(width: 900, height: 700)
}
