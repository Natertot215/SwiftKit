import SwiftUI

// SwiftUI `Color` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/color.md
// macOS 10.15+. A representation of a color that adapts to context.

struct ColorPage: View {
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
            Text("Color")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A representation of a color that adapts to the rendering environment.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/color.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        HStack(spacing: 8) {
            ForEach(["red", "orange", "yellow", "green", "blue", "purple", "pink"], id: \.self) { name in
                let c: Color = {
                    switch name {
                    case "red": return .red
                    case "orange": return .orange
                    case "yellow": return .yellow
                    case "green": return .green
                    case "blue": return .blue
                    case "purple": return .purple
                    default: return .pink
                    }
                }()
                VStack(spacing: 4) {
                    RoundedRectangle(cornerRadius: 6).fill(c).frame(width: 40, height: 40)
                    Text(".\(name)").font(.caption2).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            ColorVariantRow(title: "Semantic / adaptive colors") {
                let semanticColors: [(String, Color)] = [
                    (".primary", .primary),
                    (".secondary", .secondary),
                    (".accentColor", .accentColor)
                ]
                HStack(spacing: 16) {
                    ForEach(semanticColors, id: \.0) { name, color in
                        VStack(spacing: 4) {
                            RoundedRectangle(cornerRadius: 6).fill(color).frame(width: 60, height: 40)
                            Text(name).font(.caption2).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            ColorVariantRow(title: "System named colors") {
                let namedColors: [(String, Color)] = [
                    (".red", .red), (".orange", .orange), (".yellow", .yellow),
                    (".green", .green), (".mint", .mint), (".teal", .teal),
                    (".cyan", .cyan), (".blue", .blue), (".indigo", .indigo),
                    (".purple", .purple), (".pink", .pink), (".brown", .brown)
                ]
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(70)), count: 6), spacing: 10) {
                    ForEach(namedColors, id: \.0) { name, color in
                        VStack(spacing: 4) {
                            RoundedRectangle(cornerRadius: 6).fill(color).frame(width: 60, height: 36)
                            Text(name).font(.caption2).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            ColorVariantRow(title: "UI materials / fills") {
                let materials: [(String, Material)] = [
                    (".ultraThinMaterial", .ultraThinMaterial),
                    (".thinMaterial", .thinMaterial),
                    (".regularMaterial", .regularMaterial),
                    (".thickMaterial", .thickMaterial),
                    (".ultraThickMaterial", .ultraThickMaterial)
                ]
                HStack(spacing: 12) {
                    ForEach(materials, id: \.0) { name, mat in
                        VStack(spacing: 4) {
                            ZStack {
                                LinearGradient(colors: [.blue, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)
                                RoundedRectangle(cornerRadius: 6).fill(mat).frame(width: 60, height: 36)
                            }
                            .frame(width: 60, height: 36)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                            Text(name)
                                .font(.caption2)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                                .multilineTextAlignment(.center)
                                .frame(width: 70)
                        }
                    }
                }
            }

            ColorVariantRow(title: "Opacity variants — .opacity(_:)") {
                HStack(spacing: 10) {
                    ForEach([0.1, 0.3, 0.5, 0.7, 1.0], id: \.self) { o in
                        VStack(spacing: 4) {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.accentColor.opacity(o))
                                .frame(width: 50, height: 40)
                            Text(String(format: "%.1f", o))
                                .font(.caption2).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            ColorVariantRow(title: "Color(hue:saturation:brightness:)") {
                HStack(spacing: 6) {
                    ForEach(0..<8, id: \.self) { i in
                        let hue = Double(i) / 8.0
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color(hue: hue, saturation: 0.8, brightness: 0.9))
                            .frame(width: 36, height: 36)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ColorVariantRow(title: "Foreground + background style composition") {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 12) {
                        Text("Primary text")
                            .foregroundStyle(.primary)
                            .padding(8)
                            .background(.secondary.opacity(0.15), in: RoundedRectangle(cornerRadius: 8))
                        Text("Tinted text")
                            .foregroundStyle(.tint)
                            .padding(8)
                            .background(Color.accentColor.opacity(0.12), in: RoundedRectangle(cornerRadius: 8))
                    }
                    APICallout(".foregroundStyle(.primary) + .background(.secondary.opacity(0.15))")
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Never hand-mix RGB tuples — L-001.", "Always use semantic tokens (.tint, .primary, .secondary) or named system colors (.red, .blue, etc.). Hand-mixed values break dark/light adaptation.", "exclamationmark.triangle"),
        ("Color conforms to ShapeStyle.", "You can use Color anywhere a ShapeStyle is expected — in .fill, .foregroundStyle, .background, etc.", "paintpalette"),
        ("Use .opacity(_:) to add transparency.", "Color.tint.opacity(0.2) is the idiomatic way to create a transparent variant of any color while keeping semantic adaptability.", "circle.lefthalf.filled"),
        ("Materials blur and sample the content behind them.", "Material values (ultraThinMaterial etc.) are vibrancy-aware — they adapt to light/dark mode and the content behind them via the system compositor.", "square.2.layers.3d.top.filled")
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

private struct ColorVariantRow<Content: View>: View {
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
    ColorPage()
        .frame(width: 1100, height: 1100)
}
