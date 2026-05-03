import SwiftUI

// SwiftUI `WindowLayoutRoot` reference page.
// Source: Documentation/SwiftUI/windows/windowlayoutroot.md
// macOS 15.0+ / visionOS 2.0+. A proxy for a window's root content,
// passed into the closure of .defaultWindowPlacement / .windowIdealPlacement.

struct WindowLayoutRootPage: View {
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

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("WindowLayoutRoot")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A proxy for a window's root content. Used inside placement closures to ask the content what size it would take.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/windowlayoutroot.md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: "content.sizeThatFits(.unspecified) inside .defaultWindowPlacement",
            code: """
            .defaultWindowPlacement { content, context in
                let displayBounds = context.defaultDisplay.visibleRect
                let size = content.sizeThatFits(.unspecified)
                let position = CGPoint(
                    x: displayBounds.midX - size.width / 2,
                    y: displayBounds.maxY - size.height - 140
                )
                return WindowPlacement(position: position, size: size)
            }
            """,
            note: "content is a WindowLayoutRoot \u{2014} call .sizeThatFits(_:) on it to ask the root view how large it wants to be."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "sizeThatFits(_:) \u{2014} the only documented method") {
                WindowSnippet(
                    api: "func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize",
                    code: """
                    let unspecified = content.sizeThatFits(.unspecified)
                    let constrainedHeight = content.sizeThatFits(
                        ProposedViewSize(width: nil, height: 600)
                    )
                    let constrainedWidth = content.sizeThatFits(
                        ProposedViewSize(width: 800, height: nil)
                    )
                    """,
                    note: "Pass .unspecified for the content's natural size, or constrain one axis to ask \u{201C}what's the other axis if I cap this one?\u{201D}"
                )
            }

            VariantBlock(title: "Used inside windowIdealPlacement") {
                WindowSnippet(
                    api: ".windowIdealPlacement { content, context in \u{2026} }",
                    code: """
                    WindowGroup { ContentView() }
                        .windowIdealPlacement { content, context in
                            let displayBounds = context.defaultDisplay.visibleRect
                            let proposal = ProposedViewSize(
                                width: nil, height: displayBounds.height)
                            let contentSize = content.sizeThatFits(proposal)
                            return .init(
                                width: contentSize.width,
                                height: contentSize.height
                            )
                        }
                    """,
                    note: "Same pattern \u{2014} ask the content how tall it wants to be at full screen height, then return that as the zoom placement."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "Only constructible by SwiftUI \u{2014} you receive it as a closure parameter, never instantiate it.",
                "Two scene modifiers receive it: .defaultWindowPlacement(_:) and .windowIdealPlacement(_:).",
                "Equally available on macOS 15+ and visionOS 2+.",
                "Pair with WindowPlacementContext (the second closure parameter) for screen and window awareness.",
                "Combine sizeThatFits results with DisplayProxy.visibleRect to position windows relative to the screen."
            ])
        }
    }

    // MARK: Notes

    private struct WLRNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [WLRNote] = [
        .init(title: "It's a proxy, not the content itself.",
              detail: "WindowLayoutRoot doesn't expose the root view \u{2014} only its layout behavior via sizeThatFits(_:). You can't read or mutate the view from this type.",
              symbol: "scope"),
        .init(title: "Lives inside the closure; don't capture across closure invocations.",
              detail: "The framework passes a fresh WindowLayoutRoot each time it asks for placement. Caching one across invocations is undefined behavior.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Pairs with WindowPlacementContext.",
              detail: "The closure signature is (WindowLayoutRoot, WindowPlacementContext). Use the layout root for content size, the context for display bounds and the list of other open windows.",
              symbol: "rectangle.connected.to.line.below"),
        .init(title: "ProposedViewSize lets you constrain queries.",
              detail: "Pass .unspecified for the natural size, or use ProposedViewSize(width:nil, height: 600) to ask \u{201C}how wide if I cap height at 600?\u{201D} \u{2014} matches the SwiftUI layout protocol.",
              symbol: "ruler")
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

// MARK: - Reusable demo helpers (page-local)

private struct WindowSnippet: View {
    let api: String
    let code: String
    var note: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(code)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .textSelection(.enabled)
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
            if let note {
                Text(note)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

private struct VariantBlock<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
        }
    }
}

private struct BehaviorList: View {
    let items: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(items, id: \.self) { item in
                Label {
                    Text(item)
                        .font(.callout)
                        .foregroundStyle(.primary)
                } icon: {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(.tint)
                }
            }
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }
}

#Preview {
    WindowLayoutRootPage()
        .frame(width: 1100, height: 800)
}
