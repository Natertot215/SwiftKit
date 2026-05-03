import SwiftUI

// SwiftUI `GlassEffectContainer` reference page.
// Source: Documentation/SwiftUI/view-styles/glasseffectcontainer.md
// macOS 26.0+. Combines multiple Liquid Glass shapes into a single
// rendered shape that can morph into one another. Init: init(spacing:content:).

private let demoFrameWidth: CGFloat = 360
private let demoFrameHeight: CGFloat = 200

struct GlassEffectContainerPage: View {
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
            Text("GlassEffectContainer")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that combines multiple Liquid Glass shapes into a single shape that can morph individual shapes into one another.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/glasseffectcontainer.md · macOS 26.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        GECCard(title: "Default spacing", api: "GlassEffectContainer { … }") {
            GlassEffectContainer {
                HStack(spacing: 24) {
                    glassPill("First")
                    glassPill("Second")
                }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Spacing controls how soon adjacent shapes blend into one another. Larger spacing = earlier blending as shapes approach.")
                .font(.callout)
                .foregroundStyle(.secondary)
            HStack(alignment: .top, spacing: 24) {
                GECCard(title: "spacing: 0", api: "GlassEffectContainer(spacing: 0) { … }") {
                    GlassEffectContainer(spacing: 0) {
                        HStack(spacing: 8) {
                            glassPill("A")
                            glassPill("B")
                        }
                    }
                }
                GECCard(title: "spacing: 12", api: "GlassEffectContainer(spacing: 12) { … }") {
                    GlassEffectContainer(spacing: 12) {
                        HStack(spacing: 8) {
                            glassPill("A")
                            glassPill("B")
                        }
                    }
                }
                GECCard(title: "spacing: 32", api: "GlassEffectContainer(spacing: 32) { … }") {
                    GlassEffectContainer(spacing: 32) {
                        HStack(spacing: 8) {
                            glassPill("A")
                            glassPill("B")
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Why a container at all? — performance + morphing")
                    .font(.headline)
                Text("Two siblings with .glassEffect() each render their own Liquid Glass pass. Wrapping them in a GlassEffectContainer fuses them: one render pass, one shape that morphs as the children move.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                HStack(alignment: .top, spacing: 24) {
                    GECCard(title: "Without container", api: "Two siblings, each with .glassEffect()") {
                        HStack(spacing: 12) {
                            glassPill("X")
                            glassPill("Y")
                        }
                    }
                    GECCard(title: "Inside container", api: "GlassEffectContainer { sibling glassEffects }") {
                        GlassEffectContainer {
                            HStack(spacing: 12) {
                                glassPill("X")
                                glassPill("Y")
                            }
                        }
                    }
                }
            }
        }
    }

    private func glassPill(_ text: String) -> some View {
        Text(text)
            .font(.headline)
            .padding(.horizontal, 14).padding(.vertical, 8)
            .glassEffect()
    }

    private struct GECNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [GECNote] = [
        .init(title: "Container fuses sibling .glassEffect() shapes.",
              detail: "Without a container, each sibling renders its own pass. Inside a container the system unifies them into a single shape that can morph fluidly.",
              symbol: "rectangle.stack"),
        .init(title: "Spacing controls morph onset distance.",
              detail: "Higher spacing means shapes start blending earlier as they approach each other. Default spacing is tuned for typical UI clusters.",
              symbol: "arrow.left.and.right"),
        .init(title: "Performance win: one Liquid Glass pass instead of N.",
              detail: "Liquid Glass is GPU-expensive. Coalescing multiple shapes into one container reduces material rendering cost — important for animated clusters.",
              symbol: "speedometer"),
        .init(title: "Init signature: GlassEffectContainer(spacing:content:).",
              detail: "The spacing parameter is optional; the content closure is the only required argument. Children should themselves apply .glassEffect() to participate.",
              symbol: "chevron.left.forwardslash.chevron.right"),
        .init(title: "macOS 26.0+ only.",
              detail: "Whole Liquid Glass surface is macOS 26+. SwiftKit targets macOS 26 exclusively, no @available guards needed.",
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

private struct GECCard<Content: View>: View {
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
                    LinearGradient(colors: [.purple.opacity(0.55), .blue.opacity(0.55)],
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
    GlassEffectContainerPage()
        .frame(width: 1300, height: 1000)
}
