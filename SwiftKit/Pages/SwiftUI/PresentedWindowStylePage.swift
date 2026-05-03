import SwiftUI

// SwiftUI `View/presentedWindowStyle(_:)` reference page.
// Source: Documentation/SwiftUI/windows/presentedwindowstyle(_:).md
// macOS 11.0+. Sets the WindowStyle for windows opened by interactions
// originating from this view (rather than the scene's own windows).

struct PresentedWindowStylePage: View {
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
            Text("View/presentedWindowStyle(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the WindowStyle for windows that interactions originating from this view present.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/presentedwindowstyle(_:).md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: ".presentedWindowStyle(.hiddenTitleBar)",
            code: """
            Button("Open editor") {
                openWindow(id: "editor")
            }
            .presentedWindowStyle(.hiddenTitleBar)
            """,
            note: "When this button (or any descendant) opens a window, the new window adopts .hiddenTitleBar without changing the source scene's own style."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Generic over WindowStyle") {
                WindowSnippet(
                    api: "func presentedWindowStyle<S: WindowStyle>(_ style: S) -> some View",
                    code: """
                    .presentedWindowStyle(.automatic)
                    .presentedWindowStyle(.titleBar)
                    .presentedWindowStyle(.hiddenTitleBar)
                    .presentedWindowStyle(.plain)
                    .presentedWindowStyle(.volumetric)
                    """,
                    note: "Same WindowStyle conformers as the scene-level windowStyle(_:) modifier."
                )
            }

            VariantBlock(title: "Compared to Scene/windowStyle(_:)") {
                WindowSnippet(
                    api: "Scene-level vs view-level window styling",
                    code: """
                    // Scene-level: applies to every window the scene creates.
                    WindowGroup { ContentView() }
                        .windowStyle(.hiddenTitleBar)

                    // View-level: applies only to windows OPENED FROM this view's interactions.
                    Button("Open viewer") { openWindow(id: "viewer") }
                        .presentedWindowStyle(.plain)
                    """,
                    note: "Use windowStyle on the scene for the scene's own chrome. Use presentedWindowStyle on a view to set the chrome of windows that view spawns."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "Cascades down the view tree \u{2014} child views' presented windows inherit unless they set their own.",
                "Affects only the next window opened from the view's interaction; doesn't retroactively restyle existing windows.",
                "Use generic WindowStyle conformers \u{2014} same vocabulary as scene-level windowStyle(_:).",
                "macOS 11+ \u{2014} same availability floor as windowStyle.",
                "Pair with presentedWindowToolbarStyle(_:) when you need both window chrome and toolbar style for the spawned window."
            ])
        }
    }

    // MARK: Notes

    private struct PWSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PWSNote] = [
        .init(title: "View-side companion to Scene/windowStyle(_:).",
              detail: "windowStyle is configured at the scene; presentedWindowStyle is configured at the view. Both feed the same WindowStyle protocol \u{2014} the difference is who the styling applies to.",
              symbol: "switch.2"),
        .init(title: "Useful for buttons that open auxiliary chrome-less windows.",
              detail: "Example: a Show palette button that opens a chrome-less floating window. Set .presentedWindowStyle(.plain) on the button so the spawned window starts with no title bar without affecting the rest of the app.",
              symbol: "rectangle.stack"),
        .init(title: "Cascades like other view modifiers.",
              detail: "Set it once on a parent container; descendants inherit unless they override. This composes well with feature-scoped view trees.",
              symbol: "rectangle.stack.badge.plus"),
        .init(title: "Pair with presentedWindowToolbarStyle for a complete spawn-time chrome spec.",
              detail: "presentedWindowStyle controls the window envelope; presentedWindowToolbarStyle controls the toolbar inside. Apply both to fully describe the spawned window's chrome.",
              symbol: "rectangle.topthird.inset.filled"),
        .init(title: "Doesn't replace .windowStyle on the destination scene.",
              detail: "If the destination scene's own .windowStyle is set, presentedWindowStyle from the source is the request \u{2014} the destination scene still ultimately decides. Treat this as a hint, not an override.",
              symbol: "exclamationmark.triangle")
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
    PresentedWindowStylePage()
        .frame(width: 1100, height: 800)
}
