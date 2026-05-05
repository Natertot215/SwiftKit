import SwiftUI

// SwiftUI `View/foregroundStyle(_:_:_:)` reference page (primary + secondary + tertiary).
// Source: Documentation/SwiftUI/drawing-and-graphics/foregroundstyle(_:_:_:).md
// macOS 12.0+. Three-style form for layered SF Symbols.

struct ForegroundStyleTriplePage: View {
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
            Text("View/foregroundStyle(_:_:_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets primary, secondary, and tertiary foreground styles. Layered SF Symbols use this for three-region palette rendering.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/foregroundstyle(_:_:_:).md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "thermometer.sun.fill").font(.largeTitle).imageScale(.large)
                .foregroundStyle(.red, .orange, .yellow)
            APICallout(".foregroundStyle(.red, .orange, .yellow)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            FSTVariantRow(title: "Layered SF Symbols — three concrete colors") {
                HStack(spacing: 24) {
                    Image(systemName: "cloud.bolt.rain.fill").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(.white, .yellow, .blue)
                    Image(systemName: "person.3.sequence.fill").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(.purple, .pink, .orange)
                    Image(systemName: "leaf.arrow.circlepath").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(.green, .mint, .secondary)
                }
            }

            FSTVariantRow(title: "Gradient + Color + semantic") {
                Image(systemName: "globe.americas.fill").font(.largeTitle).imageScale(.large)
                    .foregroundStyle(
                        LinearGradient(colors: [.blue, .cyan], startPoint: .top, endPoint: .bottom),
                        .green,
                        .secondary
                    )
            }

            FSTVariantRow(title: "All-semantic — hierarchical levels") {
                HStack(spacing: 24) {
                    Image(systemName: "square.stack.3d.up.fill").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(.primary, .secondary, .tertiary)
                    Image(systemName: "rectangle.stack.fill.badge.person.crop").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(.tint, .secondary, .quaternary)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        FSTVariantRow(title: "Compare single vs dual vs triple") {
            HStack(spacing: 24) {
                VStack(spacing: 6) {
                    Image(systemName: "thermometer.sun.fill").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(.red)
                    Text("single").font(.caption).foregroundStyle(.secondary)
                }
                VStack(spacing: 6) {
                    Image(systemName: "thermometer.sun.fill").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(.red, .orange)
                    Text("dual").font(.caption).foregroundStyle(.secondary)
                }
                VStack(spacing: 6) {
                    Image(systemName: "thermometer.sun.fill").font(.largeTitle).imageScale(.large)
                        .foregroundStyle(.red, .orange, .yellow)
                    Text("triple").font(.caption).foregroundStyle(.secondary)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Generic in three ShapeStyle parameters.", "foregroundStyle<S1, S2, S3>(_ primary: S1, _ secondary: S2, _ tertiary: S3) — three layers, three styles.", "function"),
        ("Implies palette rendering.", "Like the dual form, the three-style form puts SF Symbols into .palette mode. Each layer of the symbol picks up one of the three styles.", "paintpalette.fill"),
        ("Not all symbols have three layers.", "If a symbol has only one or two layers, the unused styles are ignored. Pick symbols designed with three regions for full effect.", "square.stack.3d.up"),
        ("Mix concrete and semantic styles.", "Pair concrete colors with .secondary or .tertiary for hierarchical detail, or pair gradients/colors for purely visual palettes.", "drop.fill")
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

private struct FSTVariantRow<Content: View>: View {
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
    ForegroundStyleTriplePage()
        .frame(width: 1100, height: 1100)
}
