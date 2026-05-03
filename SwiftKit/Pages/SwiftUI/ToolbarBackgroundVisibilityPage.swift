import SwiftUI

// SwiftUI `View/toolbarBackgroundVisibility(_:for:)` reference page.
// Source: Documentation/SwiftUI/toolbars/toolbarbackgroundvisibility(_:for:).md
// macOS 15.0+. Forces the background of a bar to be visible/hidden, independent
// of scroll position.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct ToolbarBackgroundVisibilityPage: View {
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
            Text("View/toolbarBackgroundVisibility(_:for:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Specifies the preferred visibility of backgrounds on a SwiftUI-managed bar. Pin the bar background visible regardless of scroll state.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbarbackgroundvisibility(_:for:).md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".toolbarBackgroundVisibility(.visible, for: .windowToolbar)") {
            NavigationStack {
                Text("Background pinned visible")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .toolbarBackgroundVisibility(.visible, for: .windowToolbar)
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            Button { } label: { Label("Add", systemImage: "plus") }
                        }
                    }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".visible \u{2014} always show the background") {
                DemoFrame(api: ".toolbarBackgroundVisibility(.visible, for: .windowToolbar)") {
                    NavigationStack {
                        Text("Background always visible \u{2014} useful when content scrolls behind the toolbar")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbarBackgroundVisibility(.visible, for: .windowToolbar)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: ".hidden \u{2014} drop the background") {
                DemoFrame(api: ".toolbarBackgroundVisibility(.hidden, for: .windowToolbar)") {
                    NavigationStack {
                        Text("Background hidden \u{2014} content shows through")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbarBackgroundVisibility(.hidden, for: .windowToolbar)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: ".automatic \u{2014} follow scroll context") {
                DemoFrame(api: ".toolbarBackgroundVisibility(.automatic, for: .windowToolbar)") {
                    NavigationStack {
                        Text(".automatic \u{2014} system fades the background based on scroll-edge alignment on iOS; macOS treats this as the default chrome.")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbarBackgroundVisibility(.automatic, for: .windowToolbar)
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

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Bound to @State") {
                DemoFrame(api: ".toolbarBackgroundVisibility(visibility, for: .windowToolbar)") {
                    NavigationStack {
                        VStack(spacing: 8) {
                            Picker("Visibility", selection: $visibility) {
                                Text(".automatic").tag(Visibility.automatic)
                                Text(".visible").tag(Visibility.visible)
                                Text(".hidden").tag(Visibility.hidden)
                            }
                            .pickerStyle(.segmented)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .toolbarBackgroundVisibility(visibility, for: .windowToolbar)
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

    private struct ToolbarNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ToolbarNote] = [
        .init(title: "Different from .toolbarVisibility(_:for:).",
              detail: "This modifier controls the bar's BACKGROUND, not the bar itself. The toolbar items remain visible \u{2014} only the chrome surface behind them is shown or hidden.",
              symbol: "rectangle"),
        .init(title: "Most relevant on iOS scroll-edge transitions.",
              detail: "On iOS, .automatic fades the background as a List/ScrollView reaches the edge. Setting .visible keeps the chrome opaque even mid-scroll. macOS toolbars stay opaque by default.",
              symbol: "iphone"),
        .init(title: "Variadic placements.",
              detail: "Same shape as the visibility modifier: pass one or more ToolbarPlacement values (.windowToolbar, .navigationBar, .tabBar, etc.).",
              symbol: "rectangle.stack"),
        .init(title: "Pairs with .toolbarBackground(_:for:) and .toolbarColorScheme(_:for:).",
              detail: "Background visibility decides WHETHER the chrome is drawn; toolbarBackground decides WHAT shape style fills it; toolbarColorScheme decides HOW the items contrast against it.",
              symbol: "paintpalette")
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
    ToolbarBackgroundVisibilityPage()
        .frame(width: 1100, height: 900)
}
