import SwiftUI

// SwiftUI `View/toolbarVisibility(_:for:)` reference page.
// Source: Documentation/SwiftUI/toolbars/toolbarvisibility(_:for:).md
// macOS 15.0+. The non-deprecated replacement for .toolbar(_:for:).

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct ToolbarVisibilityModifierPage: View {
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
            Text("View/toolbarVisibility(_:for:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Specifies the visibility of a bar managed by SwiftUI. The non-deprecated form of .toolbar(_:for:).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbarvisibility(_:for:).md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".toolbarVisibility(.hidden, for: .windowToolbar)") {
            NavigationStack {
                Text("Window toolbar hidden via the modern modifier")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .toolbarVisibility(.hidden, for: .windowToolbar)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".visible / .hidden / .automatic on .windowToolbar") {
                DemoFrame(api: ".toolbarVisibility(.visible, for: .windowToolbar)") {
                    NavigationStack {
                        Text("Window toolbar forced visible")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbarVisibility(.visible, for: .windowToolbar)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: "Multiple placements at once \u{2014} variadic for: argument") {
                APICallout(".toolbarVisibility(.hidden, for: .navigationBar, .tabBar) // iOS")
                Text("On iOS / iPadOS you can pass several ToolbarPlacement values to update many bars in one call. .navigationBar and .tabBar are unavailable in the macOS SDK \u{2014} on macOS the analogous call uses .windowToolbar.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Bound to @State") {
                DemoFrame(api: ".toolbarVisibility(visibility, for: .windowToolbar)") {
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
                        .toolbarVisibility(visibility, for: .windowToolbar)
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
        .init(title: "Same shape as .toolbar(_:for:); use this one going forward.",
              detail: "macOS 15.0+. Apple deprecated .toolbar(_:for:) in 26.5 in favor of this name.",
              symbol: "checkmark.seal"),
        .init(title: "Variadic placements.",
              detail: ".toolbarVisibility(.hidden, for: .navigationBar, .tabBar). Empty / no placement defaults to .automatic.",
              symbol: "rectangle.stack"),
        .init(title: "Visibility flows up to the nearest container that renders a bar.",
              detail: "On macOS, that's the window root. Inside a TabView, the modifier targets that tab's nav bar / tab bar.",
              symbol: "arrow.up"),
        .init(title: "Same caveat about ToolbarCommands.",
              detail: "If your Scene wires .commands { ToolbarCommands() }, the menu item is disabled while this modifier's value is anything other than .automatic.",
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
    ToolbarVisibilityModifierPage()
        .frame(width: 1100, height: 900)
}
