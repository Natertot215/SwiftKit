import SwiftUI

// SwiftUI `Scene/windowToolbarLabelStyle` reference page.
// Sources:
//   Documentation/SwiftUI/windows/windowtoolbarlabelstyle(_:).md     (binding form, user-configurable)
//   Documentation/SwiftUI/windows/windowtoolbarlabelstyle(fixed:).md (fixed form)
// macOS 15.0+. Configures whether toolbar items render as icon-only,
// title-only, or icon-and-title.

struct WindowToolbarLabelStylePage: View {
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
            Text("Scene/windowToolbarLabelStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the label style of items in a scene's toolbar \u{2014} either user-configurable via a binding, or fixed.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/windowtoolbarlabelstyle(_:).md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: ".windowToolbarLabelStyle(fixed: .iconOnly)",
            code: """
            WindowGroup {
                ContentView()
                    .toolbar(id: "browserToolbar") { /* items */ }
            }
            .windowToolbarLabelStyle(fixed: .iconOnly)
            """,
            note: "Fixed style \u{2014} the user cannot change it via the toolbar's Customize\u{2026} affordance."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Fixed \u{2014} .windowToolbarLabelStyle(fixed:)") {
                WindowSnippet(
                    api: ".windowToolbarLabelStyle(fixed: ToolbarLabelStyle)",
                    code: """
                    @main
                    struct MyApp: App {
                        var body: some Scene {
                            WindowGroup {
                                ContentView()
                                    .toolbar(id: "browserToolbar") { /* items */ }
                            }
                            .windowToolbarLabelStyle(fixed: .iconOnly)
                        }
                    }
                    """,
                    note: "Use when the label style is non-negotiable for the app. The user has no UI to change it."
                )
            }

            VariantBlock(title: "User-configurable \u{2014} .windowToolbarLabelStyle(_:) with a Binding") {
                WindowSnippet(
                    api: ".windowToolbarLabelStyle($labelStyle) // backed by @AppStorage",
                    code: """
                    @main
                    struct MyApp: App {
                        @AppStorage("ToolbarLabelStyle")
                        private var labelStyle: ToolbarLabelStyle = .iconOnly

                        var body: some Scene {
                            WindowGroup {
                                ContentView()
                                    .toolbar(id: "browserToolbar") { /* items */ }
                            }
                            .windowToolbarLabelStyle($labelStyle)
                        }
                    }
                    """,
                    note: "Bind to @AppStorage so the toolbar's Customize\u{2026} sheet can let the user pick icon-only, title-only, or both — and the choice persists across launches."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "ToolbarLabelStyle is the value type \u{2014} typical cases: .iconOnly, .titleOnly, .titleAndIcon.",
                "The fixed: form locks the choice; the Binding form exposes it to the user.",
                "Pair with .toolbar(id: \u{2026}) so SwiftUI knows which toolbar to apply the label style to.",
                "The Binding form is what surfaces the \u{201C}Show: Icon / Text / Both\u{201D} option in macOS toolbar customization.",
                "Persist the binding via @AppStorage to maintain the user's preference."
            ])
        }
    }

    // MARK: Notes

    private struct WTLSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [WTLSNote] = [
        .init(title: "Two scene modifiers, one job.",
              detail: "Apple ships windowToolbarLabelStyle(_:) (Binding<ToolbarLabelStyle>) and windowToolbarLabelStyle(fixed: ToolbarLabelStyle). Pick the binding form when the user should be able to change it; pick the fixed form when they shouldn't.",
              symbol: "switch.2"),
        .init(title: "The toolbar must be a customizable toolbar.",
              detail: "Both modifiers expect a .toolbar(id: \u{2026}) toolbar that supports customization. Without an id, the user has no surface to change the label style even if you used the Binding form.",
              symbol: "wrench.and.screwdriver"),
        .init(title: "Defaults vary by platform.",
              detail: "macOS, iPadOS, and visionOS pick sensible per-platform defaults. Set the modifier explicitly when the default doesn't suit the design.",
              symbol: "globe"),
        .init(title: "Pair with @AppStorage for persistence.",
              detail: "The Binding form is most useful when the bound value lives in @AppStorage so the choice survives app relaunches. Other persistence (@SceneStorage, custom storage) works too \u{2014} avoid plain @State here, since it resets when the scene rebuilds.",
              symbol: "externaldrive"),
        .init(title: "Document/Settings scenes don't get this knob.",
              detail: "These modifiers target Scene chrome generally. DocumentGroup and Settings have their own toolbar conventions; check the per-scene docs before adding the modifier.",
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
    WindowToolbarLabelStylePage()
        .frame(width: 1100, height: 800)
}
