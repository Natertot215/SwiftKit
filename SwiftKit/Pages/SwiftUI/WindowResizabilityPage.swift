import SwiftUI

// SwiftUI `WindowResizability` + `Scene/windowResizability(_:)` reference page.
// Sources:
//   Documentation/SwiftUI/windows/windowresizability.md
//   Documentation/SwiftUI/windows/windowresizability(_:).md
// macOS 13.0+. Three values: .automatic, .contentMinSize, .contentSize.

struct WindowResizabilityPage: View {
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
            Text("WindowResizability")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Tells the framework how to derive a window's minimum and maximum size from the scene's content.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/windowresizability.md \u{00b7} macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: ".windowResizability(.automatic)",
            code: """
            WindowGroup {
                ContentView()
            }
            .windowResizability(.automatic)
            """,
            note: "Default \u{2014} Settings windows use .contentSize, every other scene uses .contentMinSize. visionOS volumetric scenes also use .contentSize."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".automatic \u{2014} system picks per scene type") {
                WindowSnippet(
                    api: ".windowResizability(.automatic)",
                    code: """
                    WindowGroup { ContentView() }
                        .windowResizability(.automatic)
                    """,
                    note: "WindowGroup, Window \u{2192} .contentMinSize. Settings, volumetric \u{2192} .contentSize. The default if you omit the modifier."
                )
            }

            VariantBlock(title: ".contentMinSize \u{2014} content's min/max derived; max is open") {
                WindowSnippet(
                    api: ".windowResizability(.contentMinSize)",
                    code: """
                    WindowGroup {
                        ContentView()
                            .frame(minWidth: 400, minHeight: 300)
                    }
                    .windowResizability(.contentMinSize)
                    """,
                    note: "Window enforces the content's minimum frame; users can resize freely above that."
                )
            }

            VariantBlock(title: ".contentSize \u{2014} content's min and max are the window's bounds") {
                WindowSnippet(
                    api: ".windowResizability(.contentSize)",
                    code: """
                    WindowGroup {
                        ContentView()
                            .frame(
                                minWidth: 100, maxWidth: 400,
                                minHeight: 100, maxHeight: 400)
                    }
                    .windowResizability(.contentSize)
                    """,
                    note: "Window resize is clamped to the content's min/max bounds in both dimensions \u{2014} useful for fixed-size palettes."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                ".automatic varies by scene: WindowGroup/Window \u{2192} .contentMinSize, Settings \u{2192} .contentSize.",
                ".contentMinSize: window has a minimum derived from content, no upper limit beyond the screen.",
                ".contentSize: window matches the content frame's min and max in both dimensions.",
                "Pair with .frame(minWidth:maxWidth:minHeight:maxHeight:) on the content for the bounds to take effect.",
                "Volumetric windows (visionOS) always use .contentSize regardless of this modifier."
            ])
        }
    }

    // MARK: Notes

    private struct WRNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [WRNote] = [
        .init(title: "Resizability is opinionated about your frame modifier.",
              detail: ".contentSize and .contentMinSize both look at the content's .frame(min/maxWidth:min/maxHeight:). If you don't supply that, the framework falls back to whatever the content naturally sizes to.",
              symbol: "rectangle.expand.vertical"),
        .init(title: "Use .contentSize for inspectors and About windows.",
              detail: "Apple's documented About / Welcome examples pair .contentSize with .windowMinimizeBehavior(.disabled) and .windowResizeBehavior(.disabled). The user can't grow the window past its content frame.",
              symbol: "info.bubble"),
        .init(title: ".automatic is the default \u{2014} you usually don't need this modifier.",
              detail: "Reach for it when you specifically need the window's max size to track the content (.contentSize), or when the content's min frame should hard-stop user resize.",
              symbol: "wand.and.stars"),
        .init(title: "Resizability composes with windowResizeBehavior(_:).",
              detail: "windowResizability(_:) sets the legal range; .windowResizeBehavior(_:) decides whether the user can resize at all. Use .contentSize + .windowResizeBehavior(.disabled) for truly fixed-size windows.",
              symbol: "lock.rectangle")
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
    WindowResizabilityPage()
        .frame(width: 1100, height: 800)
}
