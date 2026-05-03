import SwiftUI

// SwiftUI `Window` reference page.
// Source: Documentation/SwiftUI/windows/window.md
// Window is a Scene that produces a single, unique window. macOS 13.0+.
// SwiftKit itself uses Window — see SwiftKit/App/SwiftKitApp.swift.

struct WindowPage: View {
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
            Text("Window")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A scene that presents its content in a single, unique window.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/window.md \u{00b7} macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: "Window(\"Connection Doctor\", id: \"connection-doctor\") { ConnectionDoctor() }",
            code: """
            @main
            struct Mail: App {
                var body: some Scene {
                    WindowGroup {
                        MailViewer()
                    }
                    Window("Connection Doctor", id: "connection-doctor") {
                        ConnectionDoctor()
                    }
                }
            }
            """,
            note: "Single-instance auxiliary window alongside the main WindowGroup."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Auxiliary single-instance window") {
                WindowSnippet(
                    api: "Window(_:id:content:) \u{2014} singleton, brought-to-front on second open",
                    code: """
                    Window("Connection Doctor", id: "connection-doctor") {
                        ConnectionDoctor()
                    }
                    """,
                    note: "Calling openWindow(id:) when the window is already open just brings it forward — there is no second instance."
                )
            }

            VariantBlock(title: "Main scene of an app") {
                WindowSnippet(
                    api: "Window as the App's only Scene \u{2014} app quits when window closes",
                    code: """
                    @main
                    struct VideoCall: App {
                        var body: some Scene {
                            Window("VideoCall", id: "main") {
                                CameraView()
                            }
                        }
                    }
                    """,
                    note: "Different from WindowGroup: a single-Window app terminates when the window closes. WindowGroup apps keep running."
                )
            }

            VariantBlock(title: "SwiftKit's own usage") {
                WindowSnippet(
                    api: "Window(\"SwiftKit\", id: \"swiftkit-main\") { ContentView() }",
                    code: """
                    @main
                    struct SwiftKitApp: App {
                        var body: some Scene {
                            Window("SwiftKit", id: "swiftkit-main") {
                                ContentView()
                            }
                            .windowToolbarStyle(.unified(showsTitle: false))
                        }
                    }
                    """,
                    note: "SwiftKit is a single-window reference app, so Window is correct here. See SwiftKit/App/SwiftKitApp.swift."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Programmatic open / dismiss") {
                WindowSnippet(
                    api: "@Environment(\\.openWindow) / @Environment(\\.dismiss)",
                    code: """
                    struct OpenConnectionDoctorButton: View {
                        @Environment(\\.openWindow) private var openWindow
                        var body: some View {
                            Button("Connection doctor") {
                                openWindow(id: "connection-doctor")
                            }
                        }
                    }

                    struct ConnectionDoctor: View {
                        @Environment(\\.dismiss) private var dismiss
                        var body: some View {
                            Button("Dismiss") { dismiss() }
                        }
                    }
                    """,
                    note: "openWindow(id:) brings the existing instance forward instead of creating a duplicate. dismiss() closes the window when called from its root."
                )
            }
        }
    }

    // MARK: Notes

    private struct WNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [WNote] = [
        .init(title: "Window vs WindowGroup is about cardinality.",
              detail: "Window is for exactly-one-instance scenes (settings, an inspector, an auxiliary panel). WindowGroup creates new instances per openWindow call. Pick Window when duplicating doesn't make semantic sense.",
              symbol: "1.square"),
        .init(title: "Window apps quit when the last window closes; WindowGroup apps keep running.",
              detail: "If your only Scene is a Window, closing it terminates the process — that matches the macOS expectation for single-purpose apps. WindowGroup keeps the menu bar app alive even with zero windows.",
              symbol: "power"),
        .init(title: "navigationTitle dynamically overrides the title bar text.",
              detail: "The string passed to Window's initializer drives the Window menu listing. Apply .navigationTitle(\u{2026}) inside the content to update the title bar in response to state, while keeping the menu label stable.",
              symbol: "character.cursor.ibeam"),
        .init(title: "Volumetric style is unavailable on Window.",
              detail: "Per Apple's documentation, Windows created with Window do not support .volumetric. Use WindowGroup for visionOS volumetric scenes.",
              symbol: "cube"),
        .init(title: "Multiple Window scenes get separate identifiers and separate state.",
              detail: "Declaring more than one Window in the App body is the standard way to add inspectors, log windows, or settings panels. Each gets its own id.",
              symbol: "rectangle.split.3x1")
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
    WindowPage()
        .frame(width: 1100, height: 800)
}
