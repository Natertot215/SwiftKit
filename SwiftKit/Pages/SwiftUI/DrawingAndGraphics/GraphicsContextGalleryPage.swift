import SwiftUI

struct GraphicsContextGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: fill

            VariantTile(
                name: "context.fill(path:with:)",
                api: "context.fill(Path(...), with: .color(.tint))"
            ) {
                Canvas { context, size in
                    let rect = CGRect(x: 8, y: 8, width: size.width - 16, height: size.height - 16)
                    let path = Path(roundedRect: rect, cornerRadius: 8)
                    context.fill(path, with: .color(Color.accentColor))
                }
                .frame(width: 140, height: 80)
            }

            // MARK: stroke

            VariantTile(
                name: "context.stroke(path:with:lineWidth:)",
                api: "context.stroke(path, with: .color(.tint), lineWidth: 4)"
            ) {
                Canvas { context, size in
                    let rect = CGRect(x: 8, y: 8, width: size.width - 16, height: size.height - 16)
                    let path = Path(ellipseIn: rect)
                    context.stroke(path, with: .color(Color.accentColor), lineWidth: 4)
                }
                .frame(width: 140, height: 80)
            }

            // MARK: draw — Image

            VariantTile(
                name: "context.draw(_:in:)",
                api: "context.draw(resolvedSymbol, in: rect)"
            ) {
                Canvas { context, size in
                    let symbol = context.resolveSymbol(id: 0)
                    if let symbol {
                        let rect = CGRect(
                            x: (size.width - 36) / 2,
                            y: (size.height - 36) / 2,
                            width: 36,
                            height: 36
                        )
                        context.draw(symbol, in: rect)
                    }
                } symbols: {
                    Image(systemName: "star.fill")
                        .font(.system(size: 36))
                        .foregroundStyle(.tint)
                        .tag(0)
                }
                .frame(width: 140, height: 80)
            }

            // MARK: opacity / blendMode via context state

            VariantTile(
                name: "context.opacity",
                api: "context.opacity = 0.4"
            ) {
                Canvas { context, size in
                    let rect = CGRect(x: 8, y: 8, width: size.width - 16, height: size.height - 16)
                    context.opacity = 0.4
                    context.fill(Path(roundedRect: rect, cornerRadius: 8), with: .color(Color.accentColor))
                }
                .frame(width: 140, height: 80)
            }

            // MARK: addFilter — color matrix

            VariantTile(
                name: "addFilter(.colorMatrix(_:))",
                api: "context.addFilter(.colorMatrix(grayscale))"
            ) {
                Canvas { context, size in
                    var matrix = ColorMatrix()
                    matrix.r1 = 0.33; matrix.r2 = 0.33; matrix.r3 = 0.33
                    matrix.g1 = 0.33; matrix.g2 = 0.33; matrix.g3 = 0.33
                    matrix.b1 = 0.33; matrix.b2 = 0.33; matrix.b3 = 0.33
                    context.addFilter(.colorMatrix(matrix))

                    let rect = CGRect(x: 8, y: 8, width: size.width - 16, height: size.height - 16)
                    context.fill(
                        Path(roundedRect: rect, cornerRadius: 8),
                        with: .linearGradient(
                            Gradient(colors: [.red, .blue]),
                            startPoint: .zero,
                            endPoint: CGPoint(x: rect.maxX, y: rect.maxY)
                        )
                    )
                }
                .frame(width: 140, height: 80)
            }

            // MARK: Reference

            ReferenceTile(
                name: "GraphicsContext",
                signature: "@frozen struct GraphicsContext",
                note: "Immediate-mode drawing destination passed into a `Canvas` closure. Mutate the context to draw paths, images, and text, and to apply transforms, opacity, blend modes, and filters."
            )

            ReferenceTile(
                name: "Drawing primitives",
                signature: "fill(_:with:)  ·  stroke(_:with:lineWidth:)  ·  draw(_:in:)  ·  draw(_:at:)",
                note: "Paths fill or stroke with any `GraphicsContext.Shading` value; images and resolved symbols draw via `draw(_:in:)`."
            )

            ReferenceTile(
                name: "State mutators",
                signature: "transform  ·  opacity  ·  blendMode  ·  clip(to:options:style:)  ·  addFilter(_:)",
                note: "Mutating any of these state properties affects all subsequent drawing. Use `drawLayer` to scope changes to a sub-context that doesn't leak back into the parent."
            )

            ReferenceTile(
                name: "ColorMatrix",
                signature: "struct ColorMatrix  ·  r1…a5 components",
                note: "5×4 matrix multiplying RGBA + bias channels. Pair with `addFilter(.colorMatrix(_:))` for grayscale, hue-shift, and channel-swizzle effects."
            )

            ReferenceTile(
                name: "Canvas (entry point)",
                signature: "init(opaque: Bool = false, colorMode: ColorRenderingMode = .nonLinear, rendersAsynchronously: Bool = false, renderer: (inout GraphicsContext, CGSize) -> Void, symbols: () -> Symbols)",
                note: "Canvas hosts a GraphicsContext. The renderer closure runs on every redraw — keep it cheap and side-effect-free."
            )
        }
    }
}

extension GraphicsContextGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.graphicsContext",
        title: "GraphicsContext",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["GraphicsContext", "ColorMatrix"],
        blurb: "An immediate-mode drawing destination — used inside a Canvas closure to fill, stroke, draw, and apply filters like color matrices to 2D content.",
        signature: "@frozen struct GraphicsContext",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/graphicscontext.md",
        page: { AnyView(GraphicsContextGalleryPage()) }
    )
}

#Preview {
    GraphicsContextGalleryPage()
        .frame(width: 900, height: 700)
}
