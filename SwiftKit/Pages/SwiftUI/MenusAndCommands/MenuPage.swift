import SwiftUI

// SwiftUI `Menu` reference page.
// Covers: basic menu, label forms, submenu, and primary action.
// macOS 11.0+

struct MenuPage: View {
    @State private var selection = "None"

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
            Text("Menu")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A control for presenting a menu of actions or selections. Renders as a pull-down button on macOS.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/menus-and-commands/menu.md · macOS 11.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        MCard(api: "Menu(\"Actions\") { Button(\"New\") {}; Button(\"Open\") {} }") {
            Menu("Actions") {
                Button("New") { selection = "New" }
                Button("Open") { selection = "Open" }
                Button("Close") { selection = "Close" }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            MVariant(title: "String label") {
                MCard(api: "Menu(\"Edit\") { Button(\"Cut\") {}; Button(\"Copy\") {}; Button(\"Paste\") {} }") {
                    Menu("Edit") {
                        Button("Cut") { selection = "Cut" }
                        Button("Copy") { selection = "Copy" }
                        Button("Paste") { selection = "Paste" }
                    }
                }
            }

            MVariant(title: "View-builder label") {
                MCard(api: "Menu { … } label: { Label(\"Format\", systemImage: \"textformat\") }") {
                    Menu {
                        Button("Bold") { selection = "Bold" }
                        Button("Italic") { selection = "Italic" }
                        Button("Underline") { selection = "Underline" }
                    } label: {
                        Label("Format", systemImage: "textformat")
                    }
                }
            }

            MVariant(title: "Submenu (nested Menu)") {
                MCard(api: "Menu(\"File\") { Button(…); Menu(\"Export\") { Button(…) } }") {
                    Menu("File") {
                        Button("New") { selection = "New" }
                        Button("Open") { selection = "Open" }
                        Divider()
                        Menu("Export As") {
                            Button("PDF") { selection = "PDF" }
                            Button("PNG") { selection = "PNG" }
                            Button("JPEG") { selection = "JPEG" }
                        }
                    }
                }
            }

            MVariant(title: "With primaryAction — click triggers action, long-press opens menu") {
                MCard(api: "Menu(\"New\", systemImage: \"plus\") { … } primaryAction: { createNew() }") {
                    Menu("New", systemImage: "plus") {
                        Button("New Folder") { selection = "New Folder" }
                        Button("New File") { selection = "New File" }
                    } primaryAction: {
                        selection = "Quick New"
                    }
                }
            }

            MVariant(title: "With destructive item and Divider") {
                MCard(api: "Menu { Button(…); Divider(); Button(…, role: .destructive) }") {
                    Menu("Document") {
                        Button("Duplicate") { selection = "Duplicate" }
                        Button("Rename") { selection = "Rename" }
                        Divider()
                        Button("Delete", role: .destructive) { selection = "Delete" }
                    }
                }
            }

            MVariant(title: ".menuStyle(.button) — bordered button style") {
                MCard(api: ".menuStyle(.button)") {
                    Menu("Options") {
                        Button("Option A") { selection = "A" }
                        Button("Option B") { selection = "B" }
                    }
                    .menuStyle(.button)
                }
            }

            MVariant(title: "Last selection readout") {
                MCard(api: "Track which item was selected via @State") {
                    VStack(alignment: .leading, spacing: 8) {
                        Menu("Pick an Action") {
                            Button("Alpha") { selection = "Alpha" }
                            Button("Beta") { selection = "Beta" }
                            Button("Gamma") { selection = "Gamma" }
                        }
                        Text("Selected: \(selection)")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            MVariant(title: "Disabled") {
                MCard(api: "Menu(…).disabled(true)") {
                    Menu("Disabled Menu") {
                        Button("Action") {}
                    }.disabled(true)
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowM(symbol: "chevron.down", title: "Menu renders as a pull-down button on macOS.",
                     detail: "The system draws a chevron to indicate more items. The appearance is equivalent to NSPopUpButton with pullsDown:true. Use MenuStyle to customize.")
            NoteRowM(symbol: "cursorarrow.click.2", title: "primaryAction separates click from long-press.",
                     detail: "With primaryAction:, a click triggers the primary action and a long-press (or click-hold) opens the menu. This is the 'split button' pattern from AppKit.")
            NoteRowM(symbol: "divide", title: "Divider() inserts a separator line in the menu.",
                     detail: "Use Divider() between logical groups of menu items. On macOS this renders as an NSMenuItem separator. It is ignored when used outside a Menu or contextMenu.")
        }
    }
}

private struct MCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .padding(12)
                .frame(minWidth: 280, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct MVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowM: View {
    let symbol: String
    let title: String
    let detail: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol).font(.headline).foregroundStyle(.primary)
            Text(detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
        }
    }
}

#Preview {
    MenuPage().frame(width: 800, height: 1000)
}
