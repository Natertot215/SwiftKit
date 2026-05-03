import SwiftUI

// SwiftUI `Glass/interactive(_:)` reference page.
// Source: Documentation/SwiftUI/view-styles/interactive(_:).md
// macOS 26.0+. Returns a copy of the Glass structure configured to be
// interactive — material reacts to hover / press states on controls.

private let demoFrameWidth: CGFloat = 280
private let demoFrameHeight: CGFloat = 140

struct GlassInteractivePage: View {
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
            Text("Glass/interactive(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Returns a copy of the structure configured to be interactive.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/interactive(_:).md · macOS 26.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        GICard(title: "Default — non-interactive", api: ".glassEffect(.regular)") {
            sampleControl
                .padding(.horizontal, 18).padding(.vertical, 12)
                .glassEffect(.regular)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Side-by-side: non-interactive vs interactive Glass on the same view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            HStack(alignment: .top, spacing: 24) {
                GICard(title: ".regular", api: ".glassEffect(.regular)") {
                    sampleControl
                        .padding(.horizontal, 18).padding(.vertical, 12)
                        .glassEffect(.regular)
                }
                GICard(title: ".regular.interactive()", api: ".glassEffect(.regular.interactive())") {
                    sampleControl
                        .padding(.horizontal, 18).padding(.vertical, 12)
                        .glassEffect(.regular.interactive())
                }
                GICard(title: ".regular.interactive(false)", api: ".glassEffect(.regular.interactive(false))") {
                    sampleControl
                        .padding(.horizontal, 18).padding(.vertical, 12)
                        .glassEffect(.regular.interactive(false))
                }
            }
        }
    }

    private var sampleControl: some View {
        Label("Hover / press me", systemImage: "hand.point.up.left.fill")
            .font(.headline)
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Wrapping a Button — interactive Glass complements .buttonStyle(.glass)")
                    .font(.headline)
                Text("If you wrap a Button in .glassEffect(.regular.interactive()) you double up the Liquid Glass response. Usually you want either .buttonStyle(.glass) OR a custom .glassEffect — not both on the same control.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                HStack(alignment: .top, spacing: 24) {
                    GICard(title: "Button + .buttonStyle(.glass)", api: ".buttonStyle(.glass)") {
                        Button("Glass Button") { }
                            .buttonStyle(.glass)
                    }
                    GICard(title: "Button + .glassEffect(.regular.interactive())", api: ".glassEffect(.regular.interactive())") {
                        Button("Glass Effect Button") { }
                            .buttonStyle(.plain)
                            .padding(.horizontal, 16).padding(.vertical, 8)
                            .glassEffect(.regular.interactive())
                    }
                }
            }
        }
    }

    private struct GINote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [GINote] = [
        .init(title: "Use on Glass values, not on the modifier.",
              detail: ".interactive() is a method on Glass that returns a modified Glass. You then pass that Glass into .glassEffect(_:in:).",
              symbol: "function"),
        .init(title: "Defaults to true.",
              detail: "Glass.regular.interactive() is equivalent to Glass.regular.interactive(true). Pass false explicitly to opt out — useful when receiving a Glass parameter you want to neutralize.",
              symbol: "switch.2"),
        .init(title: "Reacts to hover and press, not just click.",
              detail: "On macOS the interactive material brightens on hover and dips under press, providing a tactile confirmation similar to Liquid Glass button styles.",
              symbol: "hand.point.up.left"),
        .init(title: "Don't double up with .buttonStyle(.glass).",
              detail: "If a Button uses .buttonStyle(.glass) it already has interactive Liquid Glass. Wrapping it in .glassEffect(.regular.interactive()) stacks two materials — usually visually noisy.",
              symbol: "exclamationmark.triangle"),
        .init(title: "macOS 26.0+ only.",
              detail: "Like the rest of the Liquid Glass family. SwiftKit's macOS-only catalog uses it directly without @available guards.",
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

private struct GICard<Content: View>: View {
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
                    LinearGradient(colors: [.teal.opacity(0.6), .indigo.opacity(0.6)],
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
    GlassInteractivePage()
        .frame(width: 1200, height: 900)
}
