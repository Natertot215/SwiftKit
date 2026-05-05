import SwiftUI

// SwiftUI `View/grayscale(_:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/grayscale(_:).md
// macOS 10.15+. Reduces color intensity; 0 = unchanged, 1 = grayscale.

struct GrayscalePage: View {
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
            Text("View/grayscale(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Reduces color intensity. 0 leaves the view unchanged; 1 fully desaturates.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/grayscale(_:).md · macOS 10.15+")
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
                sample.grayscale(1.0)
            }
            APICallout(".grayscale(1.0)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        GSVariantRow(title: "0 → 1 sweep") {
            VStack(alignment: .leading, spacing: 8) {
                ForEach([0.0, 0.25, 0.5, 0.75, 1.0], id: \.self) { v in
                    HStack(spacing: 12) {
                        Text(String(format: "%.2f", v)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary).frame(width: 50, alignment: .leading)
                        sample.grayscale(v)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        GSVariantRow(title: "Interactive") {
            VStack(alignment: .leading, spacing: 12) {
                sample.frame(width: 280, height: 80).grayscale(amount).animation(.easeInOut, value: amount)
                HStack {
                    Text("amount").font(.caption).foregroundStyle(.secondary).frame(width: 80, alignment: .leading)
                    Slider(value: $amount, in: 0...1).frame(width: 240)
                    Text(String(format: "%.2f", amount)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Range is 0…1.", "Unlike .saturation which is unbounded, .grayscale clamps to [0, 1]. 0 = no change, 1 = full grayscale.", "circle.lefthalf.filled"),
        ("Equivalent to .saturation(1 - amount).", ".grayscale(0.5) and .saturation(0.5) produce identical results. Pick by intent — desaturation vs reduced saturation.", "function"),
        ("Animatable.", "grayscale interpolates inside withAnimation — useful for disabled-state or focus transitions.", "wand.and.sparkles"),
        ("Disabled appearance.", "Apply lightly (0.3-0.5) to indicate non-interactive content; combine with .opacity for a stronger effect.", "person.slash")
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

private struct GSVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview { GrayscalePage().frame(width: 1100, height: 1000) }
