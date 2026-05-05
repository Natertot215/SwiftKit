import SwiftUI

// SwiftUI `Glass` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/glass.md
// macOS 26.0+. Configuration value for Liquid Glass; consumed by .glassEffect(_:in:).
//
// Note: Glass is NOT a ShapeStyle. It's a config struct passed to .glassEffect(...).
// Type properties: .regular, .clear, .identity. Methods: .tint(_:), .interactive(_:).

struct GlassPage: View {
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
            Text("Glass")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Configuration for the Liquid Glass material. Provide a Glass variant to the .glassEffect(_:in:) modifier; combine effects in GlassEffectContainer.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/glass.md · macOS 26.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Hello, World!")
                .font(.title)
                .padding()
                .glassEffect()
                .padding(20)
                .background(LinearGradient(colors: [.accentColor, .pink], startPoint: .topLeading, endPoint: .bottomTrailing), in: RoundedRectangle(cornerRadius: 16))
            APICallout(".glassEffect()  // implicit Glass.regular")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            GlassVariantRow(title: "Glass type properties — .regular, .clear, .identity") {
                HStack(spacing: 16) {
                    glassChip(label: ".regular", glass: .regular)
                    glassChip(label: ".clear",   glass: .clear)
                    glassChip(label: ".identity", glass: .identity)
                }
                .padding(20)
                .background(
                    LinearGradient(colors: [.indigo, .purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing),
                    in: RoundedRectangle(cornerRadius: 16)
                )
            }

            GlassVariantRow(title: "Glass.tint(_:) — colored Liquid Glass") {
                HStack(spacing: 16) {
                    glassChip(label: ".tint(.accent)", glass: .regular.tint(.accentColor))
                    glassChip(label: ".tint(.pink)",   glass: .regular.tint(.pink))
                    glassChip(label: ".tint(.green)",  glass: .regular.tint(.green))
                }
                .padding(20)
                .background(
                    LinearGradient(colors: [.blue, .teal], startPoint: .topLeading, endPoint: .bottomTrailing),
                    in: RoundedRectangle(cornerRadius: 16)
                )
            }

            GlassVariantRow(title: ".glassEffect(in:) — clip to a shape") {
                HStack(spacing: 16) {
                    Text("Capsule")
                        .padding(.horizontal, 16).padding(.vertical, 10)
                        .glassEffect(.regular, in: Capsule())
                    Text("Rounded")
                        .padding(.horizontal, 16).padding(.vertical, 10)
                        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 12))
                    Text("Circle").bold()
                        .frame(width: 60, height: 60)
                        .glassEffect(.regular, in: Circle())
                }
                .padding(20)
                .background(
                    LinearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing),
                    in: RoundedRectangle(cornerRadius: 16)
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        GlassVariantRow(title: "Glass.interactive(_:) — responds to touch/hover") {
            HStack(spacing: 16) {
                Button("Hover Me") {}
                    .buttonStyle(.plain)
                    .padding(.horizontal, 16).padding(.vertical, 10)
                    .glassEffect(.regular.interactive(true), in: Capsule())
                Button("Static Glass") {}
                    .buttonStyle(.plain)
                    .padding(.horizontal, 16).padding(.vertical, 10)
                    .glassEffect(.regular.interactive(false), in: Capsule())
            }
            .padding(20)
            .background(
                LinearGradient(colors: [.purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing),
                in: RoundedRectangle(cornerRadius: 16)
            )
        }
    }

    private func glassChip(label: String, glass: Glass) -> some View {
        Text(label)
            .font(.callout)
            .fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .glassEffect(glass, in: Capsule())
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Glass is NOT a ShapeStyle.", "Glass is a configuration value for Liquid Glass material. It's passed to .glassEffect(_:in:) — it doesn't fill shapes via .foregroundStyle / .backgroundStyle the way Color or Gradient does.", "info.circle"),
        ("Type properties: .regular, .clear, .identity.", ".regular is the default Liquid Glass material. .clear is a fully transparent variant. .identity disables glass while preserving the layout slot.", "drop"),
        ("Modifier methods compose Glass values.", ".tint(_:) tints the glass with a color; .interactive(_:) marks it as responsive to touch/hover. Chain them: .regular.tint(.accentColor).interactive(true).", "wand.and.stars"),
        ("GlassEffectContainer morphs adjacent glass views.", "Wrap multiple .glassEffect-bearing siblings in a GlassEffectContainer to get fluid morphing between them as their geometries change.", "square.on.square"),
        ("macOS 26+ only.", "Liquid Glass is new in macOS 26 / iOS 26. Earlier OS versions render the underlying view without the glass treatment; gate with #available if your target spans older systems.", "calendar")
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

private struct GlassVariantRow<Content: View>: View {
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
    GlassPage()
        .frame(width: 1100, height: 1200)
}
