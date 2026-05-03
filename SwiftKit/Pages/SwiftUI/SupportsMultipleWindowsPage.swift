import SwiftUI

// SwiftUI `EnvironmentValues/supportsMultipleWindows` reference page.
// Source: Documentation/SwiftUI/windows/supportsmultiplewindows.md
// macOS 13.0+. Read-only Bool; on macOS SwiftUI lifecycle apps it's always
// true. Used to gate openWindow call sites.

struct SupportsMultipleWindowsPage: View {
    @Environment(\.supportsMultipleWindows) private var supportsMultipleWindows

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
            Text("EnvironmentValues/supportsMultipleWindows")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A read-only Bool indicating whether the current platform configuration supports opening more than one window.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/supportsmultiplewindows.md \u{00b7} macOS 13.0+")
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
                Image(systemName: supportsMultipleWindows ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundStyle(supportsMultipleWindows ? .green : .red)
                Text("supportsMultipleWindows = \(String(describing: supportsMultipleWindows))")
                    .font(.callout)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.primary)
                    .textSelection(.enabled)
            }
            APICallout("@Environment(\\.supportsMultipleWindows) private var supportsMultipleWindows")
            Text("On a macOS SwiftUI lifecycle app this is always true. Live value above is read from this view's own environment.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Disable openWindow buttons when unsupported") {
                WindowSnippet(
                    api: "Button(\u{2026}).disabled(!supportsMultipleWindows)",
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
                    note: "Always gate openWindow call sites this way \u{2014} otherwise the call silently no-ops on unsupported platforms and logs a runtime error."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "macOS (SwiftUI lifecycle): always true.",
                "iPadOS (SwiftUI lifecycle): true only if Info.plist sets UIApplicationSupportsMultipleScenes = true.",
                "All other platforms / configurations: false.",
                "Reading the value in a child view returns the same answer \u{2014} this is a platform fact, not contextual."
            ])
        }
    }

    // MARK: Notes

    private struct SMWNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [SMWNote] = [
        .init(title: "Read-only \u{2014} you can't override it.",
              detail: "supportsMultipleWindows is determined by the platform and your Info.plist. Setting it via .environment(\\.supportsMultipleWindows, \u{2026}) is unsupported.",
              symbol: "lock"),
        .init(title: "Use it as the canonical guard for openWindow.",
              detail: "Apple's documented pattern is to disable the button when the value is false. A button that triggers a runtime-error no-op is a worse UX than a disabled button.",
              symbol: "checkmark.shield"),
        .init(title: "iPadOS opt-in requires UIApplicationSupportsMultipleScenes.",
              detail: "Set the key in the Info.plist's UIApplicationSceneManifest dictionary. Without it, the iPad app reports false even if the rest of the multi-window setup is correct.",
              symbol: "ipad"),
        .init(title: "SwiftKit always returns true.",
              detail: "Because SwiftKit is a macOS-only SwiftUI lifecycle app, the value above always reads true. The page exists to document the API surface, not to demonstrate cross-platform branching.",
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
    SupportsMultipleWindowsPage()
        .frame(width: 1100, height: 800)
}
