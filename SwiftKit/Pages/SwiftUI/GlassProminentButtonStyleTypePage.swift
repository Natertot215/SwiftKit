import SwiftUI

// SwiftUI `GlassProminentButtonStyle` reference page.
// Source: Documentation/SwiftUI/view-styles/glassprominentbuttonstyle.md
// macOS 26.0+. PrimitiveButtonStyle conformer for tinted, prominent Liquid
// Glass actions. Use via .buttonStyle(.glassProminent) literal.

private let demoFrameWidth: CGFloat = 280
private let demoFrameHeight: CGFloat = 100

struct GlassProminentButtonStyleTypePage: View {
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
            Text("GlassProminentButtonStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A prominent button style with a tinted Liquid Glass background. Use it for the primary action in a context.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/glassprominentbuttonstyle.md · macOS 26.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        GPBSCard(title: ".buttonStyle(.glassProminent)", api: ".buttonStyle(.glassProminent)") {
            Button("Confirm") { }
                .buttonStyle(.glassProminent)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Use .glassProminent for the primary action — typically one per context. Pair with .glass for secondary actions.")
                .font(.callout)
                .foregroundStyle(.secondary)
            HStack(alignment: .top, spacing: 24) {
                GPBSCard(title: ".glassProminent — default tint", api: ".buttonStyle(.glassProminent)") {
                    Button("Continue") { }.buttonStyle(.glassProminent)
                }
                GPBSCard(title: ".glassProminent + .tint(.green)", api: ".tint(.green)") {
                    Button("Confirm") { }.buttonStyle(.glassProminent).tint(.green)
                }
                GPBSCard(title: ".glassProminent + .tint(.red) + role", api: "role: .destructive") {
                    Button("Delete", role: .destructive) { }.buttonStyle(.glassProminent)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Pairing primary + secondary actions in a button row")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    GPBSCard(title: ".glassProminent + .glass", api: "primary: .glassProminent · secondary: .glass") {
                        HStack(spacing: 8) {
                            Button("Cancel") { }.buttonStyle(.glass)
                            Button("Confirm") { }.buttonStyle(.glassProminent)
                        }
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Disabled state")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    GPBSCard(title: "enabled", api: "Button(\"Submit\") { }.buttonStyle(.glassProminent)") {
                        Button("Submit") { }.buttonStyle(.glassProminent)
                    }
                    GPBSCard(title: "disabled", api: ".disabled(true)") {
                        Button("Submit") { }.buttonStyle(.glassProminent).disabled(true)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("controlSize variants")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    GPBSCard(title: ".controlSize(.small)", api: ".controlSize(.small)") {
                        Button("Small") { }.buttonStyle(.glassProminent).controlSize(.small)
                    }
                    GPBSCard(title: ".controlSize(.regular)", api: ".controlSize(.regular)") {
                        Button("Regular") { }.buttonStyle(.glassProminent).controlSize(.regular)
                    }
                    GPBSCard(title: ".controlSize(.large)", api: ".controlSize(.large)") {
                        Button("Large") { }.buttonStyle(.glassProminent).controlSize(.large)
                    }
                }
            }
        }
    }

    private struct GPBSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [GPBSNote] = [
        .init(title: "Use one .glassProminent per context.",
              detail: "Like .borderedProminent, .glassProminent telegraphs THE primary action. More than one in a single context dilutes hierarchy.",
              symbol: "1.circle"),
        .init(title: "Pair with .glass for secondary actions.",
              detail: "The canonical Liquid Glass button row: secondary actions in .glass, primary in .glassProminent. Both styles harmonize visually.",
              symbol: "rectangle.connected.to.line.below"),
        .init(title: "Tint colors the prominent background.",
              detail: "Apply .tint(_:) for non-default colors. Combined with role: .destructive the system prefers a red palette regardless of explicit tint.",
              symbol: "paintpalette"),
        .init(title: "Same Liquid Glass material as GlassButtonStyle, just tinted.",
              detail: "Both styles are Liquid Glass conformers; .glassProminent fills the shape with tint while .glass shows only the border artwork over the underlying view.",
              symbol: "drop.halffull"),
        .init(title: "macOS 26.0+ only.",
              detail: "Whole Liquid Glass family is macOS 26+. SwiftKit targets macOS 26 exclusively.",
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

private struct GPBSCard<Content: View>: View {
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
                    LinearGradient(colors: [.purple.opacity(0.55), .pink.opacity(0.55)],
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
    GlassProminentButtonStyleTypePage()
        .frame(width: 1200, height: 1100)
}
