import SwiftUI

// SwiftUI `EnvironmentValues/dismissWindow` + `DismissWindowAction` reference page.
// Sources:
//   Documentation/SwiftUI/windows/dismisswindow.md
//   Documentation/SwiftUI/windows/dismisswindowaction.md
// macOS 14.0+. Closes a window targeted by id, value, or both.

struct DismissWindowPage: View {
    @Environment(\.dismissWindow) private var dismissWindow

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
            Text("EnvironmentValues/dismissWindow")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A DismissWindowAction in the environment that closes a window addressed by id, value, or both.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/dismisswindow.md \u{00b7} macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button("Close auxiliary window") {
                /* dismissWindow(id: "auxiliary") — intentionally inert */
            }
            .buttonStyle(.bordered)
            APICallout("dismissWindow(id: \"auxiliary\") \u{2014} reads @Environment(\\.dismissWindow)")
            Text("Button is illustrative \u{2014} the action is empty so the gallery doesn't try to close a window that doesn't exist.")
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
                    api: "dismissWindow(id: \"auxiliary\")",
                    code: """
                    @main
                    struct MyApp: App {
                        var body: some Scene {
                            WindowGroup { ContentView() }
                            #if os(macOS)
                            Window("Auxiliary", id: "auxiliary") {
                                AuxiliaryContentView()
                            }
                            #endif
                        }
                    }

                    struct DismissWindowButton: View {
                        @Environment(\\.dismissWindow) private var dismissWindow
                        var body: some View {
                            Button("Close Auxiliary Window") {
                                dismissWindow(id: "auxiliary")
                            }
                        }
                    }
                    """,
                    note: "The standard form. Targets a Window or UtilityWindow by id."
                )
            }

            VariantBlock(title: "By value \u{2014} callAsFunction(value:)") {
                WindowSnippet(
                    api: "dismissWindow(value: messageID)",
                    code: """
                    WindowGroup(for: Message.ID.self) { $messageID in
                        MessageDetail(messageID: messageID)
                    }

                    dismissWindow(value: messageID)
                    """,
                    note: "Closes the window in the matching WindowGroup that's currently presenting that value."
                )
            }

            VariantBlock(title: "Identifier + value \u{2014} callAsFunction(id:value:)") {
                WindowSnippet(
                    api: "dismissWindow(id: \"message\", value: uuid)",
                    code: """
                    WindowGroup("Message", id: "message", for: UUID.self) { $uuid in
                        MessageDetail(uuid: uuid)
                    }

                    dismissWindow(id: "message", value: uuid)
                    """,
                    note: "Both keys when more than one WindowGroup presents the same value type."
                )
            }

            VariantBlock(title: "No arguments \u{2014} callAsFunction()") {
                WindowSnippet(
                    api: "dismissWindow()",
                    code: """
                    Button("Close this window") {
                        dismissWindow()
                    }
                    """,
                    note: "Closes the window the action is read from. Useful in the window's own toolbar or root view."
                )
            }

            VariantBlock(title: "Override modal-dismissal blocking \u{2014} DismissBehavior.destructive") {
                WindowSnippet(
                    api: "withTransaction(\\.dismissBehavior, .destructive) { dismissWindow(id:) }",
                    code: """
                    Button("Close Auxiliary Window") {
                        withTransaction(\\.dismissBehavior, .destructive) {
                            dismissWindow(id: "auxiliary")
                        }
                    }
                    """,
                    note: "By default, dismissWindow respects modal presentations that block dismissal (e.g. a sheet with .interactiveDismissDisabled). .destructive forces the window closed anyway."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Returning from a pushed window") {
                WindowSnippet(
                    api: "dismissWindow() inside a pushWindow target restores the original",
                    code: """
                    // visionOS-specific:
                    Button("Done") {
                        dismissWindow()  // brings the backgrounded window back
                    }
                    """,
                    note: "When a window was opened via PushWindowAction (visionOS 2+), dismissing it brings the originally backgrounded window forward. macOS does not ship PushWindowAction."
                )
            }

            VariantBlock(title: "Live buttons (no real window dismisses)") {
                HStack(spacing: 16) {
                    Button("dismissWindow(id: \"auxiliary\")") {
                        /* would call dismissWindow(id: "auxiliary") */
                    }
                    .buttonStyle(.bordered)
                    Button("dismissWindow()") {
                        /* would call dismissWindow() */
                    }
                    .buttonStyle(.bordered)
                    Spacer()
                }
                Text("Inert buttons \u{2014} no scene with id \"auxiliary\" is registered, and dismissWindow() inside the gallery would attempt to close SwiftKit's main window.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Notes

    private struct DWNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [DWNote] = [
        .init(title: "Prefer dismissWindow over plain dismiss for closing scenes.",
              detail: "Both can close a window, but dismissWindow is purpose-built and won't be intercepted by an enclosing modal. Use dismiss for popping NavigationStack entries / closing sheets and popovers.",
              symbol: "rectangle.portrait.and.arrow.right"),
        .init(title: "Four callAsFunction overloads.",
              detail: "callAsFunction(), (id:), (value:), and (id:value:). The no-arg form targets the window the action is read from.",
              symbol: "function"),
        .init(title: "DismissBehavior.destructive forces past blocking modals.",
              detail: "When a sheet uses .interactiveDismissDisabled or otherwise blocks, default dismissWindow respects that. Wrapping in withTransaction(\\.dismissBehavior, .destructive) overrides.",
              symbol: "exclamationmark.octagon"),
        .init(title: "macOS 14+.",
              detail: "Earlier targets must use the plain dismiss action. dismissWindow's value/id-keyed forms only exist starting macOS 14, iOS 17, visionOS 1.",
              symbol: "calendar.badge.exclamationmark"),
        .init(title: "Closing the last window in a single-Window app quits.",
              detail: "If the App declares only one Window scene and dismissWindow closes it, the app terminates \u{2014} same as the user clicking the red traffic light. WindowGroup-only apps keep running.",
              symbol: "power")
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
    DismissWindowPage()
        .frame(width: 1100, height: 800)
}
