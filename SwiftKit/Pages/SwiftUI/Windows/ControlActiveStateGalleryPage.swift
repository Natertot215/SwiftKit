import SwiftUI

// SwiftUI `ControlActiveState` reference page.
// Source: Documentation/SwiftUI/windows/controlactivestate.md
// macOS 10.15+ (DEPRECATED in macOS 26.5). Three values: .key, .active, .inactive.
// Use @Environment(\.appearsActive) instead.

struct ControlActiveStateGalleryPage: View {
    @Environment(\.controlActiveState) private var controlActiveState

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
            Text("ControlActiveState")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Reports the active appearance expected of controls in a window. Deprecated in macOS 26.5 \u{2014} use @Environment(\\.appearsActive) instead.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/controlactivestate.md \u{00b7} macOS 10.15+ (deprecated 26.5)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                Image(systemName: "circle.dashed")
                    .foregroundStyle(.tint)
                Text("controlActiveState = \(label(for: controlActiveState))")
                    .font(.callout)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.primary)
                    .textSelection(.enabled)
            }
            APICallout("@Environment(\\.controlActiveState) // deprecated; prefer \\.appearsActive")
            Text("Live value above is read from this view's environment. Click out of SwiftKit and back to see the value transition between .key, .active, and .inactive.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Three documented cases") {
                BehaviorList(items: [
                    ".key \u{2014} window contains the key view (the focused control accepts keyboard input).",
                    ".active \u{2014} window is active (frontmost in its app) but not necessarily key.",
                    ".inactive \u{2014} window is in the background; controls should render in their unemphasized state."
                ])
                WindowSnippet(
                    api: "switch on ControlActiveState",
                    code: """
                    @Environment(\\.controlActiveState) private var state

                    var border: Color {
                        switch state {
                        case .key:      return .accentColor
                        case .active:   return .secondary
                        case .inactive: return .quaternary
                        @unknown default: return .secondary
                        }
                    }
                    """
                )
            }

            VariantBlock(title: "Migration target \u{2014} @Environment(\\.appearsActive)") {
                WindowSnippet(
                    api: "@Environment(\\.appearsActive) private var appearsActive: Bool",
                    code: """
                    @Environment(\\.appearsActive) private var appearsActive

                    var body: some View {
                        Rectangle()
                            .fill(appearsActive ? .accentColor : .secondary)
                    }
                    """,
                    note: "appearsActive is the modern boolean that replaces the three-state ControlActiveState. Most controls only need active vs inactive, not the .key distinction."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "Read via @Environment(\\.controlActiveState) inside any view in a window.",
                "Updates automatically as the window's key/active/inactive state changes.",
                "On macOS 26.5+, prefer @Environment(\\.appearsActive) for new code.",
                "CaseIterable + Hashable + Sendable \u{2014} safe to switch over and store.",
                "Pre-deprecation, this was the canonical way to dim sidebar selection chrome and inspector accents when the window lost focus."
            ])
        }
    }

    // MARK: Notes

    private struct CASNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [CASNote] = [
        .init(title: "Deprecated as of macOS 26.5 \u{2014} use appearsActive.",
              detail: "Apple's deprecation note: \u{201C}ControlActiveState and EnvironmentValues.controlActiveState are deprecated, use EnvironmentValues.appearsActive instead.\u{201D} New code should switch immediately; existing code can migrate at the next opportunity.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Three states, but most code only needs two.",
              detail: ".key vs .active is rarely meaningful in SwiftUI \u{2014} the framework already handles focus chrome. The new appearsActive collapses both into one boolean.",
              symbol: "switch.2"),
        .init(title: "Used historically for sidebar / inspector dimming.",
              detail: "Source-list rows, inspector accent strokes, and selection backgrounds traditionally muted to .secondary when the window went inactive. SwiftKit follows the same pattern in its sidebar selection handling.",
              symbol: "sidebar.left"),
        .init(title: "Don't read this on iOS / iPadOS / visionOS.",
              detail: "ControlActiveState is macOS-only. Cross-platform code should branch on #if os(macOS) before reading the environment value (or just use the new appearsActive uniformly).",
              symbol: "macwindow"),
        .init(title: "Cross-reference: SwiftKit's lessons L-009.",
              detail: "Per .claude/lessons.md, SwiftKit's sidebar reads the activation environment to dim selection chrome when the window deactivates. The codebase uses appearsActive going forward.",
              symbol: "book.closed")
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

    // MARK: Helpers

    private func label(for state: ControlActiveState) -> String {
        switch state {
        case .key:      return ".key"
        case .active:   return ".active"
        case .inactive: return ".inactive"
        @unknown default: return String(describing: state)
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

extension ControlActiveStateGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.controlActiveState",
        title: "ControlActiveState",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "ControlActiveState"
        ],
        blurb: "The active appearance expected of controls in a window. Deprecated in macOS 26 — use EnvironmentValues.appearsActive instead.",
        signature: "enum ControlActiveState",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/windows/controlactivestate.md",
        page: { AnyView(ControlActiveStateGalleryPage()) }
    )
}

#Preview {
    ControlActiveStateGalleryPage()
        .frame(width: 1100, height: 800)
}
