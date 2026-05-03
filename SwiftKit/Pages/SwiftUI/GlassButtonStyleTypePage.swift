import SwiftUI

// SwiftUI `GlassButtonStyle` reference page.
// Source: Documentation/SwiftUI/view-styles/glassbuttonstyle.md
// macOS 26.0+. PrimitiveButtonStyle conformer that applies Liquid Glass border
// artwork. Use via .buttonStyle(.glass) literal — same conformer.

private let demoFrameWidth: CGFloat = 280
private let demoFrameHeight: CGFloat = 100

struct GlassButtonStyleTypePage: View {
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
            Text("GlassButtonStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A button style that applies glass border artwork based on the button's context.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/glassbuttonstyle.md · macOS 26.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        GBSCard(title: ".buttonStyle(.glass)", api: ".buttonStyle(.glass)") {
            HStack(spacing: 8) {
                Button("Save") { }
                Button("Cancel") { }
            }
            .buttonStyle(.glass)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("GlassButtonStyle is a PrimitiveButtonStyle. Use the .glass literal — equivalent to GlassButtonStyle().")
                .font(.callout)
                .foregroundStyle(.secondary)
            HStack(alignment: .top, spacing: 24) {
                GBSCard(title: ".glass — default tint", api: ".buttonStyle(.glass)") {
                    HStack(spacing: 8) {
                        Button("OK") { }
                        Button("Skip") { }
                    }
                    .buttonStyle(.glass)
                }
                GBSCard(title: ".glass + .tint(.purple)", api: ".buttonStyle(.glass).tint(.purple)") {
                    HStack(spacing: 8) {
                        Button("OK") { }
                        Button("Skip") { }
                    }
                    .buttonStyle(.glass)
                    .tint(.purple)
                }
                GBSCard(title: ".glass + role: .destructive", api: "Button(role: .destructive) { … }") {
                    HStack(spacing: 8) {
                        Button("Delete", role: .destructive) { }
                        Button("Cancel", role: .cancel) { }
                    }
                    .buttonStyle(.glass)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Disabled state propagates through the Liquid Glass artwork")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    GBSCard(title: ".glass + enabled", api: "Button(\"Run\") { }.buttonStyle(.glass)") {
                        Button("Run") { }.buttonStyle(.glass)
                    }
                    GBSCard(title: ".glass + .disabled(true)", api: ".disabled(true)") {
                        Button("Run") { }.buttonStyle(.glass).disabled(true)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("controlSize variants")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    GBSCard(title: ".controlSize(.small)", api: ".controlSize(.small)") {
                        Button("Small") { }.buttonStyle(.glass).controlSize(.small)
                    }
                    GBSCard(title: ".controlSize(.regular)", api: ".controlSize(.regular)") {
                        Button("Regular") { }.buttonStyle(.glass).controlSize(.regular)
                    }
                    GBSCard(title: ".controlSize(.large)", api: ".controlSize(.large)") {
                        Button("Large") { }.buttonStyle(.glass).controlSize(.large)
                    }
                }
            }
        }
    }

    private struct GBSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [GBSNote] = [
        .init(title: "Use the .glass literal, not GlassButtonStyle() directly.",
              detail: "PrimitiveButtonStyle.glass returns a GlassButtonStyle. Both spellings work; .glass is shorter and matches the surrounding system style literals.",
              symbol: "function"),
        .init(title: "Pair with GlassEffectContainer when stacking many.",
              detail: "Multiple .glass buttons each render their own Liquid Glass pass. Wrapping a row of them in GlassEffectContainer fuses the materials and improves perf.",
              symbol: "rectangle.stack"),
        .init(title: "Tint colors the glass border accent.",
              detail: "Apply .tint(_:) anywhere up the tree. The Liquid Glass artwork's edge highlight picks up the tint.",
              symbol: "paintpalette"),
        .init(title: "Composes with Toggle/Menu via .toggleStyle(.button) / .menuStyle(.button).",
              detail: "Once a Toggle or Menu adopts the .button style, the surrounding .buttonStyle(.glass) renders them with Liquid Glass too.",
              symbol: "rectangle.connected.to.line.below"),
        .init(title: "macOS 26.0+ only.",
              detail: "GlassButtonStyle ships in macOS 26 alongside the rest of the Liquid Glass family.",
              symbol: "calendar")
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

private struct GBSCard<Content: View>: View {
    let title: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight, alignment: .center)
                .background(
                    LinearGradient(colors: [.indigo.opacity(0.5), .teal.opacity(0.5)],
                                   startPoint: .topLeading, endPoint: .bottomTrailing),
                    in: RoundedRectangle(cornerRadius: 8)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

#Preview {
    GlassButtonStyleTypePage()
        .frame(width: 1200, height: 1000)
}
