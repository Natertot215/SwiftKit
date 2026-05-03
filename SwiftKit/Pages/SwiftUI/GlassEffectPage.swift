import SwiftUI

// SwiftUI `View/glassEffect(_:in:)` reference page.
// Source: Documentation/SwiftUI/view-styles/glasseffect(_:in:).md
// macOS 26.0+. Applies the Liquid Glass material to a view in the given shape.
// Defaults: Glass.regular variant, DefaultGlassEffectShape() (a Capsule).

private let demoFrameWidth: CGFloat = 280
private let demoFrameHeight: CGFloat = 140

struct GlassEffectPage: View {
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
            Text("View/glassEffect(_:in:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Applies the Liquid Glass effect to a view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/glasseffect(_:in:).md · macOS 26.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        GECard(title: ".glassEffect()", api: ".glassEffect()") {
            sampleContent
                .padding(.horizontal, 16).padding(.vertical, 12)
                .glassEffect()
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Glass variants and shape parameter combinations.")
                .font(.callout)
                .foregroundStyle(.secondary)
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
            ], alignment: .leading, spacing: 24) {
                GECard(title: ".regular (default) + Capsule", api: ".glassEffect()") {
                    sampleContent
                        .padding(.horizontal, 16).padding(.vertical, 12)
                        .glassEffect()
                }
                GECard(title: ".regular + RoundedRectangle", api: ".glassEffect(.regular, in: RoundedRectangle(cornerRadius: 16))") {
                    sampleContent
                        .padding(.horizontal, 16).padding(.vertical, 12)
                        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 16))
                }
                GECard(title: ".regular + Circle", api: ".glassEffect(.regular, in: Circle())") {
                    Image(systemName: "sparkle")
                        .font(.system(size: 28))
                        .padding(20)
                        .glassEffect(.regular, in: Circle())
                }
                GECard(title: ".regular + .interactive()", api: ".glassEffect(.regular.interactive())") {
                    sampleContent
                        .padding(.horizontal, 16).padding(.vertical, 12)
                        .glassEffect(.regular.interactive())
                }
            }
        }
    }

    private var sampleContent: some View {
        Label("Liquid Glass", systemImage: "drop.halffull")
            .font(.headline)
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Tinted glass via .tint(_:)")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    GECard(title: ".tint(.purple)", api: ".tint(.purple) + .glassEffect()") {
                        sampleContent
                            .padding(.horizontal, 16).padding(.vertical, 12)
                            .glassEffect()
                            .tint(.purple)
                    }
                    GECard(title: ".tint(.green)", api: ".tint(.green) + .glassEffect()") {
                        sampleContent
                            .padding(.horizontal, 16).padding(.vertical, 12)
                            .glassEffect()
                            .tint(.green)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Inside a colored backdrop — Liquid Glass refracts the layer below it")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    GECard(title: "Solid backdrop", api: "background overlay + .glassEffect()") {
                        ZStack {
                            LinearGradient(colors: [.blue, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)
                            sampleContent
                                .padding(.horizontal, 16).padding(.vertical, 12)
                                .glassEffect()
                        }
                    }
                }
            }
        }
    }

    private struct GENote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [GENote] = [
        .init(title: "Defaults: Glass.regular + Capsule.",
              detail: "Calling .glassEffect() with no arguments uses Glass.regular and DefaultGlassEffectShape (a Capsule). Pass a shape to change the boundary.",
              symbol: "capsule"),
        .init(title: "Pair with GlassEffectContainer when stacking multiple shapes.",
              detail: "Two siblings with .glassEffect() will both render their own Liquid Glass passes — wrap in GlassEffectContainer to fuse them so they morph into one another and render as a single material pass.",
              symbol: "rectangle.stack"),
        .init(title: "Glass.regular.interactive() responds to hover / press.",
              detail: "Use .interactive(true) on the Glass when the underlying view is a control. The material reacts subtly to user interaction.",
              symbol: "hand.point.up.left"),
        .init(title: "macOS 26.0+ only.",
              detail: "Liquid Glass APIs all gate on macOS 26. SwiftKit's macOS-only target means no @available shims; the modifier is always available in this catalog.",
              symbol: "calendar"),
        .init(title: "Anchored to the view's bounds — applies to the framed area including padding.",
              detail: "If you want a tighter shape, apply padding before .glassEffect; if you want it looser, after. The material always fills the modified frame.",
              symbol: "rectangle.dashed")
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

private struct GECard<Content: View>: View {
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
                    LinearGradient(colors: [.indigo.opacity(0.5), .pink.opacity(0.5)],
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
    GlassEffectPage()
        .frame(width: 1200, height: 1000)
}
