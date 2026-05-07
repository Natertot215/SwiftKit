import SwiftUI

// SwiftUI `WindowInteractionBehavior` family reference page.
// Sources:
//   Documentation/SwiftUI/windows/windowinteractionbehavior.md
//   Documentation/SwiftUI/windows/windowdismissbehavior(_:).md
//   Documentation/SwiftUI/windows/windowfullscreenbehavior(_:).md
//   Documentation/SwiftUI/windows/windowminimizebehavior(_:).md
//   Documentation/SwiftUI/windows/windowresizebehavior(_:).md
// macOS 15.0+. One enum + four View modifiers (windowBackgroundDragBehavior
// is a Scene modifier; covered separately in WindowBackgroundDragBehaviorPage).

struct WindowInteractionBehaviorGalleryPage: View {
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
            Text("WindowInteractionBehavior")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Three-value enum (.automatic / .enabled / .disabled) used by four View modifiers to enable, force, or suppress dismiss / minimize / fullscreen / resize on the enclosing window.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/windowinteractionbehavior.md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: "AboutView with disabled minimize + resize",
            code: """
            Window("About MyApp", id: "about") {
                AboutView()
                    .windowMinimizeBehavior(.disabled)
                    .windowResizeBehavior(.disabled)
            }
            .windowResizability(.contentSize)
            """,
            note: "Apple's canonical example: an About window that the user can only dismiss \u{2014} no minimize, no resize."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "WindowInteractionBehavior values") {
                BehaviorList(items: [
                    ".automatic \u{2014} use the system / scene default for this interaction.",
                    ".enabled \u{2014} explicitly allow this interaction.",
                    ".disabled \u{2014} suppress this interaction entirely (button is grayed out, menu item disabled)."
                ])
            }

            VariantBlock(title: ".windowDismissBehavior(_:)") {
                WindowSnippet(
                    api: ".windowDismissBehavior(.disabled)",
                    code: """
                    Window("Welcome", id: "welcome") {
                        WelcomeView()
                            .windowDismissBehavior(.disabled)
                    }
                    """,
                    note: "Locks out close button + Cmd-W. Use for onboarding flows the user must complete or abort some other way."
                )
            }

            VariantBlock(title: ".windowMinimizeBehavior(_:)") {
                WindowSnippet(
                    api: ".windowMinimizeBehavior(.disabled)",
                    code: """
                    Window("About MyApp", id: "about") {
                        AboutView()
                            .windowResizeBehavior(.disabled)
                            .windowMinimizeBehavior(.disabled)
                    }
                    .windowResizability(.contentSize)
                    """,
                    note: "Removes the yellow traffic-light minimize button and the Window \u{203a} Minimize menu entry."
                )
            }

            VariantBlock(title: ".windowFullScreenBehavior(_:)") {
                WindowSnippet(
                    api: ".windowFullScreenBehavior(.disabled)",
                    code: """
                    WindowGroup {
                        ContentView()
                            .windowFullScreenBehavior(.disabled)
                    }
                    """,
                    note: "Suppresses the green-button full-screen action and the Window \u{203a} Enter Full Screen entry. Resize content remains usable; the window just can't go full-screen."
                )
            }

            VariantBlock(title: ".windowResizeBehavior(_:)") {
                WindowSnippet(
                    api: ".windowResizeBehavior(.disabled)",
                    code: """
                    Window("About MyApp", id: "about") {
                        AboutView()
                            .windowResizeBehavior(.disabled)
                            .windowMinimizeBehavior(.disabled)
                    }
                    .windowResizability(.contentSize)
                    """,
                    note: "Disables drag-resize handles. Pair with .windowResizability(.contentSize) for a truly fixed-size window matching its content frame."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "All four modifiers are View modifiers \u{2014} attach inside the window's content closure, not on the Scene.",
                "WindowResizability still gates the legal range; .windowResizeBehavior controls whether the user can interact at all.",
                "Apple's About-window pattern: .contentSize resizability + .windowMinimizeBehavior(.disabled) + .windowResizeBehavior(.disabled).",
                "Welcome / wizard windows often want .windowDismissBehavior(.disabled) + .windowMinimizeBehavior(.disabled) so they can't be dismissed prematurely.",
                "Window/.windowBackgroundDragBehavior(_:) is the Scene-level sibling \u{2014} covered in its own page."
            ])
        }
    }

    // MARK: Notes

    private struct WIBNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [WIBNote] = [
        .init(title: "One enum, five surfaces.",
              detail: "WindowInteractionBehavior values feed View/windowDismissBehavior, View/windowMinimizeBehavior, View/windowFullScreenBehavior, View/windowResizeBehavior, and Scene/windowBackgroundDragBehavior. The same .automatic/.enabled/.disabled vocabulary applies everywhere.",
              symbol: "switch.2"),
        .init(title: "View modifiers vs Scene modifier.",
              detail: "The four behaviors covered here are View modifiers \u{2014} attach to the window content. Background-drag is a Scene modifier (windowBackgroundDragBehavior on the Scene itself).",
              symbol: "rectangle.split.2x1"),
        .init(title: "Sendable.",
              detail: "WindowInteractionBehavior conforms to Sendable, so storing values in @State or passing them across actors is safe.",
              symbol: "checkmark.seal"),
        .init(title: "Composes with toolbar / titlebar configuration.",
              detail: "Disabling resize doesn't hide the title bar. Combine with .windowStyle(.hiddenTitleBar) or .toolbar(.hidden, for: .windowToolbar) for chrome-light fixed-size windows.",
              symbol: "rectangle.dashed"),
        .init(title: "macOS 15+ \u{2014} earlier targets need AppKit.",
              detail: "Pre-15 SwiftUI relied on NSWindow.styleMask and per-window AppKit configuration to disable interactions. macOS 15 surfaces these as first-class SwiftUI modifiers.",
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

extension WindowInteractionBehaviorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.windowInteractionBehavior",
        title: "WindowInteractionBehavior",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "WindowInteractionBehavior",
            "View/windowMinimizeBehavior(_:)",
            "View/windowFullScreenBehavior(_:)",
            "View/windowResizeBehavior(_:)",
            "Scene/windowBackgroundDragBehavior(_:)"
        ],
        blurb: "Options for enabling and disabling per-window interaction behaviors — minimize, full-screen, resize, and background drag.",
        signature: "struct WindowInteractionBehavior",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/windows/windowinteractionbehavior.md",
        page: { AnyView(WindowInteractionBehaviorGalleryPage()) }
    )
}

#Preview {
    WindowInteractionBehaviorGalleryPage()
        .frame(width: 1100, height: 800)
}
