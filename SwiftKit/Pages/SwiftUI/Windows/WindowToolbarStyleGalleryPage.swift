import SwiftUI

// SwiftUI `WindowToolbarStyle` + `Scene/windowToolbarStyle(_:)` reference page.
// Sources:
//   Documentation/SwiftUI/windows/windowtoolbarstyle.md
//   Documentation/SwiftUI/windows/windowtoolbarstyle(_:).md
// macOS 11.0+. Documented styles: .automatic, .expanded,
// .unified / .unified(showsTitle:), .unifiedCompact / .unifiedCompact(showsTitle:).
// SwiftKit itself uses .unified(showsTitle: false).

struct WindowToolbarStyleGalleryPage: View {
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
            Text("WindowToolbarStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Specifies the appearance and behavior of a window's toolbar. Applied with .windowToolbarStyle(_:).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/windowtoolbarstyle.md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: "WindowGroup { \u{2026} }.windowToolbarStyle(.automatic)",
            code: """
            WindowGroup {
                ContentView()
            }
            .windowToolbarStyle(.automatic)
            """,
            note: "Default \u{2014} system picks per platform. On macOS this is typically equivalent to .expanded."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            ForEach(styles, id: \.api) { style in
                VariantBlock(title: style.title) {
                    WindowSnippet(
                        api: ".windowToolbarStyle(\(style.api))",
                        code: """
                        WindowGroup {
                            ContentView()
                        }
                        .windowToolbarStyle(\(style.api))
                        """,
                        note: style.note
                    )
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "How SwiftKit configures its own toolbar") {
                WindowSnippet(
                    api: ".windowToolbarStyle(.unified(showsTitle: false))",
                    code: """
                    Window("SwiftKit", id: "swiftkit-main") {
                        ContentView()
                    }
                    .windowToolbarStyle(.unified(showsTitle: false))
                    """,
                    note: "Unified, single-row toolbar with the title hidden so the sidebar/detail layout reads as one continuous surface."
                )
            }
        }
    }

    // MARK: Notes

    private struct WTSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [WTSNote] = [
        .init(title: "Four conformers; .unified and .unifiedCompact each offer a (showsTitle:) variant.",
              detail: "DefaultWindowToolbarStyle (.automatic), ExpandedWindowToolbarStyle (.expanded), UnifiedWindowToolbarStyle (.unified / .unified(showsTitle:)), UnifiedCompactWindowToolbarStyle (.unifiedCompact / .unifiedCompact(showsTitle:)).",
              symbol: "checklist"),
        .init(title: ".expanded \u{2014} two-row classic Mac chrome.",
              detail: "Title strip on top, toolbar items in their own row underneath. Familiar but takes more vertical space.",
              symbol: "rectangle.split.1x2"),
        .init(title: ".unified \u{2014} single row, items inline with title.",
              detail: "The macOS 11+ default for most apps. Toolbar items live in the same row as the window title.",
              symbol: "rectangle"),
        .init(title: ".unifiedCompact \u{2014} reduced vertical metrics on .unified.",
              detail: "Tighter row height than .unified. Use when toolbar real estate matters more than chrome breathing room.",
              symbol: "rectangle.compress.vertical"),
        .init(title: "(showsTitle:) variants control whether the title text appears in the toolbar.",
              detail: ".unified(showsTitle: false) and .unifiedCompact(showsTitle: false) hide the title text while keeping the chrome envelope intact \u{2014} useful for sidebar-driven apps where the sidebar is the primary navigation cue.",
              symbol: "character.cursor.ibeam"),
        .init(title: "Pairs with .windowStyle(\u{2026}).",
              detail: "WindowStyle controls the chrome envelope and traffic lights; WindowToolbarStyle controls how items inside that chrome render. They're independent dials.",
              symbol: "switch.2")
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

    // MARK: Style table

    private struct StyleEntry {
        let title: String
        let api: String
        let note: String
    }

    private let styles: [StyleEntry] = [
        .init(title: ".automatic \u{2014} DefaultWindowToolbarStyle",
              api: ".automatic",
              note: "System default per platform. macOS typically renders this as .expanded."),
        .init(title: ".expanded \u{2014} ExpandedWindowToolbarStyle",
              api: ".expanded",
              note: "Two-row chrome: title strip plus a separate toolbar row beneath it."),
        .init(title: ".unified \u{2014} UnifiedWindowToolbarStyle",
              api: ".unified",
              note: "Single-row chrome with toolbar items inline alongside the title."),
        .init(title: ".unified(showsTitle:) \u{2014} hides or shows the title text",
              api: ".unified(showsTitle: false)",
              note: "Same as .unified but the title text can be hidden. SwiftKit uses this with showsTitle: false."),
        .init(title: ".unifiedCompact \u{2014} UnifiedCompactWindowToolbarStyle",
              api: ".unifiedCompact",
              note: "Single-row chrome with reduced vertical metrics compared to .unified."),
        .init(title: ".unifiedCompact(showsTitle:) \u{2014} compact + title control",
              api: ".unifiedCompact(showsTitle: false)",
              note: "Tightest single-row option with optional title hiding.")
    ]
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

extension WindowToolbarStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.windowToolbarStyle",
        title: "WindowToolbarStyle",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "WindowToolbarStyle",
            "Scene/windowToolbarStyle(_:)",
            "Scene/windowToolbarLabelStyle(_:)",
            "Scene/windowToolbarLabelStyle(fixed:)",
            "WindowToolbarFullScreenVisibility",
            "View/windowToolbarFullScreenVisibility(_:)"
        ],
        blurb: "A specification for the appearance and behavior of a window's toolbar. Companion modifiers configure label style and full-screen visibility behavior.",
        signature: "protocol WindowToolbarStyle",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/windows/windowtoolbarstyle.md",
        page: { AnyView(WindowToolbarStyleGalleryPage()) }
    )
}

#Preview {
    WindowToolbarStyleGalleryPage()
        .frame(width: 1100, height: 800)
}
