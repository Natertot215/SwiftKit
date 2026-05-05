import SwiftUI

// SwiftUI `View/saturation(_:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/saturation(_:).md
// macOS 10.15+. Adjusts color saturation; 0 = grayscale, 1 = unchanged, >1 = oversaturated.

struct SaturationPage: View {
    @State private var amount: Double = 1

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
            Text("View/saturation(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Adjusts the saturation of colors. 0 produces grayscale; 1 leaves unchanged; values > 1 oversaturate.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/saturation(_:).md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var sample: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(LinearGradient(colors: [.red, .orange, .yellow, .green, .blue, .purple], startPoint: .leading, endPoint: .trailing))
            .frame(width: 220, height: 50)
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                sample
                Image(systemName: "arrow.right").foregroundStyle(.secondary)
                sample.saturation(0)
            }
            APICallout(".saturation(0)  // grayscale")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        SatVariantRow(title: "Saturation amounts") {
            VStack(alignment: .leading, spacing: 8) {
                ForEach([0.0, 0.4, 1.0, 1.6, 2.5], id: \.self) { v in
                    HStack(spacing: 12) {
                        Text(String(format: "%.1f", v)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary).frame(width: 50, alignment: .leading)
                        sample.saturation(v)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        SatVariantRow(title: "Interactive") {
            VStack(alignment: .leading, spacing: 12) {
                sample.frame(width: 280, height: 80).saturation(amount).animation(.easeInOut, value: amount)
                HStack {
                    Text("amount").font(.caption).foregroundStyle(.secondary).frame(width: 80, alignment: .leading)
                    Slider(value: $amount, in: 0...3).frame(width: 240)
                    Text(String(format: "%.2f", amount)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("0 = grayscale; 1 = unchanged.", "Use 0 to convert to grayscale (functionally same as .grayscale(1)). Use values > 1 to oversaturate.", "drop"),
        ("Unbounded above.", "Unlike .grayscale (clamped 0…1), .saturation accepts any non-negative value. 2-3+ produces vivid, neon results.", "infinity"),
        ("Animatable.", "saturation interpolates smoothly. Combine with hueRotation to fade between palettes.", "wand.and.sparkles"),
        (".saturation(0) vs .grayscale(1).", "Both produce grayscale. .saturation is unbounded; .grayscale is clamped 0…1. Pick the one that matches the rest of your effect chain.", "circle.lefthalf.filled")
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

private struct SatVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview { SaturationPage().frame(width: 1100, height: 1000) }
