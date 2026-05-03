import SwiftUI

// SwiftUI `DefaultGlassEffectShape` reference page.
// Source: Documentation/SwiftUI/view-styles/defaultglasseffectshape.md
// macOS 26.0+. The default shape SwiftUI uses for .glassEffect(_:in:) — a
// Capsule. You don't normally instantiate this; SwiftUI passes it as the
// default `in:` parameter.

private let demoFrameWidth: CGFloat = 280
private let demoFrameHeight: CGFloat = 140

struct DefaultGlassEffectShapePage: View {
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
            Text("DefaultGlassEffectShape")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The default shape applied by glass effects, a capsule.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/defaultglasseffectshape.md · macOS 26.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DGESCard(title: "Implicit DefaultGlassEffectShape", api: ".glassEffect()  // shape: DefaultGlassEffectShape()") {
            Text("Capsule by default")
                .padding(.horizontal, 14).padding(.vertical, 10)
                .glassEffect()
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("DefaultGlassEffectShape is a Capsule — visible side-by-side with explicit shapes.")
                .font(.callout)
                .foregroundStyle(.secondary)
            HStack(alignment: .top, spacing: 24) {
                DGESCard(title: "Default (Capsule)", api: ".glassEffect(.regular, in: DefaultGlassEffectShape())") {
                    Text("Capsule")
                        .padding(.horizontal, 14).padding(.vertical, 10)
                        .glassEffect(.regular, in: DefaultGlassEffectShape())
                }
                DGESCard(title: "Explicit Capsule (same)", api: ".glassEffect(.regular, in: Capsule())") {
                    Text("Capsule")
                        .padding(.horizontal, 14).padding(.vertical, 10)
                        .glassEffect(.regular, in: Capsule())
                }
                DGESCard(title: "RoundedRectangle (different)", api: ".glassEffect(.regular, in: RoundedRectangle(cornerRadius: 12))") {
                    Text("Rounded")
                        .padding(.horizontal, 14).padding(.vertical, 10)
                        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 12))
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Conformances")
                .font(.headline)
            DGESCodeBlock(text:
                """
                struct DefaultGlassEffectShape : Animatable, Sendable, Shape, View {
                    init()
                }
                """)
            Text("Implements Shape so the system can clip the Liquid Glass material to its outline. Implements View so previews can render it standalone (rare — you typically pass it via the `in:` parameter).")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    private struct DGESNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [DGESNote] = [
        .init(title: "You rarely instantiate it directly.",
              detail: "SwiftUI inserts DefaultGlassEffectShape() as the default `in:` value of .glassEffect(_:in:). Documenting it here for completeness — most call sites just rely on the default.",
              symbol: "function"),
        .init(title: "It's literally a Capsule.",
              detail: "Same shape as the SwiftUI Capsule type. The distinction is just type identity — DefaultGlassEffectShape is the canonical default the framework references.",
              symbol: "capsule"),
        .init(title: "Override by passing any Shape conformer.",
              detail: "RoundedRectangle, Circle, custom Shape — all accepted. The Liquid Glass material clips to the shape's outline.",
              symbol: "shape"),
        .init(title: "Animatable conformance enables shape morphing.",
              detail: "When the shape's parameters change (e.g. RoundedRectangle's cornerRadius animates), the Liquid Glass clip animates too. Important for GlassEffectContainer interactions.",
              symbol: "wand.and.rays"),
        .init(title: "macOS 26.0+ only.",
              detail: "Like the rest of the Liquid Glass family. SwiftKit targets macOS 26 exclusively.",
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

private struct DGESCard<Content: View>: View {
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
                    LinearGradient(colors: [.orange.opacity(0.55), .pink.opacity(0.55)],
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

private struct DGESCodeBlock: View {
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
    DefaultGlassEffectShapePage()
        .frame(width: 1200, height: 900)
}
