import SwiftUI

// SwiftUI `Applying Liquid Glass to custom views` (article).
// Source: Documentation/SwiftUI/view-styles/applying-liquid-glass-to-custom-views.md
// macOS 26.0+. Article-style reference — not a single API. Summarizes the
// canonical pattern for adding Liquid Glass to your own views.

struct ApplyingLiquidGlassPage: View {
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
            Text("Applying Liquid Glass to custom views")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Article — Apple's guide to adopting the Liquid Glass material in custom SwiftUI views.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/applying-liquid-glass-to-custom-views.md · macOS 26.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        ALGSection(title: "Step 1 — Apply .glassEffect()", api: ".glassEffect()") {
            ALGCodeBlock(text:
                """
                Text("Hello, World!")
                    .font(.title)
                    .padding()
                    .glassEffect()
                """)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            ALGSection(title: "Step 2 — Customize the shape", api: ".glassEffect(_:in:)") {
                ALGCodeBlock(text:
                    """
                    Text("Hello")
                        .padding()
                        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 16))
                    """)
            }

            ALGSection(title: "Step 3 — Make it interactive", api: "Glass.interactive()") {
                ALGCodeBlock(text:
                    """
                    Button("Tap") { }
                        .padding(.horizontal, 16).padding(.vertical, 8)
                        .glassEffect(.regular.interactive())
                    """)
            }

            ALGSection(title: "Step 4 — Combine with GlassEffectContainer for clusters", api: "GlassEffectContainer { … }") {
                ALGCodeBlock(text:
                    """
                    GlassEffectContainer {
                        HStack {
                            Text("A").padding().glassEffect()
                            Text("B").padding().glassEffect()
                            Text("C").padding().glassEffect()
                        }
                    }
                    """)
            }

            ALGSection(title: "Step 5 — Animate appear/disappear with .glassEffectTransition", api: ".glassEffectTransition(_:)") {
                ALGCodeBlock(text:
                    """
                    if isShowing {
                        Text("Hello")
                            .padding()
                            .glassEffect()
                            .glassEffectTransition(.materialize)
                    }
                    """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Worked example — full Liquid Glass card")
                .font(.headline)
            ALGCodeBlock(text:
                """
                GlassEffectContainer(spacing: 12) {
                    HStack(spacing: 12) {
                        Image(systemName: "drop.halffull")
                            .padding(12)
                            .glassEffect(.regular, in: Circle())

                        VStack(alignment: .leading) {
                            Text("Liquid Glass")
                                .font(.headline)
                            Text("macOS 26 material")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .padding(12)
                        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 14))

                        Spacer()

                        Button("Try") { }
                            .buttonStyle(.glassProminent)
                    }
                    .padding(12)
                }
                """)
        }
    }

    private struct ALGNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ALGNote] = [
        .init(title: ".glassEffect() defaults are good — start there.",
              detail: "Glass.regular + Capsule covers most pill-shaped controls. Override the shape only when the view's silhouette demands it.",
              symbol: "drop.halffull"),
        .init(title: "Cluster siblings inside GlassEffectContainer.",
              detail: "Don't pay for N Liquid Glass passes when one container can fuse them. Apple's Landmarks sample shows this pattern repeatedly.",
              symbol: "rectangle.stack"),
        .init(title: "Use button styles for buttons; .glassEffect for everything else.",
              detail: ".buttonStyle(.glass) and .glassProminent already wrap the primitives properly. .glassEffect is for inert surfaces (cards, badges, tooltips).",
              symbol: "rectangle.connected.to.line.below"),
        .init(title: "Animate state changes inside withAnimation { }.",
              detail: ".glassEffectTransition(.materialize) only fires when the insertion/removal happens inside an animated update.",
              symbol: "wand.and.rays"),
        .init(title: "See LandmarksLiquidGlassPage for the canonical sample app.",
              detail: "Apple's Landmarks: Building an app with Liquid Glass walks through every API in context. SwiftKit links it as the second article alongside this one.",
              symbol: "book")
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

private struct ALGSection<Content: View>: View {
    let title: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
            APICallout(api)
        }
    }
}

private struct ALGCodeBlock: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.callout)
            .fontDesign(.monospaced)
            .textSelection(.enabled)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }
}

#Preview {
    ApplyingLiquidGlassPage()
        .frame(width: 1200, height: 1300)
}
