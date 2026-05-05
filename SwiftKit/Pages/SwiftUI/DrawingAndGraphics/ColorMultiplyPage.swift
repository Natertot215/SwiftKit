import SwiftUI

// SwiftUI `View/colorMultiply(_:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/colormultiply(_:).md
// macOS 10.15+. Multiplies the view's colors by a Color, channel by channel.

struct ColorMultiplyPage: View {
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
            Text("View/colorMultiply(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Multiplies the view's colors by a Color, channel by channel — useful for tinting, darkening, or pre-blending.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/colormultiply(_:).md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var sample: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(LinearGradient(colors: [.white, .gray], startPoint: .top, endPoint: .bottom))
            .frame(width: 100, height: 70)
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                VStack(spacing: 6) { sample; Text("original").font(.caption).foregroundStyle(.secondary) }
                Image(systemName: "arrow.right").foregroundStyle(.secondary)
                VStack(spacing: 6) { sample.colorMultiply(.purple); Text(".colorMultiply(.purple)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary) }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            CMVariantRow(title: "Per-channel tints") {
                HStack(spacing: 12) {
                    ForEach([Color.red, .green, .blue, .yellow, .purple, .orange], id: \.self) { c in
                        VStack(spacing: 4) {
                            sample.colorMultiply(c)
                            Text(String(describing: c).split(separator: ".").last.map(String.init) ?? "")
                                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            CMVariantRow(title: ".white preserves; .black blacks-out") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) { sample.colorMultiply(.white); Text(".white").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary) }
                    VStack(spacing: 6) { sample.colorMultiply(.black); Text(".black").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary) }
                    VStack(spacing: 6) { sample.colorMultiply(.gray); Text(".gray").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary) }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        CMVariantRow(title: "On a colorful gradient") {
            HStack(spacing: 12) {
                VStack(spacing: 6) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(LinearGradient(colors: [.red, .yellow, .green, .blue], startPoint: .leading, endPoint: .trailing))
                        .frame(width: 220, height: 60)
                    Text("original").font(.caption).foregroundStyle(.secondary)
                }
                VStack(spacing: 6) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(LinearGradient(colors: [.red, .yellow, .green, .blue], startPoint: .leading, endPoint: .trailing))
                        .colorMultiply(.purple)
                        .frame(width: 220, height: 60)
                    Text(".colorMultiply(.purple)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Multiplication is per-channel.", "Output channel = input channel × tint channel. .red multiplies green and blue toward 0; .white leaves the view unchanged; .black yields full black.", "multiply"),
        ("Single Color parameter, not ShapeStyle.", "colorMultiply(_:) takes Color (not a generic ShapeStyle). Use .blendMode(.multiply) on a sibling view if you need a gradient or pattern multiplied in.", "function"),
        ("Composable with other filters.", "Combine with brightness/contrast for gradient tints, or stack with .saturation(0) to produce a tinted grayscale.", "square.2.layers.3d"),
        ("Animatable.", "Color interpolates inside withAnimation. Use this to drive accent-aware highlights or tap-down feedback.", "wand.and.sparkles")
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
}

private struct CMVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview { ColorMultiplyPage().frame(width: 1100, height: 1000) }
