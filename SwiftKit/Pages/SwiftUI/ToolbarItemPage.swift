import SwiftUI

// SwiftUI `ToolbarItem` reference page.
// Source: Documentation/SwiftUI/toolbars/toolbaritem.md
// macOS 11.0+. Inits: init(placement:content:), init(id:placement:content:),
// init(id:placement:showsByDefault:content:). Conforms to ToolbarContent and
// CustomizableToolbarContent (when given an id).

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct ToolbarItemPage: View {
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
            Text("ToolbarItem")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A model that represents an item which can be placed in the toolbar or navigation bar.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbaritem.md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: "ToolbarItem(placement: .primaryAction) { Button \u{2026} }") {
            NavigationStack {
                Text("Placement = .primaryAction")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
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
            VariantBlock(title: "init(placement:content:) \u{2014} the most common form") {
                DemoFrame(api: "ToolbarItem(placement: .primaryAction) { Button \u{2026} }") {
                    NavigationStack {
                        Text("Single primary action")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: "init(id:placement:content:) \u{2014} required for customizable toolbars") {
                DemoFrame(api: ".toolbar(id:) { ToolbarItem(id: \"add\", placement: .secondaryAction) { \u{2026} } }") {
                    NavigationStack {
                        Text("Customizable: id required")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar(id: "demo-toolbar") {
                                ToolbarItem(id: "add", placement: .secondaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                                ToolbarItem(id: "share", placement: .secondaryAction) {
                                    Button { } label: { Label("Share", systemImage: "square.and.arrow.up") }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: "init(id:placement:showsByDefault:content:) \u{2014} hidden until added in Customize\u{2026}") {
                DemoFrame(api: "ToolbarItem(id: \"info\", placement: .secondaryAction, showsByDefault: false) { \u{2026} }") {
                    NavigationStack {
                        Text("Info hidden by default")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar(id: "demo-toolbar-2") {
                                ToolbarItem(id: "add", placement: .secondaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                                ToolbarItem(id: "info", placement: .secondaryAction, showsByDefault: false) {
                                    Button { } label: { Label("Info", systemImage: "info.circle") }
                                }
                            }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Different content shapes \u{2014} icon, label, text") {
                DemoFrame(api: "ToolbarItem { Button(systemImage:) | Button(Label) | Button(\"Text\") }") {
                    NavigationStack {
                        Text("Three shapes of button")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Image(systemName: "plus") }
                                }
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Share", systemImage: "square.and.arrow.up") }
                                }
                                ToolbarItem(placement: .primaryAction) {
                                    Button("Done") { }
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
        .init(title: "Three initializers \u{2014} pick by need.",
              detail: "init(placement:content:) for fixed toolbars. init(id:placement:content:) when used inside .toolbar(id:) so the system can persist user customization. init(id:placement:showsByDefault:content:) when an item should be available in the Customize\u{2026} panel but absent from the default layout.",
              symbol: "list.number"),
        .init(title: "Conforms to both ToolbarContent and CustomizableToolbarContent.",
              detail: "ToolbarItem(id:) appears anywhere CustomizableToolbarContent is required (i.e. inside .toolbar(id:)) \u{2014} the unidentified initializer is plain ToolbarContent only.",
              symbol: "rectangle.connected.to.line.below"),
        .init(title: "Placement chooses the semantic region; see ToolbarItemPlacement.",
              detail: "On macOS the common placements are .primaryAction, .secondaryAction, .navigation, .principal, .cancellationAction, .confirmationAction, .destructiveAction, .status, .automatic.",
              symbol: "rectangle.split.3x1"),
        .init(title: "Wrap a single control \u{2014} use ToolbarItemGroup for multiple.",
              detail: "Each ToolbarItem maps to one renderable item. If you put a HStack of two buttons inside one ToolbarItem the system treats them as a single item for layout, spacing, and overflow.",
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
    ToolbarItemPage()
        .frame(width: 1100, height: 900)
}
