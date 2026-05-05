import SwiftUI

// SwiftUI `View/clipped(antialiased:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/clipped(antialiased:).md
// macOS 10.15+. Clips the view to its bounding rectangular frame.

struct ClippedPage: View {
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
            Text("View/clipped(antialiased:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Clips the view to its bounding rectangular frame. By default, content that overflows a frame still draws \u{2014} clipped() hides it.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/clipped(antialiased:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var longText: Text {
        Text("This long text string is clipped at the frame's edge once .clipped() is applied above.")
            .font(.headline)
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    longText
                        .fixedSize()
                        .frame(width: 175, height: 60, alignment: .leading)
                        .border(.tertiary)
                    Text("without .clipped() \u{2014} text overflows").font(.caption).foregroundStyle(.secondary)
                }
                VStack(alignment: .leading, spacing: 4) {
                    longText
                        .fixedSize()
                        .frame(width: 175, height: 60, alignment: .leading)
                        .clipped()
                        .border(.tertiary)
                    Text("with .clipped() \u{2014} hidden").font(.caption).foregroundStyle(.secondary)
                }
            }
            APICallout(".clipped()")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Image overflowing a frame") {
                HStack(spacing: 24) {
                    VStack(alignment: .leading, spacing: 4) {
                        Image(systemName: "leaf.fill")
                            .resizable().scaledToFill()
                            .foregroundStyle(.green)
                            .frame(width: 120, height: 80)
                            .border(.tertiary)
                        Text("default \u{2014} fills then leaks").font(.caption).foregroundStyle(.secondary)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Image(systemName: "leaf.fill")
                            .resizable().scaledToFill()
                            .foregroundStyle(.green)
                            .frame(width: 120, height: 80)
                            .clipped()
                            .border(.tertiary)
                        Text(".clipped()").font(.caption).foregroundStyle(.secondary)
                    }
                }
            }

            VariantRow(title: "Rotated content + clip") {
                HStack(spacing: 24) {
                    Text("Rotation overflow")
                        .font(.headline)
                        .padding(8)
                        .background(.tint, in: RoundedRectangle(cornerRadius: 6))
                        .rotationEffect(.degrees(15))
                        .frame(width: 200, height: 60)
                        .clipped()
                        .border(.tertiary)
                    APICallout(".rotationEffect(.degrees(15)).frame(width: 200, height: 60).clipped()")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "antialiased: true") {
            HStack(spacing: 24) {
                Image(systemName: "circle.fill")
                    .resizable()
                    .foregroundStyle(.blue)
                    .frame(width: 120, height: 80)
                    .clipped(antialiased: true)
                    .border(.tertiary)
                APICallout(".clipped(antialiased: true)")
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Default is no clip.", "Without .clipped(), a frame is layout-only. The view's intrinsic content draws past the frame's edges.", "rectangle.dashed"),
        ("Rectangular clip only.", "clipped() always clips to the bounding rect. For non-rectangular clipping, use clipShape(_:style:).", "rectangle"),
        ("antialiased smooths the cut.", "The default false produces a hard pixel-aligned edge. Set true for sub-pixel anti-aliasing along the clip rectangle.", "scribble"),
        ("Cheap operation.", "Rectangular clipping is essentially free \u{2014} the renderer simply drops the out-of-bounds geometry.", "speedometer")
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
    ClippedPage().frame(width: 1100, height: 1000)
}
