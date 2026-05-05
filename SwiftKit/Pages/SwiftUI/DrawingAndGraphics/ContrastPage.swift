import SwiftUI

// SwiftUI `View/contrast(_:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/contrast(_:).md
// macOS 10.15+. Sets the contrast and separation between similar colors.

struct ContrastPage: View {
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
            Text("View/contrast(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Adjusts contrast — separation between similar colors. 1 = unchanged; 0 = neutral gray; <0 inverts.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/contrast(_:).md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var sample: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).fill(.red)
            Circle().fill(.green).frame(width: 40, height: 40)
        }
        .frame(width: 90, height: 70)
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                sample
                Image(systemName: "arrow.right").foregroundStyle(.secondary)
                sample.contrast(2)
            }
            APICallout(".contrast(2)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        ContrastVariantRow(title: "Range — negative inverts") {
            HStack(spacing: 12) {
                ForEach([-0.2, 0.0, 0.5, 1.0, 1.5, 2.0], id: \.self) { v in
                    VStack(spacing: 4) {
                        sample.contrast(v)
                        Text(String(format: "%.1f", v))
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        ContrastVariantRow(title: "Interactive") {
            VStack(alignment: .leading, spacing: 12) {
                sample.frame(width: 200, height: 120).contrast(amount).animation(.easeInOut, value: amount)
                HStack {
                    Text("amount").font(.caption).foregroundStyle(.secondary).frame(width: 80, alignment: .leading)
                    Slider(value: $amount, in: -0.5...3).frame(width: 240)
                    Text(String(format: "%.2f", amount)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("1.0 leaves the view unchanged.", "Below 1, contrast collapses toward neutral gray; above 1, similar colors push apart. 0 produces a flat 50% gray.", "circle.lefthalf.filled"),
        ("Negative values invert.", "Contrast values below 0 invert colors before applying contrast — useful for high-impact transitions.", "arrow.left.and.right.righttriangle.left.righttriangle.right"),
        ("Animatable.", "contrast interpolates inside withAnimation. Combine with brightness/saturation for filmic transitions.", "wand.and.sparkles"),
        ("Composable.", "Stacks cleanly with brightness, saturation, grayscale, and hueRotation; effects evaluate in modifier order.", "square.2.layers.3d")
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

private struct ContrastVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview { ContrastPage().frame(width: 1100, height: 900) }
