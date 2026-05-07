import SwiftUI

struct AddRichGraphicsGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Material + content

            VariantTile(
                name: "Material on a colored backdrop",
                api: ".background(.regularMaterial, in: RoundedRectangle(...))"
            ) {
                ZStack {
                    LinearGradient(
                        colors: [.blue, .purple, .pink],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(width: 160, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

                    Text("Aa")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 8)
                        .background(.regularMaterial, in: Capsule())
                }
            }

            // MARK: Gradient + ShapeStyle

            VariantTile(
                name: "AnyGradient via Color.gradient",
                api: ".fill(Color.accentColor.gradient)"
            ) {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color.accentColor.gradient)
                    .frame(width: 160, height: 90)
            }

            // MARK: Shadow stack

            VariantTile(
                name: "Layered shadow",
                api: ".shadow(radius: 4) + .shadow(radius: 12)"
            ) {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(.tint)
                    .frame(width: 120, height: 70)
                    .shadow(color: .black.opacity(0.15), radius: 4, y: 2)
                    .shadow(color: Color.accentColor.opacity(0.3), radius: 12, y: 6)
            }

            // MARK: Canvas — composed graphic

            VariantTile(
                name: "Canvas-rendered icon",
                api: "Canvas { context, size in ... }"
            ) {
                Canvas { context, size in
                    let rect = CGRect(x: 8, y: 8, width: size.width - 16, height: size.height - 16)
                    context.fill(
                        Path(roundedRect: rect, cornerRadius: 12),
                        with: .linearGradient(
                            Gradient(colors: [.purple, .pink]),
                            startPoint: rect.origin,
                            endPoint: CGPoint(x: rect.maxX, y: rect.maxY)
                        )
                    )
                    if let star = context.resolveSymbol(id: 0) {
                        context.draw(star, at: CGPoint(x: rect.midX, y: rect.midY))
                    }
                } symbols: {
                    Image(systemName: "sparkles")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(.white)
                        .tag(0)
                }
                .frame(width: 140, height: 80)
            }

            // MARK: Animated polish

            VariantTile(
                name: "Subtle hover polish",
                api: ".phaseAnimator over a Material capsule"
            ) {
                AnimatedPill()
            }

            // MARK: Reference

            ReferenceTile(
                name: "Add Rich Graphics",
                signature: "Sample-code companion",
                note: "Apple's \"Add rich graphics to your SwiftUI app\" article walks through composing materials, shape styles, gradients, shadows, and Canvas drawing into expressive UI. The tiles above mirror the major techniques the article demonstrates."
            )

            ReferenceTile(
                name: "Related pages",
                signature: "Materials  ·  Color  ·  Gradient  ·  ShapeStyle  ·  ShadowStyle  ·  GraphicsContext",
                note: "Each technique has its own dedicated gallery page in this folder. Use this page as the entry-point overview; jump to a specific page for the full variant grid of that primitive."
            )

            ReferenceTile(
                name: "HIG guidance",
                signature: "Documentation/HIG/foundations/materials.md  ·  layout.md  ·  motion.md",
                note: "Rich graphics work best when they reinforce hierarchy and respect HIG accessibility defaults. Avoid layering too many materials, gradients, and shadows on a single surface."
            )
        }
    }
}

private struct AnimatedPill: View {
    @State private var hovered = false

    var body: some View {
        Text("Hover")
            .font(.subheadline)
            .fontWeight(.medium)
            .padding(.horizontal, 18)
            .padding(.vertical, 8)
            .background(.regularMaterial, in: Capsule())
            .scaleEffect(hovered ? 1.05 : 1)
            .shadow(color: .black.opacity(hovered ? 0.18 : 0.06), radius: hovered ? 10 : 4, y: hovered ? 4 : 1)
            .animation(.spring(duration: 0.25), value: hovered)
            .onHover { hovered = $0 }
    }
}

extension AddRichGraphicsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.addRichGraphics",
        title: "Add Rich Graphics",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["AddRichGraphics"],
        blurb: "Sample-code companion to SwiftUI's drawing and graphics APIs — combines materials, vibrancy, custom graphics, and animations.",
        signature: nil,
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/add-rich-graphics-to-your-swiftui-app.md",
        page: { AnyView(AddRichGraphicsGalleryPage()) }
    )
}

#Preview {
    AddRichGraphicsGalleryPage()
        .frame(width: 900, height: 700)
}
