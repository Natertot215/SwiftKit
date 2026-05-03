import SwiftUI

// SwiftUI `View/toolbarBackground(_:for:)` reference page.
// Source: Documentation/SwiftUI/toolbars/toolbarbackground(_:for:).md
// macOS 13.0+. Sets a ShapeStyle background for one or more bars.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct ToolbarBackgroundPage: View {
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
            Text("View/toolbarBackground(_:for:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Specifies the preferred ShapeStyle of the background of a SwiftUI-managed bar.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbarbackground(_:for:).md \u{00b7} macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".toolbarBackground(.regularMaterial, for: .windowToolbar)") {
            NavigationStack {
                Text("Regular material background on the window toolbar")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .toolbarBackground(.regularMaterial, for: .windowToolbar)
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
            VariantBlock(title: "Material backgrounds") {
                VStack(alignment: .leading, spacing: 12) {
                    DemoFrame(api: ".toolbarBackground(.ultraThinMaterial, for: .windowToolbar)") {
                        NavigationStack {
                            sample
                                .toolbarBackground(.ultraThinMaterial, for: .windowToolbar)
                        }
                    }
                    DemoFrame(api: ".toolbarBackground(.regularMaterial, for: .windowToolbar)") {
                        NavigationStack {
                            sample
                                .toolbarBackground(.regularMaterial, for: .windowToolbar)
                        }
                    }
                    DemoFrame(api: ".toolbarBackground(.thickMaterial, for: .windowToolbar)") {
                        NavigationStack {
                            sample
                                .toolbarBackground(.thickMaterial, for: .windowToolbar)
                        }
                    }
                }
            }

            VariantBlock(title: "Tinted backgrounds (semantic colors only)") {
                VStack(alignment: .leading, spacing: 12) {
                    DemoFrame(api: ".toolbarBackground(Color.accentColor, for: .windowToolbar)") {
                        NavigationStack {
                            sample
                                .toolbarBackground(Color.accentColor, for: .windowToolbar)
                        }
                    }
                    DemoFrame(api: ".toolbarBackground(.tint, for: .windowToolbar)") {
                        NavigationStack {
                            sample
                                .toolbarBackground(.tint, for: .windowToolbar)
                        }
                    }
                }
            }
        }
    }

    private var sample: some View {
        Text("Sample content")
            .font(.caption)
            .fontDesign(.monospaced)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button { } label: { Label("Add", systemImage: "plus") }
                }
            }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Companion modifiers") {
                VStack(alignment: .leading, spacing: 6) {
                    Label(".toolbarBackgroundVisibility(_:for:) \u{2014} pin or hide the chrome surface", systemImage: "eye")
                    Label(".toolbarColorScheme(_:for:) \u{2014} preferred color scheme inside the bar", systemImage: "circle.lefthalf.filled")
                    Label(".toolbarForegroundStyle(_:for:) \u{2014} item shape style", systemImage: "paintbrush")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }
        }
    }

    private struct ToolbarNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ToolbarNote] = [
        .init(title: "Takes any ShapeStyle.",
              detail: "Materials (.ultraThinMaterial, .regularMaterial, .thickMaterial) are the macOS-native choices. Color.accentColor and .tint are also valid. Per L-001/L-012, avoid hand-mixed Color(red:green:blue:).",
              symbol: "paintpalette"),
        .init(title: "Variadic placements.",
              detail: ".toolbarBackground(_, for: .navigationBar, .tabBar). Empty defaults to .automatic.",
              symbol: "rectangle.stack"),
        .init(title: "Visible only when the chrome surface is shown.",
              detail: "If the toolbar background is hidden (because of scroll-edge transitions or .toolbarBackgroundVisibility(.hidden)), the style sits dormant. Combine with .toolbarBackgroundVisibility(.visible) when you want the chrome always painted.",
              symbol: "eye"),
        .init(title: "Inside a TabView, the background applies while the tab is active.",
              detail: "Apple's docs: \"When used within a TabView, the specified style will be preferred while the tab is currently active.\" Wrap multiple tabs in a Group to apply the same background to all.",
              symbol: "rectangle.stack"),
        .init(title: "Pairs with .windowToolbarStyle on macOS.",
              detail: "WindowToolbarStyle decides the chrome envelope; toolbarBackground decides what fills it.",
              symbol: "rectangle")
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
    ToolbarBackgroundPage()
        .frame(width: 1100, height: 1200)
}
