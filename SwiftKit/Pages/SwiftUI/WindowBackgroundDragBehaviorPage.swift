import SwiftUI

// SwiftUI `Scene/windowBackgroundDragBehavior(_:)` reference page.
// Source: Documentation/SwiftUI/windows/windowbackgrounddragbehavior(_:).md
// macOS 15.0+. Uses the WindowInteractionBehavior enum.

struct WindowBackgroundDragBehaviorPage: View {
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
            Text("Scene/windowBackgroundDragBehavior(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Controls whether dragging the window's background moves the window. Takes a WindowInteractionBehavior value.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/windowbackgrounddragbehavior(_:).md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: ".windowBackgroundDragBehavior(.automatic)",
            code: """
            Window("About MyApp", id: "about") {
                AboutView()
            }
            .windowBackgroundDragBehavior(.automatic)
            """,
            note: "Default \u{2014} the system decides based on scene configuration. Most chrome-bearing windows leave background drag off; chrome-less windows benefit from .enabled."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".automatic \u{2014} system default") {
                WindowSnippet(
                    api: ".windowBackgroundDragBehavior(.automatic)",
                    code: """
                    Window(\u{2026}) { ContentView() }
                        .windowBackgroundDragBehavior(.automatic)
                    """,
                    note: "Equivalent to omitting the modifier. The framework picks based on the scene's other configuration."
                )
            }

            VariantBlock(title: ".enabled \u{2014} let users drag the window from anywhere on its background") {
                WindowSnippet(
                    api: ".windowBackgroundDragBehavior(.enabled)",
                    code: """
                    Window("About MyApp", id: "about") {
                        AboutView()
                    }
                    .windowBackgroundDragBehavior(.enabled)
                    """,
                    note: "Equivalent to attaching a WindowDragGesture to the window's background view. Useful for chrome-less windows."
                )
            }

            VariantBlock(title: ".disabled \u{2014} background drag suppressed") {
                WindowSnippet(
                    api: ".windowBackgroundDragBehavior(.disabled)",
                    code: """
                    Window(\u{2026}) { ContentView() }
                        .windowBackgroundDragBehavior(.disabled)
                    """,
                    note: "Use when the background should not move the window \u{2014} for example, a fixed-position widget."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "Scene modifier \u{2014} attach to the Scene declaration, not the View.",
                "Reuses the same WindowInteractionBehavior enum as the four behavior View modifiers (.automatic / .enabled / .disabled).",
                "Pair .enabled with .windowStyle(.plain) or .hiddenTitleBar for windows that lack a draggable title bar.",
                "Inserts a window-wide drag gesture; for finer control use WindowDragGesture on a specific subview.",
                "macOS-only \u{2014} no equivalent on iOS / iPadOS / visionOS."
            ])
        }
    }

    // MARK: Notes

    private struct WBDNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [WBDNote] = [
        .init(title: "Scene modifier, not View modifier.",
              detail: "Unlike windowDismissBehavior / windowMinimizeBehavior etc. (which attach to the View), windowBackgroundDragBehavior attaches to the Scene. This is consistent with the docs.",
              symbol: "rectangle.split.2x1"),
        .init(title: "Equivalent to attaching WindowDragGesture to the background.",
              detail: "Per Apple: \u{201C}Applying the .enabled behavior is equivalent to adding a WindowDragGesture to the window's background view.\u{201D} Use this when you want the affordance everywhere; reach for the gesture directly when only a specific subview should be the drag handle.",
              symbol: "hand.draw"),
        .init(title: "Pair with chrome-less window styles.",
              detail: "Using .windowStyle(.plain) removes the title bar \u{2014} meaning users have no built-in way to drag. Add .windowBackgroundDragBehavior(.enabled) so the window stays movable.",
              symbol: "rectangle.dashed"),
        .init(title: "Reuses WindowInteractionBehavior.",
              detail: "Same enum (.automatic / .enabled / .disabled) as the four behavior modifiers in the WindowInteractionBehavior page. One vocabulary, multiple surfaces.",
              symbol: "switch.2"),
        .init(title: "macOS 15+ only.",
              detail: "Earlier macOS apps achieved this with NSWindow.isMovableByWindowBackground = true on the underlying AppKit window. SwiftUI now exposes it as a first-class Scene modifier.",
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
    WindowBackgroundDragBehaviorPage()
        .frame(width: 1100, height: 800)
}
