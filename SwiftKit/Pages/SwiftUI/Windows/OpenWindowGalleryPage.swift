import SwiftUI

// SwiftUI `EnvironmentValues/openWindow` + `OpenWindowAction` reference page.
// Sources:
//   Documentation/SwiftUI/windows/openwindow.md
//   Documentation/SwiftUI/windows/openwindowaction.md
// macOS 13.0+. Three callAsFunction overloads (id:, id:value:, value:) plus
// macOS 26 sharingBehavior overloads.

struct OpenWindowGalleryPage: View {
    @Environment(\.openWindow) private var openWindow

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
            Text("EnvironmentValues/openWindow")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("An OpenWindowAction stored in the environment, used to programmatically present a window from a Scene.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/openwindow.md \u{00b7} macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Live button — does NOT actually open a real window. Action is empty
            // because the gallery has no scene with id "mail-viewer". Per agent
            // brief: never wire openWindow to a real id during navigation.
            Button("Open new mail viewer") {
                /* openWindow(id: "mail-viewer") — intentionally not invoked */
            }
            .buttonStyle(.bordered)
            APICallout("openWindow(id: \"mail-viewer\") \u{2014} reads @Environment(\\.openWindow)")
            Text("Buttons on this page are illustrative \u{2014} their actions are intentionally empty so navigating the gallery doesn't spawn extra app windows.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "By identifier \u{2014} callAsFunction(id:)") {
                WindowSnippet(
                    api: "openWindow(id: \"mail-viewer\")",
                    code: """
                    @main
                    struct Mail: App {
                        var body: some Scene {
                            WindowGroup(id: "mail-viewer") {
                                MailViewer()
                            }
                        }
                    }

                    struct NewViewerButton: View {
                        @Environment(\\.openWindow) private var openWindow
                        var body: some View {
                            Button("Open new mail viewer") {
                                openWindow(id: "mail-viewer")
                            }
                        }
                    }
                    """,
                    note: "Targets a WindowGroup or Window with the matching id. WindowGroup spawns a new window; Window brings the existing instance forward."
                )
            }

            VariantBlock(title: "By presented value \u{2014} callAsFunction(value:)") {
                WindowSnippet(
                    api: "openWindow(value: message.id)",
                    code: """
                    WindowGroup(for: Message.ID.self) { $messageID in
                        MessageDetail(messageID: messageID)
                    }

                    Button("Open message") {
                        openWindow(value: message.id)
                    }
                    """,
                    note: "Routes by type. Reusing the same value brings the existing window forward instead of creating a duplicate."
                )
            }

            VariantBlock(title: "Identifier + value \u{2014} callAsFunction(id:value:)") {
                WindowSnippet(
                    api: "openWindow(id: \"message\", value: messageID)",
                    code: """
                    WindowGroup("Message", id: "message", for: UUID.self) { $uuid in
                        MessageDetail(uuid: uuid)
                    }
                    WindowGroup("Account", id: "account-info", for: UUID.self) { $uuid in
                        AccountDetail(uuid: uuid)
                    }

                    openWindow(id: "message", value: messageID)
                    openWindow(id: "account-info", value: accountID)
                    """,
                    note: "Use both when multiple WindowGroups present the same value type \u{2014} the id disambiguates."
                )
            }

            VariantBlock(title: "Sharing behavior overloads (macOS 26+)") {
                WindowSnippet(
                    api: "openWindow(id: \"\u{2026}\", sharingBehavior:)",
                    code: """
                    // OpenWindowAction.SharingBehavior controls whether the
                    // opened window participates in window sharing surfaces.
                    openWindow(id: "viewer", sharingBehavior: .disabled)
                    """,
                    note: "Three overloads add a sharingBehavior parameter (id:sharingBehavior:, id:value:sharingBehavior:, value:sharingBehavior:). Use when the destination window should be excluded from screen-sharing flows."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Disable when the platform doesn't support it") {
                WindowSnippet(
                    api: "@Environment(\\.supportsMultipleWindows)",
                    code: """
                    struct NewMailViewerButton: View {
                        @Environment(\\.supportsMultipleWindows) private var supportsMultipleWindows
                        @Environment(\\.openWindow) private var openWindow

                        var body: some View {
                            Button("Open New Window") {
                                openWindow(id: "mail-viewer")
                            }
                            .disabled(!supportsMultipleWindows)
                        }
                    }
                    """,
                    note: "On macOS supportsMultipleWindows is always true for SwiftUI lifecycle apps; on iPadOS it depends on UIApplicationSupportsMultipleScenes. Calling openWindow when unsupported logs a runtime error and is a no-op."
                )
            }

            VariantBlock(title: "Live button (no real window opens)") {
                HStack(spacing: 16) {
                    Button("openWindow(id: \"editor\")") {
                        /* would call openWindow(id: "editor") */
                    }
                    .buttonStyle(.bordered)
                    Button("openWindow(value: someID)") {
                        /* would call openWindow(value: someID) */
                    }
                    .buttonStyle(.bordered)
                    Spacer()
                }
                Text("These buttons are intentionally inert. SwiftKit doesn't declare \"editor\" or value-typed groups, and we don't want to spawn extra windows during navigation.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Notes

    private struct OWNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [OWNote] = [
        .init(title: "OpenWindowAction is callable \u{2014} you invoke it like a function.",
              detail: "The @MainActor struct defines callAsFunction(id:), callAsFunction(id:value:), callAsFunction(value:), and matching sharingBehavior overloads. Read it from the environment, then call openWindow(\u{2026}).",
              symbol: "function"),
        .init(title: "WindowGroup creates new instances; Window/UtilityWindow surface the existing one.",
              detail: "Calling openWindow on a WindowGroup id spawns a new window (per-window @State, etc.). Calling it on a Window or UtilityWindow id brings the singleton forward.",
              symbol: "rectangle.stack"),
        .init(title: "Reusing a value deduplicates.",
              detail: "If a window from the targeted WindowGroup is already presenting the value you pass, openWindow brings that window forward instead of opening a second one. This is built-in \u{2014} you don't need to track open windows yourself.",
              symbol: "arrow.up.right.square"),
        .init(title: "Always pair value-driven openWindow with a Codable + Hashable type.",
              detail: "WindowGroup(for:) requires this; openWindow(value:) routes by it. Identifiable model IDs (UUID, Int, String) are typical; avoid passing whole model objects.",
              symbol: "barcode"),
        .init(title: "Disable unsupported buttons.",
              detail: "Wrap the call site in @Environment(\\.supportsMultipleWindows) and disable the button when false. Better than letting the user click and getting a silent runtime log.",
              symbol: "checkmark.shield"),
        .init(title: "PushWindowAction is the visionOS sibling.",
              detail: "On visionOS 2+, pushWindow replaces the current window with a new one rather than opening alongside it. Calling dismissWindow brings the original back. macOS does not ship PushWindowAction.",
              symbol: "arrow.right.square")
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

extension OpenWindowGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.openWindow",
        title: "OpenWindow",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "OpenWindowAction",
            "EnvironmentValues/openWindow",
            "PushWindowAction",
            "EnvironmentValues/supportsMultipleWindows"
        ],
        blurb: "An environment action that programmatically opens a window from a WindowGroup or Window scene by id, value, or both. PushWindowAction is the iPad-multitasking variant.",
        signature: "struct OpenWindowAction",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/windows/openwindowaction.md",
        page: { AnyView(OpenWindowGalleryPage()) }
    )
}

#Preview {
    OpenWindowGalleryPage()
        .frame(width: 1100, height: 800)
}
