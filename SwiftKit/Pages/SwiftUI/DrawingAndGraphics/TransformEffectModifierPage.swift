import SwiftUI

// SwiftUI `View/transformEffect(_:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/transformeffect(_:).md
// macOS 10.15+. Applies an affine transformation (CGAffineTransform) to the rendered output.

struct TransformEffectModifierPage: View {
    @State private var rotation: Double = 0
    @State private var scale: Double = 1

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
            Text("View/transformEffect(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Applies an affine transformation to the view's rendered output. Combine rotation, scaling, translation, and skew through a single CGAffineTransform.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/transformeffect(_:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private func tile(_ label: String) -> some View {
        Text(label)
            .font(.headline).foregroundStyle(.white)
            .frame(width: 110, height: 70)
            .background(Color.accentColor.gradient, in: RoundedRectangle(cornerRadius: 8))
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 32) {
                tile("Original")
                tile("Skewed")
                    .transformEffect(CGAffineTransform(a: 1, b: 0, c: 0.3, d: 1, tx: 0, ty: 0))
            }
            APICallout("CGAffineTransform(a: 1, b: 0, c: 0.3, d: 1, tx: 0, ty: 0)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: ".identity / .scaledBy / .rotated / .translatedBy") {
                HStack(spacing: 24) {
                    VStack(spacing: 6) {
                        tile("identity").transformEffect(.identity)
                        Text(".identity").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        tile("scaled")
                            .transformEffect(CGAffineTransform.identity.scaledBy(x: 0.7, y: 0.7))
                        Text(".scaledBy(x: 0.7, y: 0.7)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        tile("rotated")
                            .transformEffect(CGAffineTransform.identity.rotated(by: -.pi / 6))
                        Text(".rotated(by: -.pi / 6)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        tile("translated")
                            .transformEffect(CGAffineTransform.identity.translatedBy(x: 12, y: -8))
                        Text(".translatedBy(x: 12, y: -8)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }

            VariantRow(title: "Composed (rotate + scale)") {
                let composed = CGAffineTransform.identity
                    .rotated(by: .pi / 8)
                    .scaledBy(x: 0.85, y: 0.85)
                HStack(spacing: 16) {
                    tile("rotate\u{2192}scale")
                        .transformEffect(composed)
                    APICallout(".rotated(by: .pi/8).scaledBy(x: 0.85, y: 0.85)")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "Interactive") {
            VStack(alignment: .leading, spacing: 12) {
                tile("Live")
                    .transformEffect(
                        CGAffineTransform.identity
                            .rotated(by: rotation * .pi / 180)
                            .scaledBy(x: scale, y: scale)
                    )
                    .animation(.easeInOut, value: rotation)
                    .animation(.easeInOut, value: scale)
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack {
                    Text("rotation").font(.caption).foregroundStyle(.secondary).frame(width: 80, alignment: .leading)
                    Slider(value: $rotation, in: -180...180).frame(width: 240)
                    Text(String(format: "%+.0f\u{00b0}", rotation)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
                HStack {
                    Text("scale").font(.caption).foregroundStyle(.secondary).frame(width: 80, alignment: .leading)
                    Slider(value: $scale, in: 0.4...1.6).frame(width: 240)
                    Text(String(format: "%.2fx", scale)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Affine only \u{2014} 2D.", "transformEffect takes a CGAffineTransform, which is a 3\u{00d7}3 matrix limited to 2D operations. For 3D, use rotation3DEffect or projectionEffect.", "square.grid.3x3"),
        ("Compose with chained methods.", "Build complex transforms by chaining .rotated, .scaledBy, .translatedBy on .identity. Order matters \u{2014} matrix multiplication isn't commutative.", "function"),
        ("Frame is unchanged.", "Like the other effect modifiers, transformEffect is render-only. The view's frame doesn't grow or rotate.", "rectangle.dashed"),
        ("Animatable.", "Inside withAnimation, ModifiedContent interpolates the transform's components, useful for tap reactions and spinners.", "wand.and.sparkles")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol).font(.headline).foregroundStyle(.primary)
                    Text(note.detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
                }
            }
        }
    }

    private struct VariantRow<Content: View>: View {
        let title: String
        @ViewBuilder var content: () -> Content
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text(title).font(.headline).foregroundStyle(.primary)
                content()
            }
        }
    }
}

#Preview {
    TransformEffectModifierPage().frame(width: 1100, height: 1000)
}
