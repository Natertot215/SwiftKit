import SwiftUI

// SwiftUI `WindowProxy` reference page.
// Source: Documentation/SwiftUI/windows/windowproxy.md
// Documented availability: visionOS 2.0. The doc captures only id and phase
// instance properties. macOS exposure surfaces through WindowPlacementContext.windows.

struct WindowProxyPage: View {
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
            Text("WindowProxy")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A proxy for an open window. Holds a stable id and the window's current ScenePhase.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/windowproxy.md \u{00b7} visionOS 2.0+ (also exposed via WindowPlacementContext on macOS 15+)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: "context.windows: [WindowProxy]",
            code: """
            .defaultWindowPlacement { content, context in
                if let mainWindow = context.windows.first(
                    where: { $0.id == "main" }
                ) {
                    return WindowPlacement(.trailing(mainWindow))
                }
                return WindowPlacement()
            }
            """,
            note: "On macOS, the most common access path is WindowPlacementContext.windows inside a placement closure."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Documented properties: id and phase") {
                WindowSnippet(
                    api: "WindowProxy.id (String?) and WindowProxy.phase (ScenePhase)",
                    code: """
                    for window in context.windows {
                        print("\\(window.id ?? \"<unidentified>\") \u{2014} phase: \\(window.phase)")
                    }
                    """,
                    note: "id matches the string passed to Window(id:) / WindowGroup(id:). phase is .active, .inactive, or .background \u{2014} the same enum used by @Environment(\\.scenePhase)."
                )
            }

            VariantBlock(title: "Pair with WindowPlacement.Position helpers") {
                WindowSnippet(
                    api: "WindowPlacement(.trailing(windowProxy))",
                    code: """
                    .defaultWindowPlacement { content, context in
                        if let editor = context.windows.first(where: { $0.id == "editor" }) {
                            return WindowPlacement(.trailing(editor))
                        }
                        return WindowPlacement()
                    }
                    """,
                    note: "Use the WindowProxy as the anchor for a relative WindowPlacement.Position case."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "id is the string identifier you passed to Window(id:) / WindowGroup(id:). Optional \u{2014} unidentified scenes report nil.",
                "phase is a ScenePhase value: .active (frontmost), .inactive (visible but not active), .background (minimized / hidden).",
                "WindowProxy is a value type; treat it as a snapshot, not a live reference.",
                "On macOS, you receive WindowProxy values through WindowPlacementContext.windows.",
                "On visionOS 2+, an @Environment(\\.windowProxy) accessor exposes the proxy for the current window directly."
            ])
        }
    }

    // MARK: Notes

    private struct WPxNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [WPxNote] = [
        .init(title: "Two surface properties: id and phase.",
              detail: "Apple documents only WindowProxy.id (String?) and WindowProxy.phase (ScenePhase). Other affordances live on WindowPlacement helpers, not on the proxy itself.",
              symbol: "list.bullet"),
        .init(title: "Use it to anchor relative placements.",
              detail: "WindowPlacement.Position cases like .trailing(_:), .leading(_:), .above(_:), .below(_:) take a WindowProxy. That's the primary practical use of the type on macOS.",
              symbol: "rectangle.split.2x1"),
        .init(title: "Don't store WindowProxy across closure invocations.",
              detail: "Treat the values from context.windows as a per-call snapshot. The framework can rebuild the proxy list at any time; cached values may go stale.",
              symbol: "exclamationmark.triangle"),
        .init(title: "phase mirrors @Environment(\\.scenePhase).",
              detail: "Same enum, same semantics. Use this when you need to read the phase of a different window than the one the view tree is rendering in.",
              symbol: "scope"),
        .init(title: "macOS access is indirect; visionOS exposes it directly.",
              detail: "macOS apps reach WindowProxy via WindowPlacementContext.windows. visionOS 2+ adds @Environment(\\.windowProxy) for the current window. Apple's macOS-only docs flag the type as visionOS-availability \u{2014} the macOS surface comes through context.",
              symbol: "info.circle")
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
    WindowProxyPage()
        .frame(width: 1100, height: 800)
}
