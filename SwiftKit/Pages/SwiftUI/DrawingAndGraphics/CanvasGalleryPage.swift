import SwiftUI

// SwiftUI `Canvas` / `GraphicsContext` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/canvas.md
// macOS 12.0+. Renders an immediate-mode 2D drawing context into a view.
// Also covers: GraphicsContext
// Note: GraphicsContext.Shading.color(_:) requires a concrete Color value.
//       Use Color.accentColor (semantic) rather than .tint (TintShapeStyle).

struct CanvasGalleryPage: View {
    private let accent = Color.accentColor

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Canvas / GraphicsContext")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Immediate-mode 2D drawing API with full access to GraphicsContext drawing primitives.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/canvas.md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Canvas { ctx, size in
                ctx.fill(
                    Path(ellipseIn: CGRect(x: size.width / 2 - 60, y: size.height / 2 - 40, width: 120, height: 80)),
                    with: .color(Color.accentColor)
                )
            }
            .frame(width: 280, height: 120)
            .background(.secondary.opacity(0.08), in: RoundedRectangle(cornerRadius: 8))
            APICallout("Canvas { ctx, size in\n  ctx.fill(Path(ellipseIn: ...), with: .color(Color.accentColor))\n}")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            CVVariantRow(title: "ctx.fill — filled shapes") {
                Canvas { ctx, size in
                    var triangle = Path()
                    triangle.move(to: CGPoint(x: 50, y: 10))
                    triangle.addLine(to: CGPoint(x: 90, y: 80))
                    triangle.addLine(to: CGPoint(x: 10, y: 80))
                    triangle.closeSubpath()
                    ctx.fill(triangle, with: .color(Color.accentColor))

                    ctx.fill(Path(ellipseIn: CGRect(x: 110, y: 15, width: 60, height: 60)),
                             with: .color(Color.accentColor.opacity(0.6)))

                    ctx.fill(Path(CGRect(x: 190, y: 20, width: 80, height: 50)),
                             with: .color(Color.accentColor.opacity(0.3)))
                }
                .frame(width: 320, height: 100)
                .background(.secondary.opacity(0.08), in: RoundedRectangle(cornerRadius: 8))
            }

            CVVariantRow(title: "ctx.stroke — outlined spiral") {
                Canvas { ctx, size in
                    var spiral = Path()
                    var r: CGFloat = 5
                    var angle: CGFloat = 0
                    let cx = size.width / 2
                    let cy = size.height / 2
                    spiral.move(to: CGPoint(x: cx + r, y: cy))
                    while r < 55 {
                        let nextAngle = angle + 0.2
                        let nextR = r + 0.4
                        spiral.addLine(to: CGPoint(x: cx + nextR * cos(nextAngle), y: cy + nextR * sin(nextAngle)))
                        angle = nextAngle
                        r = nextR
                    }
                    ctx.stroke(spiral, with: .color(Color.accentColor),
                               style: StrokeStyle(lineWidth: 2, lineCap: .round))
                }
                .frame(width: 280, height: 140)
                .background(.secondary.opacity(0.08), in: RoundedRectangle(cornerRadius: 8))
            }

            CVVariantRow(title: "ctx.draw — text") {
                Canvas { ctx, size in
                    let text = Text("Hello, Canvas").font(.title2).bold().foregroundStyle(Color.accentColor)
                    ctx.draw(text, at: CGPoint(x: size.width / 2, y: size.height / 2), anchor: .center)
                }
                .frame(width: 300, height: 80)
                .background(.secondary.opacity(0.08), in: RoundedRectangle(cornerRadius: 8))
            }

            CVVariantRow(title: "ctx.draw — SF Symbols via resolve") {
                Canvas { ctx, size in
                    let symbols = ["star.fill", "heart.fill", "bolt.fill", "flame.fill"]
                    for (i, name) in symbols.enumerated() {
                        let x = CGFloat(i) * 60 + 40
                        let img = Image(systemName: name)
                        var resolved = ctx.resolve(img)
                        resolved.shading = .color(Color.accentColor.opacity(0.4 + Double(i) * 0.15))
                        ctx.draw(resolved, at: CGPoint(x: x, y: size.height / 2), anchor: .center)
                    }
                }
                .frame(width: 300, height: 80)
                .background(.secondary.opacity(0.08), in: RoundedRectangle(cornerRadius: 8))
            }

            CVVariantRow(title: "GraphicsContext.addFilter — blur") {
                Canvas { ctx, size in
                    ctx.addFilter(.blur(radius: 6))
                    ctx.fill(Path(ellipseIn: CGRect(x: 60, y: 20, width: 100, height: 80)),
                             with: .color(Color.accentColor))
                }
                .frame(width: 280, height: 120)
                .background(.secondary.opacity(0.08), in: RoundedRectangle(cornerRadius: 8))
            }

            CVVariantRow(title: "ctx.clip — clipping to an ellipse") {
                Canvas { ctx, size in
                    var clip = ctx
                    clip.clip(to: Path(ellipseIn: CGRect(x: 20, y: 10, width: 200, height: 100)))
                    for y in stride(from: 0, to: 120, by: 12) {
                        clip.stroke(
                            Path { p in
                                p.move(to: CGPoint(x: 0, y: CGFloat(y)))
                                p.addLine(to: CGPoint(x: 280, y: CGFloat(y)))
                            },
                            with: .color(Color.accentColor.opacity(0.6)),
                            lineWidth: 2
                        )
                    }
                }
                .frame(width: 280, height: 120)
                .background(.secondary.opacity(0.08), in: RoundedRectangle(cornerRadius: 8))
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            CVVariantRow(title: "Canvas with TimelineView — animation integration") {
                TimelineView(.animation) { context in
                    Canvas { ctx, size in
                        let t = context.date.timeIntervalSinceReferenceDate
                        let angle = t.truncatingRemainder(dividingBy: .pi * 2)
                        let cx = size.width / 2
                        let cy = size.height / 2
                        let r: CGFloat = 50

                        ctx.fill(Path(ellipseIn: CGRect(x: cx - r, y: cy - r, width: r * 2, height: r * 2)),
                                 with: .color(Color.accentColor.opacity(0.2)))

                        let dotX = cx + r * cos(angle)
                        let dotY = cy + r * sin(angle)
                        ctx.fill(Path(ellipseIn: CGRect(x: dotX - 8, y: dotY - 8, width: 16, height: 16)),
                                 with: .color(Color.accentColor))
                    }
                }
                .frame(width: 200, height: 150)
                .background(.secondary.opacity(0.08), in: RoundedRectangle(cornerRadius: 8))
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Canvas is immediate-mode — no view hierarchy overhead.", "Each redraw calls the closure fresh. Unlike SwiftUI views, there is no diffing or state reconciliation inside a Canvas — great for high-frequency drawing.", "bolt"),
        ("ctx.resolve(_:) turns a View into a drawable symbol.", "Resolve an Image or Text to get a GraphicsContext.ResolvedImage or .ResolvedText with mutable shading before drawing.", "photo"),
        ("Blend modes via ctx.blendMode.", "Set context.blendMode before drawing to composite shapes with .multiply, .screen, .overlay, and all standard modes.", "square.2.layers.3d"),
        ("Combine with TimelineView for animation.", "Wrap Canvas in TimelineView(.animation) and read context.date to get frame-accurate animation timing without Timer or task schedulers.", "clock.arrow.circlepath"),
        ("GraphicsContext.Shading requires Color not TintShapeStyle.", "Inside Canvas closures, .color(_:) takes a concrete Color value. Use Color.accentColor instead of .tint which is TintShapeStyle.", "scissors")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(note.detail)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
        }
    }
}

private struct CVVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

extension CanvasGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.canvas",
        title: "Canvas",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["Canvas"],
        blurb: "A view type that supports immediate-mode drawing. Pass a closure that draws into a GraphicsContext using paths, images, and text.",
        signature: "struct Canvas<Symbols> where Symbols : View",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/canvas.md",
        page: { AnyView(CanvasGalleryPage()) }
    )
}

#Preview {
    CanvasGalleryPage()
        .frame(width: 1100, height: 1200)
}
