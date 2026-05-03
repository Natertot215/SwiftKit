import SwiftUI

// SwiftUI `ToolbarSpacer` reference page.
// Source: Documentation/SwiftUI/toolbars/toolbarspacer.md
// macOS 26.0+. Standard space item between toolbar items \u{2014} fixed or flexible.
// Conforms to CustomizableToolbarContent (and ToolbarContent), so it works
// inside both .toolbar { } and .toolbar(id:) { } closures.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct ToolbarSpacerPage: View {
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
            Text("ToolbarSpacer")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Standard space item in toolbars. Use SpacerSizing to choose .fixed or .flexible behavior.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbarspacer.md \u{00b7} macOS 26.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: "ToolbarSpacer(.fixed)") {
            NavigationStack {
                Text("Fixed spacer between two action clusters")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .toolbar(id: "spacer-default") {
                        ToolbarItem(id: "tag") {
                            Button { } label: { Label("Tag", systemImage: "tag") }
                        }
                        ToolbarItem(id: "share") {
                            Button { } label: { Label("Share", systemImage: "square.and.arrow.up") }
                        }
                        ToolbarSpacer(.fixed)
                        ToolbarItem(id: "more") {
                            Button { } label: { Label("More", systemImage: "ellipsis.circle") }
                        }
                    }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "ToolbarSpacer(.fixed) \u{2014} system-defined gap") {
                DemoFrame(api: "ToolbarSpacer(.fixed)") {
                    NavigationStack {
                        Text(".fixed inserts a small standard gap")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar(id: "spacer-fixed") {
                                ToolbarItem(id: "a") {
                                    Button { } label: { Image(systemName: "bold") }
                                }
                                ToolbarSpacer(.fixed)
                                ToolbarItem(id: "b") {
                                    Button { } label: { Image(systemName: "italic") }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: "ToolbarSpacer(.flexible) \u{2014} pushes items apart") {
                DemoFrame(api: "ToolbarSpacer(.flexible)") {
                    NavigationStack {
                        Text(".flexible expands to push items to opposite ends")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar(id: "spacer-flex") {
                                ToolbarItem(id: "back") {
                                    Button { } label: { Image(systemName: "chevron.left") }
                                }
                                ToolbarSpacer(.flexible)
                                ToolbarItem(id: "next") {
                                    Button { } label: { Image(systemName: "chevron.right") }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: "Multiple spacers in a customizable toolbar") {
                DemoFrame(api: "ToolbarSpacer(.fixed) \u{00d7} 2 around grouped items") {
                    NavigationStack {
                        Text("Three clusters, two fixed spacers")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar(id: "spacer-multi") {
                                ToolbarItem(id: "tag") {
                                    Button { } label: { Image(systemName: "tag") }
                                }
                                ToolbarSpacer(.fixed)
                                ToolbarItem(id: "share") {
                                    Button { } label: { Image(systemName: "square.and.arrow.up") }
                                }
                                ToolbarSpacer(.fixed)
                                ToolbarItem(id: "more") {
                                    Button { } label: { Image(systemName: "ellipsis.circle") }
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
            VariantBlock(title: "Side-by-side: .fixed vs .flexible") {
                APICallout("ToolbarSpacer(SpacerSizing) \u{2014} .fixed is constant width, .flexible greedy")
                Text("Spacers in customizable toolbars are themselves customizable: users can add, remove, or rearrange them via the macOS Customize Toolbar\u{2026} sheet.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct ToolbarNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ToolbarNote] = [
        .init(title: "macOS 26+ \u{2014} not available on earlier macOS releases.",
              detail: "Before macOS 26 the typical spacer pattern was a Spacer() inside a ToolbarItemGroup, which is brittle. ToolbarSpacer is the supported replacement.",
              symbol: "calendar"),
        .init(title: "init(_:placement:) \u{2014} pass a SpacerSizing value.",
              detail: ".fixed = system-defined small gap. .flexible = greedy, pushes items to opposite ends. Optional placement: argument lets you target a specific region.",
              symbol: "ruler"),
        .init(title: "Conforms to CustomizableToolbarContent.",
              detail: "Spacers can live inside .toolbar(id:) and be added/removed/rearranged by the user. If the toolbar supports a spacer of a given type, the user can also add multiple copies of it from the Customize\u{2026} panel.",
              symbol: "slider.horizontal.3"),
        .init(title: "Pairs with SpacerSizing \u{2014} the type that drives behavior.",
              detail: "See the SpacerSizing reference page for the two cases. The type exists specifically to coordinate with ToolbarSpacer.",
              symbol: "rectangle.connected.to.line.below")
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
    ToolbarSpacerPage()
        .frame(width: 1100, height: 900)
}
