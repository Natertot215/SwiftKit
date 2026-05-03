import SwiftUI

// SwiftUI `WindowGroup` reference page.
// Source: Documentation/SwiftUI/windows/windowgroup.md
// WindowGroup is a Scene type — it cannot be rendered inline. This page
// documents every documented initializer with code snippets and explanatory
// notes. The framework requires WindowGroup at the App body level.

struct WindowGroupPage: View {
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
            Text("WindowGroup")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A scene that presents a group of identically structured windows.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/windowgroup.md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: "WindowGroup { ContentView() }",
            code: """
            @main
            struct MyApp: App {
                var body: some Scene {
                    WindowGroup {
                        ContentView()
                    }
                }
            }
            """,
            note: "The simplest WindowGroup — anonymous, untyped, system-titled by the app name."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Titled — init(_:content:)") {
                WindowSnippet(
                    api: "WindowGroup(\"Mail Viewer\") { MailViewer() }",
                    code: """
                    WindowGroup("Mail Viewer") {
                        MailViewer()
                    }
                    """,
                    note: "Title appears in File \u{203a} New, the title bar, and the Window menu."
                )
            }

            VariantBlock(title: "Identified — init(id:content:) / init(_:id:content:)") {
                WindowSnippet(
                    api: "WindowGroup(id: \"mail-viewer\") { MailViewer() }",
                    code: """
                    WindowGroup(id: "mail-viewer") {
                        MailViewer()
                    }

                    // Open elsewhere with:
                    @Environment(\\.openWindow) private var openWindow
                    Button("Open viewer") { openWindow(id: "mail-viewer") }
                    """,
                    note: "Identifiers enable openWindow(id:) presentation. Use unique strings."
                )
            }

            VariantBlock(title: "Data-driven \u{2014} init(for:content:) / init(_:for:content:)") {
                WindowSnippet(
                    api: "WindowGroup(for: Message.ID.self) { $messageID in MessageDetail(messageID:) }",
                    code: """
                    WindowGroup(for: Message.ID.self) { $messageID in
                        MessageDetail(messageID: messageID)
                    }

                    // Open with a value:
                    openWindow(value: message.id)
                    """,
                    note: "The presented type must be Hashable + Codable. Identifiable models work well by passing .id."
                )
            }

            VariantBlock(title: "Data-driven with default \u{2014} init(for:content:defaultValue:)") {
                WindowSnippet(
                    api: "WindowGroup(for: Message.ID.self) { $id in \u{2026} } defaultValue: { model.makeNew().id }",
                    code: """
                    WindowGroup(for: Message.ID.self) { $messageID in
                        MessageDetail(messageID: messageID)
                    } defaultValue: {
                        model.makeNewMessage().id
                    }
                    """,
                    note: "Avoids a nil binding when the user opens via File \u{203a} New Window."
                )
            }

            VariantBlock(title: "Identified + data-driven \u{2014} init(_:id:for:content:)") {
                WindowSnippet(
                    api: "WindowGroup(\"Message\", id: \"message\", for: UUID.self) { $uuid in \u{2026} }",
                    code: """
                    WindowGroup("Message", id: "message", for: UUID.self) { $uuid in
                        MessageDetail(uuid: uuid)
                    }
                    WindowGroup("Account", id: "account-info", for: UUID.self) { $uuid in
                        AccountDetail(uuid: uuid)
                    }
                    """,
                    note: "Both id and value distinguish multiple groups that share a presented type."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Per-window state") {
                WindowSnippet(
                    api: "Each WindowGroup window gets independent @State / @StateObject storage",
                    code: """
                    WindowGroup {
                        EditorView()
                        // Every window the user opens has its own @State.
                    }
                    """,
                    note: "SwiftUI allocates fresh storage per window. There is no implicit sharing across windows from the same group."
                )
            }

            VariantBlock(title: "Programmatic open + dismiss") {
                WindowSnippet(
                    api: "@Environment(\\.openWindow) / @Environment(\\.dismiss)",
                    code: """
                    struct Toolbar: View {
                        @Environment(\\.openWindow) private var openWindow
                        var body: some View {
                            Button("New viewer") {
                                openWindow(id: "mail-viewer")
                            }
                        }
                    }

                    struct AccountDetail: View {
                        @Environment(\\.dismiss) private var dismiss
                        var body: some View {
                            Button("Done") { dismiss() }
                        }
                    }
                    """,
                    note: "The dismiss action closes the enclosing window when called from its root view, but defers to modal dismissal if a sheet/popover is on top."
                )
            }
        }
    }

    // MARK: Notes

    private struct WGNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [WGNote] = [
        .init(title: "WindowGroup is a Scene, not a View.",
              detail: "It belongs at the App body level. You cannot embed a WindowGroup inside a View — that is what NavigationSplitView, NavigationStack, or sheets are for.",
              symbol: "macwindow"),
        .init(title: "macOS gets multi-window + Window menu commands automatically.",
              detail: "The system populates the Window menu with the group's title (or app name), supplies File \u{203a} New, and lets users gather the windows into a tabbed interface.",
              symbol: "rectangle.stack"),
        .init(title: "Presented values must be Hashable and Codable.",
              detail: "openWindow(value:) routes by type identity. Codable conformance is what enables state restoration to revive the window with the same value across launches.",
              symbol: "barcode"),
        .init(title: "Reusing a presented value brings the existing window to the front.",
              detail: "If a window from the group is already showing the same value, openWindow surfaces it instead of creating a duplicate. This is the built-in deduplication behavior.",
              symbol: "arrow.up.right.square"),
        .init(title: "navigationTitle inside a window overrides the WindowGroup title.",
              detail: "Use .navigationTitle(\u{2026}) on the window's root content to set a per-window title. The framework still uses the WindowGroup title for File \u{203a} New and the Window menu list label.",
              symbol: "character.cursor.ibeam"),
        .init(title: "For document-based apps, use DocumentGroup.",
              detail: "DocumentGroup wraps WindowGroup behavior with file-coordination, NSDocument/UIDocument bridging, and File menu commands suitable for document workflows.",
              symbol: "doc"),
        .init(title: "SwiftKit itself uses Window, not WindowGroup.",
              detail: "Because SwiftKit is a single-window reference app — see SwiftKit/App/SwiftKitApp.swift — it uses a Window scene so the app quits when the window closes. Pick WindowGroup when multiple instances are appropriate.",
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

#Preview {
    WindowGroupPage()
        .frame(width: 1100, height: 800)
}
