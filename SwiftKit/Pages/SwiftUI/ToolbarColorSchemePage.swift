import SwiftUI

// SwiftUI `View/toolbarColorScheme(_:for:)` reference page.
// Source: Documentation/SwiftUI/toolbars/toolbarcolorscheme(_:for:).md
// macOS 13.0+. Pin the color scheme of a bar's content (light / dark / nil = system).

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct ToolbarColorSchemePage: View {
    @State private var scheme: ColorScheme = .dark

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
            Text("View/toolbarColorScheme(_:for:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Specifies the preferred color scheme of a SwiftUI-managed bar. Pass nil to defer to the system.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbarcolorscheme(_:for:).md \u{00b7} macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".toolbarBackground(.tint, for: .windowToolbar).toolbarColorScheme(.dark, for: .windowToolbar)") {
            NavigationStack {
                Text(".dark color scheme on top of a tinted background")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .toolbarBackground(.tint, for: .windowToolbar)
                    .toolbarBackgroundVisibility(.visible, for: .windowToolbar)
                    .toolbarColorScheme(.dark, for: .windowToolbar)
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
            VariantBlock(title: ".light \u{2014} force light scheme") {
                DemoFrame(api: ".toolbarColorScheme(.light, for: .windowToolbar)") {
                    NavigationStack {
                        Text("Light items, regardless of system appearance")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbarBackground(.tint, for: .windowToolbar)
                            .toolbarBackgroundVisibility(.visible, for: .windowToolbar)
                            .toolbarColorScheme(.light, for: .windowToolbar)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: ".dark \u{2014} force dark scheme") {
                DemoFrame(api: ".toolbarColorScheme(.dark, for: .windowToolbar)") {
                    NavigationStack {
                        Text("Dark items, regardless of system appearance")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbarBackground(.tint, for: .windowToolbar)
                            .toolbarBackgroundVisibility(.visible, for: .windowToolbar)
                            .toolbarColorScheme(.dark, for: .windowToolbar)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: "nil \u{2014} match system") {
                DemoFrame(api: ".toolbarColorScheme(nil, for: .windowToolbar)") {
                    NavigationStack {
                        Text("Defers to the current system color scheme")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbarColorScheme(nil, for: .windowToolbar)
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
                DemoFrame(api: ".toolbarColorScheme(scheme, for: .windowToolbar)") {
                    NavigationStack {
                        VStack(spacing: 8) {
                            Picker("Scheme", selection: $scheme) {
                                Text(".light").tag(ColorScheme.light)
                                Text(".dark").tag(ColorScheme.dark)
                            }
                            .pickerStyle(.segmented)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .toolbarBackground(.tint, for: .windowToolbar)
                        .toolbarBackgroundVisibility(.visible, for: .windowToolbar)
                        .toolbarColorScheme(scheme, for: .windowToolbar)
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
        .init(title: "Pass nil to defer to the system.",
              detail: "ColorScheme? \u{2014} nil means \"use whatever the system color scheme is.\" Useful when an enclosing modifier already set a scheme but a child wants to opt back out.",
              symbol: "circle.lefthalf.filled"),
        .init(title: "Only respected while a background is visible.",
              detail: "From the docs: \"the provided color scheme is only respected while a background is visible in the requested bar.\" Combine with .toolbarBackground(\u{2026}) + .toolbarBackgroundVisibility(.visible) for guaranteed effect.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Variadic placements.",
              detail: ".toolbarColorScheme(.dark, for: .navigationBar, .tabBar). Empty placement defaults to .automatic.",
              symbol: "rectangle.stack"),
        .init(title: "Compose with .toolbarBackground for branded toolbars.",
              detail: "Common pattern: tinted background + dark color scheme so toolbar items render light on a saturated color. Apple's docs show this exact recipe.",
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
    ToolbarColorSchemePage()
        .frame(width: 1100, height: 1100)
}
