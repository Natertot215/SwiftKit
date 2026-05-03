import SwiftUI

// SwiftUI `View/windowToolbarFullScreenVisibility(_:)` + `WindowToolbarFullScreenVisibility` reference page.
// Sources:
//   Documentation/SwiftUI/windows/windowtoolbarfullscreenvisibility(_:).md
//   Documentation/SwiftUI/windows/windowtoolbarfullscreenvisibility.md
// macOS 15.0+. Three values: .automatic, .visible, .onHover.

struct WindowToolbarFullScreenVisibilityPage: View {
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
            Text("View/windowToolbarFullScreenVisibility(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Configures how the window toolbar appears when the window enters full-screen mode.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/windowtoolbarfullscreenvisibility(_:).md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: ".windowToolbarFullScreenVisibility(.automatic)",
            code: """
            ContentView()
                .toolbar { /* items */ }
                .windowToolbarFullScreenVisibility(.automatic)
            """,
            note: "Default \u{2014} the toolbar is visible at the top of the display while the window is in full screen."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".automatic \u{2014} system default (visible)") {
                WindowSnippet(
                    api: ".windowToolbarFullScreenVisibility(.automatic)",
                    code: """
                    .windowToolbarFullScreenVisibility(.automatic)
                    """,
                    note: "Equivalent to omitting the modifier. Toolbar shows at the display top, above the window content."
                )
            }

            VariantBlock(title: ".visible \u{2014} always shown") {
                WindowSnippet(
                    api: ".windowToolbarFullScreenVisibility(.visible)",
                    code: """
                    .windowToolbarFullScreenVisibility(.visible)
                    """,
                    note: "Same default behavior, made explicit."
                )
            }

            VariantBlock(title: ".onHover \u{2014} hidden until the cursor reaches the menu-bar zone") {
                WindowSnippet(
                    api: ".windowToolbarFullScreenVisibility(.onHover)",
                    code: """
                    struct RootView: View {
                        var body: some View {
                            ContentView()
                                .toolbar { /* items */ }
                                .windowToolbarFullScreenVisibility(.onHover)
                        }
                    }
                    """,
                    note: "Reveals on cursor proximity. Best for media-viewing surfaces where toolbar chrome competes with content."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "View modifier \u{2014} attach to the window's content, not the Scene.",
                "Only takes effect once the window is in full-screen mode \u{2014} normal mode is unaffected.",
                ".onHover hides the toolbar until the cursor approaches the menu-bar area; consistent with how the system menu bar reveals.",
                "Pair with .toolbar { \u{2026} } so there's a toolbar to govern in the first place.",
                "Pre-macOS-15 apps used AppKit (NSToolbar.fullScreenAccessoryView, presentation options) for the same effect."
            ])
        }
    }

    // MARK: Notes

    private struct WTFSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [WTFSNote] = [
        .init(title: "Three values, one knob.",
              detail: ".automatic and .visible behave the same; .onHover is the meaningful alternative for full-screen toolbar suppression. The enum is conformed to Sendable for thread-safe storage.",
              symbol: "switch.2"),
        .init(title: "Use .onHover for media-first surfaces.",
              detail: "Video players, presentation viewers, image-review apps benefit from a reveal-on-demand toolbar. .visible is right for productivity apps where chrome should always be reachable.",
              symbol: "play.rectangle"),
        .init(title: "Distinct from .toolbar(.hidden).",
              detail: ".toolbar(.hidden, for: .windowToolbar) hides the toolbar in all modes. windowToolbarFullScreenVisibility only affects full-screen presentation \u{2014} normal-mode chrome stays put.",
              symbol: "rectangle.dashed"),
        .init(title: "macOS 15+ \u{2014} earlier targets need AppKit.",
              detail: "Pre-15 macOS used NSWindow.toolbar combined with NSApplication presentation options. SwiftUI's modifier subsumes the most common case starting macOS 15.",
              symbol: "calendar.badge.exclamationmark")
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
    WindowToolbarFullScreenVisibilityPage()
        .frame(width: 1100, height: 800)
}
