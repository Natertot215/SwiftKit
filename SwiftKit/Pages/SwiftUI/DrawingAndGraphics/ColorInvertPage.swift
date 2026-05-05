import SwiftUI

// SwiftUI `View/colorInvert()` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/colorinvert().md
// macOS 10.15+. Inverts each color in the view to its complement.

struct ColorInvertPage: View {
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
            Text("View/colorInvert()")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Inverts every color in the view to its complement: red↔cyan, green↔magenta, blue↔yellow, white↔black.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/colorinvert().md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var sample: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).fill(.red)
            Circle().fill(.green).frame(width: 36, height: 36)
        }
        .frame(width: 90, height: 70)
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                VStack(spacing: 6) { sample; Text("original").font(.caption).foregroundStyle(.secondary) }
                Image(systemName: "arrow.right").foregroundStyle(.secondary)
                VStack(spacing: 6) { sample.colorInvert(); Text(".colorInvert()").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary) }
            }
            APICallout(".colorInvert()")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            CIVariantRow(title: "On gradients") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        gradientBox
                        Text("original").font(.caption).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        gradientBox.colorInvert()
                        Text(".colorInvert()").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }

            CIVariantRow(title: "On SF Symbols") {
                HStack(spacing: 16) {
                    Image(systemName: "moon.stars.fill").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(.indigo, .yellow)
                    Image(systemName: "moon.stars.fill").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(.indigo, .yellow)
                        .colorInvert()
                }
            }
        }
    }

    private var gradientBox: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(LinearGradient(colors: [.red, .yellow, .green, .blue], startPoint: .leading, endPoint: .trailing))
            .frame(width: 220, height: 60)
    }

    @ViewBuilder
    private var statesContent: some View {
        CIVariantRow(title: "Toggle to compare") {
            VStack(alignment: .leading, spacing: 8) {
                gradientBox
                gradientBox.colorInvert()
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("No parameters — exact complement.", "colorInvert() takes no arguments. For a graded version, use .contrast with a negative value, which inverts and re-applies contrast.", "arrow.left.arrow.right"),
        ("Equivalent to .colorMultiply(.white).colorInvert().", "Each pixel's RGB becomes 1 - r, 1 - g, 1 - b — the same as a 1-x channel transform.", "function"),
        ("Affects everything in the subtree.", "The entire rendered subtree is inverted, including text and SF Symbols. Apply to a small region rather than the whole window.", "rectangle.dashed"),
        ("Composable.", "Combine with .saturation(0) for an inverted-grayscale effect, or with .luminanceToAlpha for a high-contrast mask.", "square.2.layers.3d")
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

private struct CIVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview { ColorInvertPage().frame(width: 1100, height: 1000) }
