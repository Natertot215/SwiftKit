import SwiftUI

// SwiftUI `View/sectionActions(content:)` reference page.
// Source: Documentation/SwiftUI/navigation/sectionactions(content:).md
// macOS 15.0+. Adds custom actions to a Section. On macOS the actions appear when
// a user hovers over the section header. Used inside List or sidebar-flavored
// TabView sections to attach an "Add", "Sort", or similar lightweight control.

private let demoFrameWidth: CGFloat = 380
private let demoFrameHeight: CGFloat = 320

struct SectionActionsPage: View {
    @State private var lastAction: String = "—"

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

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/sectionActions(content:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds custom actions to a section.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/sectionactions(content:).md · macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            DemoCard(api: ".sectionActions { Button(\"Add\", systemImage: \"plus\") { … } }") {
                List {
                    Label("Home",   systemImage: "house")
                    Label("Alerts", systemImage: "bell")

                    Section("Categories") {
                        Label("Climate", systemImage: "fan")
                        Label("Lights",  systemImage: "lightbulb")
                    }
                    .sectionActions {
                        Button("Add Category", systemImage: "plus") {
                            lastAction = "Add Category"
                        }
                    }
                }
            }
            Text("Hover over the “Categories” header to reveal the action.")
                .font(.caption)
                .foregroundStyle(.secondary)
            Text("lastAction = \(lastAction)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Single button — \"Add\" pattern") {
                DemoCard(api: ".sectionActions { Button(\"Add\", systemImage: \"plus\") { … } }") {
                    List {
                        Section("Items") {
                            Text("Item 1"); Text("Item 2")
                        }
                        .sectionActions {
                            Button("Add Item", systemImage: "plus") {
                                lastAction = "Add Item"
                            }
                        }
                    }
                }
            }

            VariantBlock(title: "Multiple buttons — Add / Sort / Delete") {
                DemoCard(api: ".sectionActions { Button(\"Add\", …); Button(\"Sort\", …); Button(\"Delete\", …) }") {
                    List {
                        Section("Tasks") {
                            Text("Buy milk"); Text("Call mom"); Text("Ship update")
                        }
                        .sectionActions {
                            Button("Add",    systemImage: "plus")   { lastAction = "Add" }
                            Button("Sort",   systemImage: "arrow.up.arrow.down") { lastAction = "Sort" }
                            Button("Delete", systemImage: "trash")  { lastAction = "Delete" }
                        }
                    }
                }
            }

            VariantBlock(title: "Inside a TabSection (sidebar-style TabView)") {
                DemoCard(api: ".sectionActions on a TabSection — surfaces in the sidebar header") {
                    TabView {
                        Tab("Home", systemImage: "house") {
                            Text("Home pane").foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                        TabSection("Mailboxes") {
                            Tab("Inbox", systemImage: "tray")        {
                                Text("Inbox").foregroundStyle(.secondary)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            Tab("Sent",  systemImage: "paperplane")  {
                                Text("Sent").foregroundStyle(.secondary)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                        }
                        .sectionActions {
                            Button("Add Mailbox", systemImage: "plus") {
                                lastAction = "Add Mailbox"
                            }
                        }
                    }
                    .tabViewStyle(.sidebarAdaptable)
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("lastAction = \(lastAction)")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
                Spacer()
                Button("Reset") { lastAction = "—" }
            }
            APICallout("On macOS the actions render only on hover. On iOS they appear inline at the end of the section.")
        }
    }

    // MARK: Notes

    private struct SANote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [SANote] = [
        .init(title: "macOS — actions appear on hover over the section header.",
              detail: "Move the cursor over a section's header text and the buttons fade in. This keeps lists visually quiet but discoverable. iOS shows the actions inline at the bottom of the section instead.",
              symbol: "cursorarrow"),
        .init(title: "Works on Section (in a List) and TabSection (in a TabView).",
              detail: "Apple's docs show the List + Section pattern; the TabContent protocol also surfaces sectionActions(content:) for sidebar-style TabView sections.",
              symbol: "rectangle.3.group"),
        .init(title: "Use a Button with a system symbol for the standard look.",
              detail: "The convention is Button(_, systemImage:) — the section adopts the symbol-only chrome on macOS hover. Pass plain Button if you only want the title.",
              symbol: "plus.circle"),
        .init(title: "Multiple actions stack horizontally.",
              detail: "Pass several Buttons in the closure to expose multiple actions. They render side-by-side in the section header chrome on macOS.",
              symbol: "rectangle.split.3x1")
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

// MARK: - Page-local helpers

private struct DemoCard<Content: View>: View {
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
    SectionActionsPage()
        .frame(width: 1100, height: 900)
}
