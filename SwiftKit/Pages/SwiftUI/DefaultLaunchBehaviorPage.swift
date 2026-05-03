import SwiftUI

// SwiftUI `Scene/defaultLaunchBehavior(_:)` + `SceneLaunchBehavior` reference page.
// Sources:
//   Documentation/SwiftUI/windows/defaultlaunchbehavior(_:).md
//   Documentation/SwiftUI/windows/scenelaunchbehavior.md
// macOS 15.0+. Three values: .automatic, .presented, .suppressed.

struct DefaultLaunchBehaviorPage: View {
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
            Text("Scene/defaultLaunchBehavior")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets whether a scene presents itself on app launch when there's no previous restored state.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/defaultlaunchbehavior(_:).md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: ".defaultLaunchBehavior(.automatic)",
            code: """
            Window("Welcome", id: "welcome") {
                WelcomeView()
            }
            .defaultLaunchBehavior(.automatic)
            """,
            note: "Default \u{2014} the scene only presents itself if it's the first scene defined and no other scene has presented."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".automatic \u{2014} present only if first-defined and nothing else presented") {
                WindowSnippet(
                    api: ".defaultLaunchBehavior(.automatic)",
                    code: """
                    Window("Main", id: "main") { ContentView() }
                        .defaultLaunchBehavior(.automatic)
                    """,
                    note: "Equivalent to omitting the modifier. Useful as an explicit reset when other scenes set .presented or .suppressed."
                )
            }

            VariantBlock(title: ".presented \u{2014} always present this scene on launch") {
                WindowSnippet(
                    api: ".defaultLaunchBehavior(.presented)",
                    code: """
                    @main
                    struct MyApp: App {
                        var body: some Scene {
                            DocumentGroup(newDocument: MyDocument()) { config in
                                DocumentEditor(config.$document)
                            }
                            Window("Welcome to My App", id: "welcome") {
                                WelcomeView()
                            }
                            .defaultLaunchBehavior(.presented)
                        }
                    }
                    """,
                    note: "Apple's canonical Welcome-window pattern: a DocumentGroup paired with a Welcome Window that always shows on cold launch."
                )
            }

            VariantBlock(title: ".suppressed \u{2014} never present on launch") {
                WindowSnippet(
                    api: ".defaultLaunchBehavior(.suppressed)",
                    code: """
                    Window("Network Test", id: "network-test") {
                        NetworkTestView()
                    }
                    .defaultLaunchBehavior(.suppressed)
                    """,
                    note: "The scene exists but doesn't show on launch. The user reaches it via openWindow / a menu / a keyboard shortcut."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "On macOS, this also controls which scene appears when the user clicks the Dock icon with no visible windows.",
                "Ignored on platforms that don't support multiple windows.",
                "On non-macOS platforms, at least one scene must be presentable \u{2014} otherwise the system falls back to the first scene.",
                "On visionOS, .suppressed additionally means the scene won't reappear when the user taps the app icon with no visible windows.",
                "iPadOS and similar platforms also require the scene's role to match UIApplicationPreferredDefaultSceneSessionRole."
            ])
        }
    }

    // MARK: Notes

    private struct DLBNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [DLBNote] = [
        .init(title: "Three values \u{2014} pick the one that matches the user expectation.",
              detail: ".automatic for normal scenes, .presented for Welcome / first-run windows, .suppressed for utility scenes that should only appear on demand.",
              symbol: "switch.2"),
        .init(title: "Restoration trumps default launch behavior.",
              detail: "If the user had this window open at quit, restoration brings it back regardless of .suppressed. defaultLaunchBehavior only fires when there is no prior state.",
              symbol: "clock.arrow.circlepath"),
        .init(title: "macOS Dock-icon click behavior matches.",
              detail: "When the user clicks the Dock icon and the app has no visible windows, macOS uses defaultLaunchBehavior to decide which scene to surface. .presented wins; .suppressed is skipped.",
              symbol: "dock.rectangle"),
        .init(title: "Pair .presented with a non-restoration scene for true Welcome flow.",
              detail: "Apple's documented pattern: a Welcome window with .defaultLaunchBehavior(.presented) plus .restorationBehavior(.disabled) so it always shows on cold launch and never lingers across restarts.",
              symbol: "hand.wave"),
        .init(title: "macOS 15+; visionOS 26+.",
              detail: "Earlier targets always present the first scene on launch with no opt-out. Use AppKit/UIKit lifecycle hooks for finer control on those platforms.",
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
    DefaultLaunchBehaviorPage()
        .frame(width: 1100, height: 800)
}
