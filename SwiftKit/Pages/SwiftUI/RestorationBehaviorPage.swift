import SwiftUI

// SwiftUI `Scene/restorationBehavior(_:)` + `SceneRestorationBehavior` reference page.
// Sources:
//   Documentation/SwiftUI/windows/restorationbehavior(_:).md
//   Documentation/SwiftUI/windows/scenerestorationbehavior.md
// macOS 15.0+. Two values: .automatic, .disabled.

struct RestorationBehaviorPage: View {
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
            Text("Scene/restorationBehavior")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Opts a scene in or out of state restoration when the app relaunches.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/restorationbehavior(_:).md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: ".restorationBehavior(.automatic)",
            code: """
            Window("Network Test", id: "network-test") {
                NetworkTestView()
            }
            .restorationBehavior(.automatic)
            """,
            note: "Default \u{2014} the system uses platform conventions to decide. On macOS this respects the user's system-wide setting in System Settings."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".automatic \u{2014} platform default") {
                WindowSnippet(
                    api: ".restorationBehavior(.automatic)",
                    code: """
                    Window("Editor", id: "editor") { Editor() }
                        .restorationBehavior(.automatic)
                    """,
                    note: "Equivalent to omitting the modifier. macOS scenes restore based on the user's systemwide preference."
                )
            }

            VariantBlock(title: ".disabled \u{2014} never restore this scene") {
                WindowSnippet(
                    api: ".restorationBehavior(.disabled)",
                    code: """
                    @main
                    struct MyApp: App {
                        var body: some Scene {
                            WindowGroup { ContentView() }
                            Window("Network Test", id: "network-test") {
                                NetworkTestView()
                            }
                            .restorationBehavior(.disabled)
                        }
                    }
                    """,
                    note: "Use for transient activities (network probes, video playback, debugging panels) where the prior session's state isn't worth restoring."
                )
            }

            VariantBlock(title: "Apple's video-player example") {
                WindowSnippet(
                    api: "Disable restoration on the video player scene",
                    code: """
                    .restorationBehavior(.disabled)
                    """,
                    note: "From Apple's Destination Video sample: \u{201C}As the app's videos are brief and a person's interactions with them are short-lived, it doesn't make sense to restore the video player on the next launch.\u{201D}"
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                ".automatic respects the user's macOS state-restoration setting (System Settings \u{203a} Desktop & Dock).",
                ".disabled overrides the user's preference for this scene only.",
                "Pair .restorationBehavior(.disabled) with .defaultLaunchBehavior(.presented) for true Welcome flows.",
                "Restoration affects window position, size, and presented values \u{2014} not @State stored in views.",
                "On platforms other than macOS, defaults vary; consult per-platform docs for behavior."
            ])
        }
    }

    // MARK: Notes

    private struct RBNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [RBNote] = [
        .init(title: "Two values \u{2014} restore by user preference, or never.",
              detail: ".automatic and .disabled are the only cases. There's no .always counterpart \u{2014} you can't override the user's wishes for restoration to happen, only opt this scene out.",
              symbol: "switch.2"),
        .init(title: "Use .disabled for transient or expensive-to-restore scenes.",
              detail: "Network connection testers, video players mid-stream, debug panels, ephemeral wizards \u{2014} restoring these doesn't help users and may be impossible (the underlying state may not exist).",
              symbol: "timer"),
        .init(title: "Compose with .defaultLaunchBehavior(_:) for Welcome flows.",
              detail: "A Welcome window typically wants .defaultLaunchBehavior(.presented) plus .restorationBehavior(.disabled) so it always shows on cold launch and doesn't linger across reopens.",
              symbol: "hand.wave"),
        .init(title: "Doesn't reach into view-local @State.",
              detail: "Restoration tracks scene-level info (window geometry, presented values). View-local @State / @StateObject reset on relaunch unless you persist them via SceneStorage / AppStorage / model code.",
              symbol: "scope"),
        .init(title: "macOS 15+ for SwiftUI; earlier macOS used NSWindow autosave + NSWindowRestoration.",
              detail: "Pre-15 SwiftUI deferred to AppKit's restoration system entirely. macOS 15 adds explicit per-scene control through this modifier.",
              symbol: "calendar.badge.exclamationmark")
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
    RestorationBehaviorPage()
        .frame(width: 1100, height: 800)
}
