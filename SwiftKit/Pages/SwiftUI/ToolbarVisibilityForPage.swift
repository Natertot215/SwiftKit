import SwiftUI

// SwiftUI `View/toolbar(_:for:)` reference page.
// Source: Documentation/SwiftUI/toolbars/toolbar(_:for:).md
// macOS 13.0+ (deprecated 26.5 in favor of toolbarVisibility(_:for:)).
// Sets the preferred Visibility of one or more bars (ToolbarPlacement).

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct ToolbarVisibilityForPage: View {
    @State private var visibility: Visibility = .automatic

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

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/toolbar(_:for:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Specifies the visibility of a bar managed by SwiftUI. Pass a Visibility and one or more ToolbarPlacement values.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbar(_:for:).md \u{00b7} macOS 13.0+ (deprecated 26.5 \u{2014} use toolbarVisibility(_:for:))")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".toolbar(.hidden, for: .windowToolbar)") {
            NavigationStack {
                Text(".windowToolbar hidden \u{2014} the entire titlebar disappears on macOS")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .toolbar(.hidden, for: .windowToolbar)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".visible \u{2014} force visible") {
                DemoFrame(api: ".toolbar(.visible, for: .windowToolbar)") {
                    NavigationStack {
                        Text("Window toolbar forced visible")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar(.visible, for: .windowToolbar)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: ".hidden \u{2014} hide the bar") {
                DemoFrame(api: ".toolbar(.hidden, for: .windowToolbar)") {
                    NavigationStack {
                        Text("Window toolbar hidden")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar(.hidden, for: .windowToolbar)
                    }
                }
            }

            VariantBlock(title: ".automatic \u{2014} system default") {
                DemoFrame(api: ".toolbar(.automatic, for: .windowToolbar)") {
                    NavigationStack {
                        Text("System decides per platform")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar(.automatic, for: .windowToolbar)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Bound to @State") {
                DemoFrame(api: ".toolbar(visibility, for: .windowToolbar)") {
                    NavigationStack {
                        VStack(spacing: 8) {
                            Picker("Visibility", selection: $visibility) {
                                Text(".automatic").tag(Visibility.automatic)
                                Text(".visible").tag(Visibility.visible)
                                Text(".hidden").tag(Visibility.hidden)
                            }
                            .pickerStyle(.segmented)
                            Text(label(for: visibility))
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .toolbar(visibility, for: .windowToolbar)
                        .toolbar {
                            ToolbarItem(placement: .primaryAction) {
                                Button { } label: { Label("Add", systemImage: "plus") }
                            }
                        }
                    }
                }
            }
        }
    }

    private func label(for visibility: Visibility) -> String {
        switch visibility {
        case .automatic: return ".automatic"
        case .visible:   return ".visible"
        case .hidden:    return ".hidden"
        @unknown default: return String(describing: visibility)
        }
    }

    private struct ToolbarNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ToolbarNote] = [
        .init(title: "Deprecated in 26.5 \u{2014} prefer .toolbarVisibility(_:for:).",
              detail: "Same signature, same behavior. The non-deprecated form has its own gallery page (toolbarVisibility(_:for:)) but the underlying mechanic is identical.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Visibility flows up to the nearest container that renders a bar.",
              detail: "On macOS that's typically the WindowGroup root. On iOS it's the enclosing NavigationView/TabView.",
              symbol: "arrow.up"),
        .init(title: "Pass multiple ToolbarPlacement values to update several bars at once.",
              detail: "The signature is variadic: .toolbar(.hidden, for: .navigationBar, .tabBar). Empty / no placement defaults to .automatic.",
              symbol: "rectangle.stack"),
        .init(title: "Use .windowToolbar to hide the entire macOS titlebar.",
              detail: "Apple's example: .toolbar(.hidden, for: .windowToolbar) inside a NavigationView removes the chrome envelope. Combine with .windowStyle(.hiddenTitleBar) at the Scene level for a fully chromeless window.",
              symbol: "macwindow"),
        .init(title: "Interacts with ToolbarCommands.",
              detail: "If you wire ToolbarCommands into your Scene .commands { } block, this modifier disables the toolbar visibility menu item while the value is anything other than .automatic.",
              symbol: "menubar.rectangle")
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

private struct DemoFrame<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
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
    ToolbarVisibilityForPage()
        .frame(width: 1100, height: 900)
}
