import SwiftUI

// SwiftUI .toolbarTitleMenu(content:) + ToolbarTitleMenu reference page.
// Sources:
//   Documentation/SwiftUI/toolbars/toolbartitlemenu(content:).md
//   Documentation/SwiftUI/toolbars/toolbartitlemenu.md
// macOS 13.0+. The macOS document-window pattern: a menu attached to the
// document title that surfaces Save / Print / Duplicate / Move\u{2026} actions.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 240

struct ToolbarTitleMenuPage: View {
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
            Text("View/toolbarTitleMenu(content:) + ToolbarTitleMenu")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds a menu attached to the toolbar title. The standard macOS document-title menu (Save, Print, Duplicate, Move\u{2026}) flows from this surface.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbartitlemenu(content:).md \u{00b7} macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".toolbar { ToolbarTitleMenu() }") {
            NavigationStack {
                Text("Default ToolbarTitleMenu \u{2014} populated by app commands like .saveItem, .printItem")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .navigationTitle("Untitled")
                    .toolbar {
                        ToolbarTitleMenu()
                    }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "ToolbarTitleMenu() \u{2014} no content (system populates)") {
                DemoFrame(api: "ToolbarTitleMenu() // inside .toolbar { }") {
                    NavigationStack {
                        Text("System fills the menu from the app's CommandGroupPlacement.saveItem / .printItem / etc.")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .navigationTitle("Document")
                            .toolbar {
                                ToolbarTitleMenu()
                            }
                    }
                }
            }

            VariantBlock(title: "ToolbarTitleMenu(content:) \u{2014} custom actions override defaults") {
                DemoFrame(api: "ToolbarTitleMenu { Button(\"Duplicate\") {}; Button(\"Print\") {} }") {
                    NavigationStack {
                        Text("Custom items shown in place of the default")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .navigationTitle("Document")
                            .toolbar {
                                ToolbarTitleMenu {
                                    Button("Duplicate") { }
                                    Button("Print\u{2026}") { }
                                    Divider()
                                    Button("Move To\u{2026}") { }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: ".toolbarTitleMenu(content:) \u{2014} the View-modifier form") {
                DemoFrame(api: ".toolbarTitleMenu { Button(\"Duplicate\") {} }") {
                    NavigationStack {
                        Text("Equivalent to placing a ToolbarTitleMenu inside .toolbar { }; just a different call site.")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .navigationTitle("Document")
                            .toolbarTitleMenu {
                                Button("Duplicate") { }
                                Button("Print\u{2026}") { }
                            }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Two surfaces") {
                VStack(alignment: .leading, spacing: 6) {
                    Label("ToolbarTitleMenu \u{2014} the type, used inside .toolbar { } closures", systemImage: "rectangle.connected.to.line.below")
                    Label(".toolbarTitleMenu(content:) \u{2014} the View modifier, sugar over the type", systemImage: "wand.and.stars")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }

            VariantBlock(title: "Conformance") {
                APICallout("ToolbarTitleMenu: CustomizableToolbarContent, ToolbarContent")
                Text("As CustomizableToolbarContent, the title menu can live inside .toolbar(id:) and be referenced by the customization sheet.")
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
        .init(title: "macOS document-window pattern.",
              detail: "On macOS the title-menu is what you click on a document window's title to get Save, Print, Duplicate, Move\u{2026}. SwiftUI populates the default menu from your app's command groups; you override or extend with content closures.",
              symbol: "doc.text"),
        .init(title: "iOS surface: tap the navigation title.",
              detail: "From Apple's docs: \"In iOS and iPadOS, this will construct a menu that can be presented by tapping the navigation title in the app's navigation bar.\" Same model, different platform gesture.",
              symbol: "iphone"),
        .init(title: "Default vs override.",
              detail: "ToolbarTitleMenu() with no content: system populates from command groups. ToolbarTitleMenu { \u{2026} } or .toolbarTitleMenu { \u{2026} }: your closure replaces the default.",
              symbol: "arrow.triangle.swap"),
        .init(title: "Two initializers, one symbol.",
              detail: "init() and init(content:). Pair with the View-modifier .toolbarTitleMenu(content:) for a smaller call site.",
              symbol: "list.number")
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
    ToolbarTitleMenuPage()
        .frame(width: 1100, height: 900)
}
