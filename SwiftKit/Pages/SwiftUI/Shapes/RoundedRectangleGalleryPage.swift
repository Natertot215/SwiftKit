import SwiftUI

struct RoundedRectangleGalleryPage: View {
    @State private var cornerRadius: CGFloat = 16

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Default", api: "RoundedRectangle(cornerRadius: 16).fill(.tint)") {
                RoundedRectangle(cornerRadius: 16).fill(.tint).frame(width: 130, height: 70)
            }

            VariantTile(name: "r=0", api: "cornerRadius: 0") {
                RoundedRectangle(cornerRadius: 0).fill(.tint).frame(width: 56, height: 56)
            }

            VariantTile(name: "r=8", api: "cornerRadius: 8") {
                RoundedRectangle(cornerRadius: 8).fill(.tint).frame(width: 56, height: 56)
            }

            VariantTile(name: "r=16", api: "cornerRadius: 16") {
                RoundedRectangle(cornerRadius: 16).fill(.tint).frame(width: 56, height: 56)
            }

            VariantTile(name: "r=32", api: "cornerRadius: 32") {
                RoundedRectangle(cornerRadius: 32).fill(.tint).frame(width: 56, height: 56)
            }

            VariantTile(name: "r=60", api: "cornerRadius: 60") {
                RoundedRectangle(cornerRadius: 60).fill(.tint).frame(width: 56, height: 56)
            }

            VariantTile(name: "style: .circular", api: "cornerRadius: 20, style: .circular") {
                RoundedRectangle(cornerRadius: 20, style: .circular).fill(.tint).frame(width: 64, height: 64)
            }

            VariantTile(name: "style: .continuous", api: "cornerRadius: 20, style: .continuous") {
                RoundedRectangle(cornerRadius: 20, style: .continuous).fill(.tint).frame(width: 64, height: 64)
            }

            VariantTile(name: "strokeBorder", api: ".strokeBorder(.tint, lineWidth: 3)") {
                RoundedRectangle(cornerRadius: 12).strokeBorder(.tint, lineWidth: 3).frame(width: 100, height: 56)
            }

            VariantTile(name: "fill + strokeBorder overlay", api: ".fill(...).overlay { .strokeBorder(...) }") {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.tint.opacity(0.2))
                    .overlay {
                        RoundedRectangle(cornerRadius: 12).strokeBorder(.tint, lineWidth: 2)
                    }
                    .frame(width: 100, height: 56)
            }

            VariantTile(name: "LinearGradient fill", api: ".fill(LinearGradient(...))", height: 140) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient(
                        colors: [.blue, .purple, .pink],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .frame(width: 200, height: 90)
            }

            VariantTile(
                name: "Interactive radius",
                api: "Slider 0…60 → cornerRadius",
                height: 240
            ) {
                VStack(alignment: .leading, spacing: 12) {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(.tint)
                        .frame(maxWidth: .infinity)
                        .frame(height: 90)
                        .animation(.spring, value: cornerRadius)
                    HStack(spacing: 8) {
                        Text("0").font(.caption2).foregroundStyle(.secondary)
                        Slider(value: $cornerRadius, in: 0...60)
                        Text("60").font(.caption2).foregroundStyle(.secondary)
                    }
                    Text("cornerRadius = \(Int(cornerRadius))")
                        .font(.caption2)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(name: "Corners: .leading", api: "topLeading + bottomLeading rounded") {
                UnevenRoundedRectangle(
                    cornerRadii: .init(topLeading: 20, bottomLeading: 20, bottomTrailing: 0, topTrailing: 0)
                )
                .fill(.tint)
                .frame(width: 90, height: 56)
            }

            VariantTile(name: "Corners: .top", api: "topLeading + topTrailing rounded") {
                UnevenRoundedRectangle(
                    cornerRadii: .init(topLeading: 20, bottomLeading: 0, bottomTrailing: 0, topTrailing: 20)
                )
                .fill(.tint)
                .frame(width: 90, height: 56)
            }

            ReferenceTile(
                name: "RoundedCornerStyle",
                signature: "enum RoundedCornerStyle  // .circular, .continuous",
                note: "Default is .continuous (smoother Apple-style curvature)."
            )

            ReferenceTile(
                name: "RoundedRectangularShape",
                signature: "protocol RoundedRectangularShape : Shape",
                note: "RoundedRectangle conforms in macOS 26+. Enables corner-selective rounding via RoundedRectangularShapeCorners.",
                badge: "macOS 26+"
            )

            ReferenceTile(
                name: "RoundedRectangularShapeCorners",
                signature: "struct RoundedRectangularShapeCorners : OptionSet",
                note: ".topLeading, .topTrailing, .bottomLeading, .bottomTrailing, .top, .bottom, .leading, .trailing, .all",
                badge: "macOS 26+"
            )
        }
    }
}

extension RoundedRectangleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.shapes.roundedRectangle",
        title: "RoundedRectangle",
        folder: "Shapes & Drawing",
        framework: .swiftUI,
        absorbedSymbols: ["RoundedRectangle", "RoundedCornerStyle", "RoundedRectangularShape", "RoundedRectangularShapeCorners"],
        blurb: "A rounded rectangle with uniform corner radius. Use .continuous (default) for Apple-style squircles; .circular for sharper curvature.",
        signature: "struct RoundedRectangle : Shape, InsettableShape",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/shapes/roundedrectangle.md",
        page: { AnyView(RoundedRectangleGalleryPage()) }
    )
}

#Preview {
    RoundedRectangleGalleryPage()
        .frame(width: 900, height: 700)
}
