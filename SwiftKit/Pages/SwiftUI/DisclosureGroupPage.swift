import SwiftUI

// SwiftUI `DisclosureGroup` reference page.
// Source: Documentation/SwiftUI/lists/disclosuregroup.md
// Four documented initializers:
//   init(_:content:)                        — uncontrolled, string label
//   init(content:label:)                    — uncontrolled, view-builder label
//   init(_:isExpanded:content:)             — controlled, string label
//   init(isExpanded:content:label:)         — controlled, view-builder label
// macOS 11.0+. Style hooks via `.disclosureGroupStyle(_:)` are deferred to that page.

private let demoFrameWidth: CGFloat = 360

struct DisclosureGroupPage: View {
    @State private var topExpanded = true
    @State private var subExpanded = false
    @State private var oneIsOn = false
    @State private var twoIsOn = true

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
            Text("DisclosureGroup")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that shows or hides another content view, based on the state of a disclosure control.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/disclosuregroup.md · macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "DisclosureGroup(\"Items\") { Toggle(\"Toggle 1\", isOn:); Toggle(\"Toggle 2\", isOn:) }") {
            DisclosureGroup("Items") {
                Toggle("Toggle 1", isOn: $oneIsOn)
                Toggle("Toggle 2", isOn: $twoIsOn)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "String label, uncontrolled state") {
                DemoCard(api: "DisclosureGroup(\"Items\") { … }") {
                    DisclosureGroup("Items") {
                        Toggle("Toggle 1", isOn: $oneIsOn)
                        Toggle("Toggle 2", isOn: $twoIsOn)
                    }
                }
            }

            VariantBlock(title: "View-builder label, uncontrolled state") {
                DemoCard(api: "DisclosureGroup { … } label: { Label(\"Items\", systemImage: \"folder\") }") {
                    DisclosureGroup {
                        Toggle("Toggle 1", isOn: $oneIsOn)
                        Toggle("Toggle 2", isOn: $twoIsOn)
                    } label: {
                        Label("Items", systemImage: "folder")
                    }
                }
            }

            VariantBlock(title: "Nested groups") {
                DemoCard(api: "DisclosureGroup(\"Items\") { … DisclosureGroup(\"Sub-items\") { … } }") {
                    DisclosureGroup("Items") {
                        Toggle("Toggle 1", isOn: $oneIsOn)
                        Toggle("Toggle 2", isOn: $twoIsOn)
                        DisclosureGroup("Sub-items") {
                            Text("Sub-item 1")
                            Text("Sub-item 2")
                        }
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Controlled — bound to @State") {
                DemoCard(api: "DisclosureGroup(\"Items\", isExpanded: $topExpanded) { … }") {
                    DisclosureGroup("Items", isExpanded: $topExpanded) {
                        Toggle("Toggle 1", isOn: $oneIsOn)
                        Toggle("Toggle 2", isOn: $twoIsOn)
                    }
                }
                HStack(spacing: 12) {
                    Button(topExpanded ? "Collapse" : "Expand") {
                        topExpanded.toggle()
                    }
                    Text("isExpanded = \(String(describing: topExpanded))")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantBlock(title: "Side-by-side — collapsed vs expanded") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "Collapsed (.constant(false))") {
                        DisclosureGroup("Items", isExpanded: .constant(false)) {
                            Text("hidden")
                        }
                    }
                    StateColumn(label: "Expanded (.constant(true))") {
                        DisclosureGroup("Items", isExpanded: .constant(true)) {
                            Text("Toggle 1")
                            Text("Toggle 2")
                        }
                    }
                }
            }

            VariantBlock(title: "Inside a List — common SwiftKit usage") {
                DemoCard(api: "List { DisclosureGroup(\"Folder\") { Text(\"Item\") } }",
                         height: 220) {
                    List {
                        DisclosureGroup("Reference") {
                            Text("Typography")
                            Text("Colors")
                            Text("Materials")
                        }
                        DisclosureGroup("SwiftUI", isExpanded: $subExpanded) {
                            Text("List")
                            Text("DisclosureGroup")
                        }
                        DisclosureGroup("AppKit") {
                            Text("NSOutlineView")
                            Text("NSTableView")
                        }
                    }
                }
            }
        }
    }

    // MARK: Notes

    private struct DGNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [DGNote] = [
        .init(title: "Two label forms; two state forms; four initializers.",
              detail: "init(_:content:) and init(content:label:) own their expansion state internally. init(_:isExpanded:content:) and init(isExpanded:content:label:) require a Binding<Bool> — use these when external code (Expand-All, deep links, persistence) needs to drive the state.",
              symbol: "switch.2"),
        .init(title: "Disclosure chevron is provided — never draw your own.",
              detail: "DisclosureGroup renders the platform's disclosure indicator (chevron on macOS) and handles its rotation, focus ring, and click target. Drawing a custom chevron alongside the label produces double indicators.",
              symbol: "chevron.right"),
        .init(title: "Nest freely — each nested group manages its own state.",
              detail: "An inner DisclosureGroup is a fresh instance with its own expansion state (or its own binding, if controlled). There is no parent/child cascade: collapsing the outer group hides — but does not collapse — the inner group's state.",
              symbol: "list.bullet.indent"),
        .init(title: "Inside a List, DisclosureGroup is how SwiftKit's sidebar renders.",
              detail: "SwiftKit's SidebarView composes DisclosureGroups inside List(selection:).listStyle(.sidebar). The List provides selection chrome, row metrics, and source-list material; the DisclosureGroup provides expand/collapse. See SwiftKit/App/SidebarView.swift.",
              symbol: "sidebar.left"),
        .init(title: "Style via .disclosureGroupStyle(_:) — separate page.",
              detail: "macOS supports the .automatic style by default. Custom DisclosureGroupStyle conformers can replace the chevron + label arrangement. That surface is documented under View styles → disclosureGroupStyle(_:).",
              symbol: "paintbrush")
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

// MARK: - Reusable demo helpers (page-local)

private struct DemoCard<Content: View>: View {
    let api: String
    var height: CGFloat? = nil
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                if let height {
                    content()
                        .frame(width: demoFrameWidth, height: height)
                } else {
                    content()
                        .frame(width: demoFrameWidth, alignment: .leading)
                }
            }
            .padding(12)
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

private struct StateColumn<Content: View>: View {
    let label: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: 280, alignment: .leading)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
        }
    }
}

#Preview {
    DisclosureGroupPage()
        .frame(width: 1100, height: 800)
}
