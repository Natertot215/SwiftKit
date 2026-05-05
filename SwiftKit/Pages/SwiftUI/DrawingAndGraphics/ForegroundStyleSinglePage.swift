import SwiftUI

// SwiftUI `View/foregroundStyle(_:)` reference page (single-style form).
// Source: Documentation/SwiftUI/drawing-and-graphics/foregroundstyle(_:).md
// macOS 12.0+. Sets a view's foreground elements to a given ShapeStyle.

struct ForegroundStyleSinglePage: View {
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
            Text("View/foregroundStyle(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the view's foreground elements (text, shapes, template images including symbols) to a given ShapeStyle.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/foregroundstyle(_:).md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "triangle.fill")
                Text("Hello, world!")
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 40, height: 20)
            }
            .foregroundStyle(.teal)
            APICallout(".foregroundStyle(.teal)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            FSSVariantRow(title: "Semantic styles") {
                VStack(alignment: .leading, spacing: 6) {
                    Label("Primary text", systemImage: "circle.fill").foregroundStyle(.primary)
                    Label("Secondary text", systemImage: "circle.fill").foregroundStyle(.secondary)
                    Label("Tertiary text", systemImage: "circle.fill").foregroundStyle(.tertiary)
                    Label("Quaternary text", systemImage: "circle.fill").foregroundStyle(.quaternary)
                }
            }

            FSSVariantRow(title: "Concrete colors") {
                HStack(spacing: 16) {
                    ForEach([Color.red, .orange, .yellow, .green, .blue, .indigo, .purple], id: \.self) { c in
                        Image(systemName: "star.fill").foregroundStyle(c).font(.title2)
                    }
                }
            }

            FSSVariantRow(title: "Gradient") {
                Text("Gradient Text")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(LinearGradient(colors: [.accentColor, .pink, .orange], startPoint: .leading, endPoint: .trailing))
            }

            FSSVariantRow(title: "ShapeStyle modifiers — .gradient on a Color") {
                HStack(spacing: 16) {
                    Image(systemName: "swift").font(.largeTitle).imageScale(.large).foregroundStyle(Color.orange.gradient)
                    Image(systemName: "swift").font(.largeTitle).imageScale(.large).foregroundStyle(Color.purple.gradient)
                }
            }

            FSSVariantRow(title: ".tint, .accentColor — environment-driven") {
                HStack(spacing: 16) {
                    Image(systemName: "heart.fill").font(.title).foregroundStyle(.tint)
                    Image(systemName: "bolt.fill").font(.title).foregroundStyle(Color.accentColor)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        FSSVariantRow(title: "Cascades to descendants like text & symbols") {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 6) {
                    Label("Inherited foreground style", systemImage: "checkmark.circle")
                    Text("All shapes, text, and template images in this branch inherit .accentColor.")
                }
                .foregroundStyle(Color.accentColor)
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Generic over ShapeStyle.", "foregroundStyle<S: ShapeStyle>(_ style: S) — accepts any ShapeStyle: Color, hierarchical (.primary…), gradients, materials, and .tint / .accentColor.", "function"),
        ("Replaces .foregroundColor on macOS 12+.", ".foregroundColor is still available, but .foregroundStyle is the modern, more general form. Apple uses it everywhere in current docs.", "arrow.up.right.circle"),
        ("Affects template images including SF Symbols.", "SF Symbols rendered as templates pick up the foreground style. For multicolor or palette symbols, see .symbolRenderingMode and the dual/triple variants of foregroundStyle.", "paintpalette"),
        ("Inherits down the view tree.", "Like .font, foregroundStyle is environment-like — all descendants inherit until a child applies its own foregroundStyle.", "tree")
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

private struct FSSVariantRow<Content: View>: View {
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
    ForegroundStyleSinglePage()
        .frame(width: 1100, height: 1100)
}
