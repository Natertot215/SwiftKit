import SwiftUI

// SwiftUI color-effect modifier reference page.
// Covers: View/brightness(_:), View/contrast(_:), View/colorInvert(),
//         View/colorMultiply(_:), View/saturation(_:), View/grayscale(_:),
//         View/hueRotation(_:), View/luminanceToAlpha(), View/colorMatrixEffect
// macOS 10.15+

struct ColorEffectsPage: View {
    @State private var brightness: Double = 0
    @State private var saturation: Double = 1

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
            Text("Color Effects")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("brightness, contrast, colorInvert, colorMultiply, saturation, grayscale, hueRotation, luminanceToAlpha, ColorMatrix.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/ · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                sampleCard.grayscale(0)
                Image(systemName: "arrow.right").foregroundStyle(.secondary)
                sampleCard.grayscale(1)
            }
            APICallout(".grayscale(1.0)")
        }
    }

    private var sampleCard: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(LinearGradient(colors: [.blue, .purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 100, height: 70)
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            CEVariantRow(title: "brightness(_:) — [-1, 1] range") {
                HStack(spacing: 12) {
                    ForEach([-0.5, 0.0, 0.3, 0.6], id: \.self) { v in
                        VStack(spacing: 4) {
                            sampleCard.brightness(v)
                            Text(String(format: "%.1f", v)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            CEVariantRow(title: "contrast(_:)") {
                HStack(spacing: 12) {
                    ForEach([0.2, 0.6, 1.0, 2.0], id: \.self) { v in
                        VStack(spacing: 4) {
                            sampleCard.contrast(v)
                            Text(String(format: "%.1f", v)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            CEVariantRow(title: "saturation(_:)") {
                HStack(spacing: 12) {
                    ForEach([0.0, 0.4, 1.0, 2.0], id: \.self) { v in
                        VStack(spacing: 4) {
                            sampleCard.saturation(v)
                            Text(String(format: "%.1f", v)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            CEVariantRow(title: "grayscale(_:)") {
                HStack(spacing: 12) {
                    ForEach([0.0, 0.33, 0.66, 1.0], id: \.self) { v in
                        VStack(spacing: 4) {
                            sampleCard.grayscale(v)
                            Text(String(format: "%.2f", v)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            CEVariantRow(title: "hueRotation(_:)") {
                HStack(spacing: 12) {
                    ForEach([0, 60, 120, 180, 240, 300], id: \.self) { deg in
                        VStack(spacing: 4) {
                            sampleCard.hueRotation(.degrees(Double(deg)))
                            Text("\(deg)°").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            CEVariantRow(title: "colorInvert()") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        sampleCard
                        Text("original").font(.caption).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        sampleCard.colorInvert()
                        Text(".colorInvert()").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }

            CEVariantRow(title: "colorMultiply(_:)") {
                HStack(spacing: 12) {
                    VStack(spacing: 6) {
                        sampleCard.colorMultiply(.red)
                        Text(".colorMultiply(.red)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        sampleCard.colorMultiply(.green)
                        Text(".colorMultiply(.green)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        sampleCard.colorMultiply(.blue)
                        Text(".colorMultiply(.blue)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }

            CEVariantRow(title: "luminanceToAlpha()") {
                HStack(spacing: 20) {
                    VStack(spacing: 6) {
                        ZStack {
                            Color.accentColor
                            Image(systemName: "star.fill")
                                .font(.system(size: 48))
                                .foregroundStyle(.white)
                                .luminanceToAlpha()
                        }
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        APICallout(".luminanceToAlpha()")
                    }
                    Text("Light pixels become transparent, dark pixels become opaque — useful for mask compositing.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: 260)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            CEVariantRow(title: "Interactive brightness + saturation") {
                VStack(alignment: .leading, spacing: 12) {
                    sampleCard
                        .frame(width: 200, height: 120)
                        .brightness(brightness)
                        .saturation(saturation)
                        .animation(.easeInOut, value: brightness)
                        .animation(.easeInOut, value: saturation)

                    HStack {
                        Text("Brightness").font(.caption).foregroundStyle(.secondary).frame(width: 80, alignment: .leading)
                        Slider(value: $brightness, in: -1...1).frame(width: 200)
                        Text(String(format: "%.2f", brightness)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    HStack {
                        Text("Saturation").font(.caption).foregroundStyle(.secondary).frame(width: 80, alignment: .leading)
                        Slider(value: $saturation, in: 0...3).frame(width: 200)
                        Text(String(format: "%.2f", saturation)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("All color-effect modifiers are animatable.", "brightness, contrast, saturation, grayscale, and hueRotation all animate smoothly within withAnimation — great for hover or focus state transitions.", "wand.and.sparkles"),
        ("These are GPU post-process effects.", "The effects render on the GPU after the view has been drawn. Stacking many of them is cheap, but complex hierarchies may benefit from .drawingGroup().", "cpu"),
        ("grayscale vs saturation(0) — same result.", ".grayscale(1) and .saturation(0) produce the same visual output. .grayscale takes values 0–1 while .saturation is unbounded.", "circle.lefthalf.filled"),
        ("luminanceToAlpha is useful for masks.", "Apply to a white-on-black shape, then use as the mask layer in a ZStack or with .mask(_:). White becomes fully transparent, black fully opaque.", "circle.dashed"),
        ("colorMultiply multiplies per-channel.", "Colors in the view are multiplied component-by-component with the parameter color. Use .white to leave unchanged, .black to turn everything black.", "multiply")
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

private struct CEVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    ColorEffectsPage()
        .frame(width: 1100, height: 1200)
}
