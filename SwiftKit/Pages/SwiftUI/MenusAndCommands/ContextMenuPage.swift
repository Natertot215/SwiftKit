import SwiftUI

// SwiftUI `View/contextMenu(menuItems:)` and related context menu modifiers.
// Covers all three contextMenu variants:
//   1. contextMenu(menuItems:)
//   2. contextMenu(menuItems:preview:)
//   3. contextMenu(forSelectionType:menu:primaryAction:)
// macOS 10.15+ / macOS 13.0+ (preview variant)

struct ContextMenuPage: View {
    @State private var selectedItems = Set<String>()
    private let items = ["Alpha", "Beta", "Gamma", "Delta"]

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
            Text("View/contextMenu(menuItems:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Adds a context menu (right-click / Control+click) to a view. Three variants: basic, with preview, and selection-aware.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/menus-and-commands/contextmenu.md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        CMCard(api: ".contextMenu { Button(\"Copy\") {}; Button(\"Delete\", role: .destructive) {} }") {
            RoundedRectangle(cornerRadius: 10)
                .fill(.background.secondary)
                .frame(width: 200, height: 100)
                .overlay(Text("Right-click me").foregroundStyle(.secondary))
                .contextMenu {
                    Button("Copy") {}
                    Button("Paste") {}
                    Divider()
                    Button("Delete", role: .destructive) {}
                }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            CMVariant(title: "contextMenu(menuItems:) — basic") {
                CMCard(api: ".contextMenu { Button(…); Button(…, role: .destructive) }") {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.background.secondary)
                        .frame(width: 200, height: 80)
                        .overlay(Text("Right-click").font(.callout).foregroundStyle(.secondary))
                        .contextMenu {
                            Button("Open") {}
                            Button("Share") {}
                            Divider()
                            Button("Move to Trash", role: .destructive) {}
                        }
                }
            }

            CMVariant(title: "contextMenu(menuItems:preview:) — with hover preview") {
                CMCard(api: ".contextMenu { … } preview: { Image(systemName: \"star.fill\") }") {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.background.secondary)
                        .frame(width: 200, height: 80)
                        .overlay(Text("Long-press (iOS) / right-click (macOS)").font(.caption).foregroundStyle(.secondary).multilineTextAlignment(.center).padding(8))
                        .contextMenu {
                            Button("Favorite") {}
                            Button("Share") {}
                        } preview: {
                            Image(systemName: "star.fill")
                                .font(.largeTitle)
                                .imageScale(.large)
                                .foregroundStyle(.yellow)
                                .padding(24)
                        }
                }
            }

            CMVariant(title: "contextMenu on Text") {
                CMCard(api: "Text(…).contextMenu { … }") {
                    Text("Right-click this text")
                        .font(.headline)
                        .foregroundStyle(.primary)
                        .padding(12)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .contextMenu {
                            Button("Copy Text") {}
                            Button("Look Up") {}
                            Button("Translate") {}
                        }
                }
            }

            CMVariant(title: "contextMenu(forSelectionType:menu:primaryAction:) — List selection") {
                CMCard(api: ".contextMenu(forSelectionType: String.self) { selection in … }",
                       height: 180) {
                    List(items, id: \.self, selection: $selectedItems) { item in
                        Text(item)
                    }
                    .contextMenu(forSelectionType: String.self) { selection in
                        if selection.count == 1 {
                            Button("Open \(selection.first ?? "")") {}
                        }
                        if !selection.isEmpty {
                            Button("Delete \(selection.count) item(s)", role: .destructive) {}
                        }
                    } primaryAction: { selection in
                        // double-click / Return key action
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            CMVariant(title: "Context menu with Picker in menu style") {
                CMCard(api: ".contextMenu { Picker(…).pickerStyle(.inline) }") {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.background.secondary)
                        .frame(width: 200, height: 80)
                        .overlay(Text("Right-click for sort options").font(.caption).foregroundStyle(.secondary))
                        .contextMenu {
                            Picker("Sort By", selection: .constant("Name")) {
                                Text("Name").tag("Name")
                                Text("Date").tag("Date")
                                Text("Size").tag("Size")
                            }.pickerStyle(.inline)
                        }
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowCM(symbol: "cursorarrow.click.2", title: "On macOS, contextMenu activates on right-click or Control+click.",
                      detail: "On iOS it activates on long-press. The menu is presented as an NSMenu on macOS and a UIContextMenuInteraction popover on iOS.")
            NoteRowCM(symbol: "list.bullet", title: "forSelectionType: is the correct pattern for List + multi-selection.",
                      detail: "Pass the same Element type as the list. The closure receives the current selection set — use isEmpty / count to conditionally show items.")
            NoteRowCM(symbol: "photo", title: "preview: is displayed on hover (iOS 16+, macOS 13+).",
                      detail: "The preview view appears when the user long-presses (iOS) or hovers over the context menu trigger (in some macOS configurations). Keep it lightweight.")
        }
    }
}

private struct CMCard<Content: View>: View {
    let api: String
    var height: CGFloat? = nil
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                if let h = height {
                    content().frame(width: 340, height: h)
                } else {
                    content().frame(minWidth: 240, alignment: .leading)
                }
            }
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct CMVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowCM: View {
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
    ContextMenuPage().frame(width: 800, height: 1000)
}
