import SwiftUI

// SwiftUI `View/foregroundStyle(_:_:)` reference page (primary + secondary).
// Source: Documentation/SwiftUI/drawing-and-graphics/foregroundstyle(_:_:).md
// macOS 12.0+. Sets primary and secondary foreground styles. SF Symbols
// rendered with this modifier default to .palette rendering mode.

struct ForegroundStyleDualPage: View {
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
            Text("View/foregroundStyle(_:_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets primary and secondary foreground styles. SF Symbols default to .palette rendering when this is applied.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/foregroundstyle(_:_:).md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.plus")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.white, Color.accentColor)
            APICallout(".foregroundStyle(.white, Color.accentColor)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            FSDVariantRow(title: "Two-color SF Symbol palettes") {
                HStack(spacing: 24) {
                    Image(systemName: "cloud.sun.fill").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(.white, .yellow)
                    Image(systemName: "envelope.badge.fill").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(.white, .red)
                    Image(systemName: "heart.text.square.fill").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(.pink, .secondary)
                    Image(systemName: "bolt.heart.fill").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(.yellow, .red)
                }
            }

            FSDVariantRow(title: "Hierarchical mix — concrete + semantic") {
                HStack(spacing: 24) {
                    Image(systemName: "square.stack.3d.up.fill").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(Color.accentColor, .secondary)
                    Image(systemName: "person.2.fill").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(.primary, .secondary)
                    Image(systemName: "tray.full.fill").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(.tint, .quaternary)
                }
            }

            FSDVariantRow(title: "Gradient + Color") {
                Image(systemName: "moon.stars.fill").font(.largeTitle).imageScale(.large)
                    .foregroundStyle(LinearGradient(colors: [.indigo, .purple], startPoint: .top, endPoint: .bottom), .yellow)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        FSDVariantRow(title: "Compare with .foregroundStyle(_:) (single)") {
            HStack(spacing: 24) {
                VStack(spacing: 8) {
                    Image(systemName: "person.crop.circle.fill.badge.plus").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(Color.accentColor)
                    Text("single .accentColor").font(.caption).foregroundStyle(.secondary)
                }
                VStack(spacing: 8) {
                    Image(systemName: "person.crop.circle.fill.badge.plus").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(.white, Color.accentColor)
                    Text("dual .white + .accentColor").font(.caption).foregroundStyle(.secondary)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Implies SymbolRenderingMode.palette.", "When two styles are passed, SF Symbols default to palette rendering — each layer of the symbol picks up one of the styles.", "paintpalette.fill"),
        ("Generic in two ShapeStyle parameters.", "foregroundStyle<S1, S2>(_ primary: S1, _ secondary: S2) — primary is the leading/foreground layer; secondary is the supporting layer.", "function"),
        ("Use semantic styles for hierarchy.", "Pair primary with .secondary, .tertiary, or .quaternary for built-in hierarchy that adapts to context. Pair concrete colors when designing intentional palettes.", "tree"),
        ("Three-level form is foregroundStyle(_:_:_:).", "Layered symbols with three colored regions need the triple-style overload — see View/foregroundStyle(_:_:_:).", "square.stack.3d.up")
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

private struct FSDVariantRow<Content: View>: View {
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
    ForegroundStyleDualPage()
        .frame(width: 1100, height: 1100)
}
