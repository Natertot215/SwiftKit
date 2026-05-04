import SwiftUI

// Symbol rendering mode reference page.
// Covers: symbolRenderingMode(_:), SymbolRenderingMode, SymbolColorRenderingMode,
//         SymbolVariableValueMode
// Source: Documentation/SwiftUI/images/
// macOS 12.0+

struct SymbolRenderingPage: View {
    @State private var variableValue: Double = 0.5

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
            Text("Symbol Rendering")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Control how SF Symbols are colored — monochrome, hierarchical, palette, and multicolor.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("View/symbolRenderingMode(_:) · SymbolRenderingMode · SymbolColorRenderingMode · SymbolVariableValueMode · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        SRCard(api: ".symbolRenderingMode(.multicolor)  (default for multicolor symbols)") {
            Image(systemName: "cloud.sun.rain.fill")
                .font(.largeTitle)
                .symbolRenderingMode(.multicolor)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            SRVariant(title: "SymbolRenderingMode — four modes") {
                let symbols = ["checkmark.shield.fill", "folder.badge.plus", "cloud.sun.rain.fill", "flame.fill"]
                HStack(alignment: .top, spacing: 16) {
                    SRCard(api: ".symbolRenderingMode(.monochrome)") {
                        VStack(spacing: 8) {
                            ForEach(symbols, id: \.self) { sym in
                                Image(systemName: sym).font(.title2).symbolRenderingMode(.monochrome)
                            }
                            Text(".monochrome").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                    SRCard(api: ".symbolRenderingMode(.hierarchical)") {
                        VStack(spacing: 8) {
                            ForEach(symbols, id: \.self) { sym in
                                Image(systemName: sym).font(.title2).symbolRenderingMode(.hierarchical)
                            }
                            Text(".hierarchical").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                    SRCard(api: ".symbolRenderingMode(.palette)") {
                        VStack(spacing: 8) {
                            ForEach(symbols, id: \.self) { sym in
                                Image(systemName: sym)
                                    .font(.title2)
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.tint, .green)
                            }
                            Text(".palette").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                    SRCard(api: ".symbolRenderingMode(.multicolor)") {
                        VStack(spacing: 8) {
                            ForEach(symbols, id: \.self) { sym in
                                Image(systemName: sym).font(.title2).symbolRenderingMode(.multicolor)
                            }
                            Text(".multicolor").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            SRVariant(title: "Palette rendering — two and three layers") {
                HStack(alignment: .top, spacing: 16) {
                    SRCard(api: ".foregroundStyle(.tint, .secondary) — 2 layers") {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.largeTitle)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.yellow, .black)
                    }
                    SRCard(api: ".foregroundStyle(.tint, .green, .blue) — 3 layers") {
                        Image(systemName: "person.badge.shield.checkmark.fill")
                            .font(.largeTitle)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.tint, .green, .blue)
                    }
                }
            }

            SRVariant(title: "Variable value — Image(systemName:variableValue:)") {
                SRCard(api: "Image(systemName: \"speaker.wave.3.fill\", variableValue: 0.7)") {
                    VStack(spacing: 8) {
                        Image(systemName: "speaker.wave.3.fill", variableValue: variableValue)
                            .font(.largeTitle)
                            .symbolRenderingMode(.hierarchical)
                        Slider(value: $variableValue)
                            .frame(width: 200)
                        Text("variableValue: \(variableValue, specifier: "%.2f")")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                }
            }

            SRVariant(title: "SymbolVariableValueMode") {
                SRCard(api: "SymbolVariableValueMode — controls animation of variable fill") {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("SymbolVariableValueMode specifies how a variable-value symbol animates when its value changes.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text("Values: .cumulative (animate through intermediate states), .iterative (each layer independently)")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.tertiary)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            SRVariant(title: "SymbolColorRenderingMode") {
                SRCard(api: "SymbolColorRenderingMode — .automatic vs .preferred") {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("SymbolColorRenderingMode controls how the foreground style interacts with hierarchical or palette layers.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text(".automatic — system picks based on symbol definition")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
                        Text(".preferred — always uses the foregroundStyle colors you provide")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
                    }
                }
            }
        }
    }

    private struct SRNote { let title: String; let detail: String; let symbol: String }
    private let notes: [SRNote] = [
        .init(title: "Rendering mode determines how layers are colored.", detail: ".monochrome uses one color. .hierarchical uses tints of the primary color for depth. .palette assigns colors to each layer. .multicolor uses the symbol's own colors.", symbol: "paintpalette"),
        .init(title: "variableValue drives animated fills.", detail: "Pass a Double from 0.0 to 1.0 to Image(systemName:variableValue:) for symbols like wifi, speaker.wave, and battery. The value controls the fill level.", symbol: "chart.bar.fill"),
        .init(title: "Palette needs foregroundStyle with multiple values.", detail: "Use .foregroundStyle(primary, secondary) or .foregroundStyle(primary, secondary, tertiary) to paint each layer. The number of arguments maps to symbol layers.", symbol: "circle.hexagongrid"),
        .init(title: "Not all symbols support all modes.", detail: "Multicolor requires the symbol to have color metadata. If a mode is unsupported, it falls back to monochrome. Test with variableValue to confirm the symbol supports it.", symbol: "questionmark.circle"),
    ]

    @ViewBuilder private var notesContent: some View {
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

private struct SRCard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minWidth: 120, minHeight: 80, alignment: .center)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct SRVariant<C: View>: View {
    let title: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    SymbolRenderingPage().frame(width: 1000, height: 1100)
}
