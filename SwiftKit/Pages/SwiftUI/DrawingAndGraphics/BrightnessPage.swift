import SwiftUI

// SwiftUI `View/brightness(_:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/brightness(_:).md
// macOS 10.15+. Brightens this view by the specified amount in [-1, 1].

struct BrightnessPage: View {
    @State private var amount: Double = 0

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
            Text("View/brightness(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Brightens (or darkens) the view by the specified amount. Typical range: [-1, 1].")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/brightness(_:).md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var sample: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(LinearGradient(colors: [.blue, .purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 90, height: 70)
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                sample
                Image(systemName: "arrow.right").foregroundStyle(.secondary)
                sample.brightness(0.4)
            }
            APICallout(".brightness(0.4)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            BrightnessVariantRow(title: "Across the [-1, 1] range") {
                HStack(spacing: 12) {
                    ForEach([-0.6, -0.3, 0.0, 0.3, 0.6, 1.0], id: \.self) { v in
                        VStack(spacing: 4) {
                            sample.brightness(v)
                            Text(String(format: "%.1f", v))
                                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            BrightnessVariantRow(title: "On an image") {
                HStack(spacing: 12) {
                    ForEach([-0.5, 0.0, 0.5], id: \.self) { v in
                        VStack(spacing: 4) {
                            Image(systemName: "photo.fill")
                                .font(.largeTitle).imageScale(.large)
                                .foregroundStyle(LinearGradient(colors: [.green, .teal], startPoint: .top, endPoint: .bottom))
                                .padding(20)
                                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 10))
                                .brightness(v)
                            Text(String(format: "%.1f", v))
                                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        BrightnessVariantRow(title: "Interactive") {
            VStack(alignment: .leading, spacing: 12) {
                sample.frame(width: 200, height: 120).brightness(amount).animation(.easeInOut, value: amount)
                HStack {
                    Text("amount").font(.caption).foregroundStyle(.secondary).frame(width: 80, alignment: .leading)
                    Slider(value: $amount, in: -1...1).frame(width: 240)
                    Text(String(format: "%.2f", amount)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Range is typically [-1, 1].", "0 leaves the view unchanged. Positive values brighten toward white; negative values darken toward black. Values past ±1 are accepted but clip.", "sun.max"),
        ("Animatable.", "brightness(_:) interpolates smoothly inside withAnimation, useful for hover or focus reactions.", "wand.and.sparkles"),
        ("Composable with other filters.", "Stacking brightness, contrast, saturation, and others is cheap on the GPU. They evaluate in modifier order.", "square.2.layers.3d"),
        ("Use .drawingGroup() for heavy stacks.", "If you stack many filters over a complex hierarchy, .drawingGroup() flattens the result into a single Metal layer for predictable performance.", "cpu")
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

private struct BrightnessVariantRow<Content: View>: View {
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
    BrightnessPage().frame(width: 1100, height: 1000)
}
