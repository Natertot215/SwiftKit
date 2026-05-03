import SwiftUI

// SwiftUI `PushWindowAction` reference page.
// Source: Documentation/SwiftUI/windows/pushwindowaction.md
// visionOS 2.0 only. Documented here for completeness; macOS 26 ships
// no PushWindowAction. The page exists to make that explicit.

struct PushWindowActionPage: View {
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
            Text("PushWindowAction")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("An action that opens a new window in place of the current one, backgrounding the source. visionOS-only.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/pushwindowaction.md \u{00b7} visionOS 2.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundStyle(.yellow)
                Text("PushWindowAction is visionOS-only \u{2014} not available on macOS.")
                    .font(.callout)
                    .foregroundStyle(.primary)
            }
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
            APICallout("@Environment(\\.pushWindow) // visionOS 2+ only")
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Push by id \u{2014} callAsFunction(id:)") {
                WindowSnippet(
                    api: "pushWindow(id: \"viewer\")",
                    code: """
                    @main
                    struct VideoEditor: App {
                        var body: some Scene {
                            WindowGroup(id: "editor") { EditorView() }
                            WindowGroup(id: "viewer") { VideoView() }
                        }
                    }

                    struct EditorView: View {
                        @Environment(\\.pushWindow) private var pushWindow
                        var body: some View {
                            Button("Play", systemImage: "play.fill") {
                                pushWindow(id: "viewer")
                            }
                        }
                    }
                    """,
                    note: "Backgrounds the editor; the viewer appears centered on the editor's footprint with the editor's size as a default."
                )
            }

            VariantBlock(title: "Push by value \u{2014} callAsFunction(value:)") {
                WindowSnippet(
                    api: "pushWindow(value: someValue)",
                    code: """
                    pushWindow(value: clipID)
                    """,
                    note: "Same pattern as openWindow(value:), but with push semantics: the source goes to background, and dismissWindow brings it back."
                )
            }

            VariantBlock(title: "Push by id + value \u{2014} callAsFunction(id:value:)") {
                WindowSnippet(
                    api: "pushWindow(id: \"viewer\", value: clipID)",
                    code: """
                    pushWindow(id: "viewer", value: clipID)
                    """,
                    note: "Disambiguates when multiple WindowGroups present the same value type."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Returning to the source window") {
                WindowSnippet(
                    api: "dismissWindow() inside the pushed window",
                    code: """
                    struct VideoView: View {
                        @Environment(\\.dismissWindow) private var dismissWindow
                        var body: some View {
                            Button("Done") { dismissWindow() }
                        }
                    }
                    """,
                    note: "Calling dismissWindow on the pushed window restores the originally backgrounded scene."
                )
            }

            VariantBlock(title: "Forbidden \u{2014} pushing from a pushed window") {
                BehaviorList(items: [
                    "PushWindowAction cannot be invoked from a window that was itself pushed.",
                    "Doing so is documented as not allowed; behavior is undefined.",
                    "Pop back via dismissWindow first, then push from the original."
                ])
            }
        }
    }

    // MARK: Notes

    private struct PWNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PWNote] = [
        .init(title: "visionOS 2.0+ only \u{2014} no macOS counterpart.",
              detail: "Apple ships PushWindowAction only on visionOS. macOS uses openWindow/dismissWindow for the same conceptual flow, but without the source-backgrounding semantics.",
              symbol: "visionpro"),
        .init(title: "Push semantics: replace, don't add.",
              detail: "The source window is backgrounded; the new window takes its place center-aligned with the source's footprint. Closing the new window brings the source back \u{2014} like a NavigationStack push, but at the window level.",
              symbol: "arrow.right.square"),
        .init(title: "Three callAsFunction overloads, mirroring openWindow.",
              detail: "(id:), (value:), and (id:value:). Same routing rules as openWindow \u{2014} value matches WindowGroup(for:), id matches Window/WindowGroup id.",
              symbol: "function"),
        .init(title: "Companion to dismissWindow.",
              detail: "The visionOS-flavored push/pop pair is: pushWindow to forward, dismissWindow to come back. Don't mix in the dismiss action \u{2014} dismissWindow is the documented partner.",
              symbol: "arrow.right.arrow.left.square")
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
    PushWindowActionPage()
        .frame(width: 1100, height: 800)
}
