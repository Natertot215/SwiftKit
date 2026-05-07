import SwiftUI

// SwiftUI `WindowManagerRole` + `Scene/windowManagerRole(_:)` reference page.
// Sources:
//   Documentation/SwiftUI/windows/windowmanagerrole.md
//   Documentation/SwiftUI/windows/windowmanagerrole(_:).md
// macOS 15.0+. Three values: .automatic, .principal, .associated.

struct WindowManagerRoleGalleryPage: View {
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
            Text("WindowManagerRole")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Defines how a scene's windows behave inside managed-window contexts \u{2014} full-screen mode and Stage Manager.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/windowmanagerrole.md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: ".windowManagerRole(.automatic)",
            code: """
            Window("Editor", id: "editor") {
                EditorView()
            }
            .windowManagerRole(.automatic)
            """,
            note: "Default \u{2014} the system picks based on scene type and order in App body."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".automatic \u{2014} system default") {
                WindowSnippet(
                    api: ".windowManagerRole(.automatic)",
                    code: """
                    WindowGroup { ContentView() }
                        .windowManagerRole(.automatic)
                    """,
                    note: "Equivalent to omitting the modifier. The first WindowGroup is typically treated as principal."
                )
            }

            VariantBlock(title: ".principal \u{2014} treat as a primary window") {
                WindowSnippet(
                    api: ".windowManagerRole(.principal)",
                    code: """
                    Window("Organizer", id: "organizer") {
                        OrganizerView()
                    }
                    .windowManagerRole(.principal)
                    """,
                    note: "Promotes a secondary Window to primary status. Stage Manager treats it as a top-level window; full screen lets it own the display."
                )
            }

            VariantBlock(title: ".associated \u{2014} subordinate to a principal window") {
                WindowSnippet(
                    api: ".windowManagerRole(.associated)",
                    code: """
                    Window("Inspector", id: "inspector") {
                        InspectorView()
                    }
                    .windowManagerRole(.associated)
                    """,
                    note: "Marks the window as a satellite of a principal scene \u{2014} Stage Manager keeps them grouped, full screen treats it as auxiliary chrome rather than a competing window."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                ".automatic: framework picks based on scene type and order \u{2014} the default if you omit the modifier.",
                ".principal: window participates as a top-level scene in Stage Manager and full screen.",
                ".associated: window groups with a principal in Stage Manager and behaves as auxiliary chrome in full screen.",
                "Apply at the Scene level (e.g. on Window or WindowGroup), not on a View.",
                "Sendable + Hashable \u{2014} safe to store and compare."
            ])
        }
    }

    // MARK: Notes

    private struct WMRNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [WMRNote] = [
        .init(title: "About Stage Manager grouping.",
              detail: "Stage Manager organizes windows into groups around a principal. .associated tells it to keep your inspector / palette grouped with the main editor. Without it, the inspector might float in its own group.",
              symbol: "rectangle.stack.badge.person.crop"),
        .init(title: "About full-screen behavior.",
              detail: "In full screen, .principal windows take over the display; .associated windows become sidecar chrome. Use .associated for inspectors that should ride along with the main window.",
              symbol: "arrow.up.left.and.arrow.down.right"),
        .init(title: "Three values, deliberate.",
              detail: ".automatic, .principal, .associated. Apple did not ship an .independent / .standalone explicitly \u{2014} use .principal when a window should compete for managed-window space, .associated when it shouldn't.",
              symbol: "switch.2"),
        .init(title: "Cross-platform on paper, macOS-relevant in practice.",
              detail: "WindowManagerRole is declared across iOS / iPadOS / Mac Catalyst / macOS / tvOS / visionOS / watchOS, but Stage Manager + Spaces semantics are most meaningful on macOS and iPadOS.",
              symbol: "globe")
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

extension WindowManagerRoleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.windowManagerRole",
        title: "WindowManagerRole",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "WindowManagerRole",
            "Scene/windowManagerRole(_:)"
        ],
        blurb: "Options for defining how a scene's windows behave when used within a managed window context, such as full-screen mode and Stage Manager.",
        signature: "struct WindowManagerRole",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/windows/windowmanagerrole.md",
        page: { AnyView(WindowManagerRoleGalleryPage()) }
    )
}

#Preview {
    WindowManagerRoleGalleryPage()
        .frame(width: 1100, height: 800)
}
