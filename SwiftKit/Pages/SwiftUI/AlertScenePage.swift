import SwiftUI

// SwiftUI `AlertScene` reference page.
// Source: Documentation/SwiftUI/modal-presentations/alertscene.md
// AlertScene is a Scene type — belongs at the App body level, not inline.
// macOS 15.0+. Documented as code-snippet only.

struct AlertScenePage: View {
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
            Text("AlertScene")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A scene that renders itself as a standalone alert dialog. Belongs at the App body level — not attached to any window.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/alertscene.md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        ASSnippet(
            api: "AlertScene(_:isPresented:actions:)",
            code: """
            @main
            struct MyApp: App {
                @State var showLoginAlert = true
                @State var loggedIn = false

                var body: some Scene {
                    Window("Welcome User Window", id: "WelcomeWindow") {
                        ContentView()
                    }
                    .defaultLaunchBehavior(loggedIn ? .presented : .suppressed)

                    AlertScene("Login Required", isPresented: $showLoginAlert) {
                        Button("OK") {
                            // Acknowledgement.
                        }
                    }
                }
            }
            """,
            note: "Reference example from the Apple documentation. AlertScene presents centred on the current display and blocks until dismissed."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "init(_:isPresented:actions:message:)") {
                ASSnippet(
                    api: "AlertScene(_:isPresented:actions:message:)",
                    code: """
                    AlertScene("Update Available", isPresented: $showUpdate) {
                        Button("Install") { … }
                        Button("Later", role: .cancel) { }
                    } message: {
                        Text("Version 1.4 is ready to install. Restart now?")
                    }
                    """,
                    note: "Adds a body message under the title."
                )
            }

            VariantBlock(title: "init(_:isPresented:presenting:actions:[message:])") {
                ASSnippet(
                    api: "AlertScene(_:isPresented:presenting:actions:[message:])",
                    code: """
                    AlertScene("Sync error", isPresented: $showSyncError, presenting: lastSyncError) { error in
                        Button("Retry") { … }
                        Button("Cancel", role: .cancel) { }
                    } message: { error in
                        Text(error.recoverySuggestion ?? "")
                    }
                    """,
                    note: "Two- and three-closure forms mirror the .alert(_:isPresented:presenting:…) view modifiers."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "All four documented initializers") {
                VStack(alignment: .leading, spacing: 8) {
                    APICallout("init(_:isPresented:actions:)")
                    APICallout("init(_:isPresented:actions:message:)")
                    APICallout("init(_:isPresented:presenting:actions:)")
                    APICallout("init(_:isPresented:presenting:actions:message:)")
                }
            }
        }
    }

    private struct ASNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ASNote] = [
        .init(title: "Scene, not View — belongs in App body.",
              detail: "AlertScene cannot be embedded inside a View body. Place it alongside Window/WindowGroup at the App's body level.",
              symbol: "macwindow"),
        .init(title: "Not attached to any window.",
              detail: "AlertScene presents centred on the current display, independent of which window is key. Useful for app-launch alerts (\"login required\") that pre-empt the main UI.",
              symbol: "rectangle.center.inset.filled"),
        .init(title: "All actions dismiss.",
              detail: "Tapping any button dismisses the alert. Use roles (.cancel, .destructive) the same way you would in a .alert modifier.",
              symbol: "arrow.uturn.backward"),
        .init(title: "Combine with dialogIcon, dialogSeverity, dialogSuppressionToggle on the Scene.",
              detail: "These three Scene modifiers are designed to attach to AlertScene to set its icon, severity (e.g. .critical), and a 'don't ask again' toggle.",
              symbol: "slider.horizontal.3")
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

private struct ASSnippet: View {
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
                Text(note).font(.footnote).foregroundStyle(.secondary)
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
    AlertScenePage()
        .frame(width: 1100, height: 800)
}
