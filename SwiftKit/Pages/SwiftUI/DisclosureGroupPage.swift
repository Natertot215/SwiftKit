import SwiftUI

// SwiftUI `DisclosureGroup` family — merged page covering:
//   1. DisclosureGroup view (four initializers)
//   2. disclosureGroupStyle(_:) modifier + DisclosureGroupStyle protocol
//      (with DisclosureGroupStyleConfiguration)
// Source: Documentation/SwiftUI/lists/disclosuregroup.md,
//         Documentation/SwiftUI/view-styles/disclosuregroupstyle(_:).md
// macOS 11.0+ (DisclosureGroup); macOS 13.0+ (DisclosureGroupStyle protocol).

private let demoFrameWidth: CGFloat = 360

struct DisclosureGroupPage: View {
    @State private var topExpanded = true
    @State private var subExpanded = false
    @State private var oneIsOn = false
    @State private var twoIsOn = true
    @State private var styleExpanded1: Bool = true
    @State private var styleExpanded2: Bool = false

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
            Text("DisclosureGroup + disclosureGroupStyle(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that shows or hides content via a disclosure control, plus the style modifier and protocol for customizing its appearance.")
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
        VStack(alignment: .leading, spacing: 40) {

            // Section 1: DisclosureGroup view
            Group {
                Text("DisclosureGroup")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                Divider()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Four documented initializers — two label forms × two state forms.")
                        .font(.callout)
                        .foregroundStyle(.secondary)

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
                        DemoCard(api: "DisclosureGroup { … DisclosureGroup(\"Sub-items\") { … } }") {
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

            // Section 2: disclosureGroupStyle(_:) + DisclosureGroupStyle protocol
            Group {
                Text("disclosureGroupStyle(_:) + DisclosureGroupStyle")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                Divider()
                VStack(alignment: .leading, spacing: 16) {
                    Text("Sets the style for disclosure groups within this view. Apple ships .automatic publicly. The DisclosureGroupStyle protocol is the extension point for custom conformers.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout("func disclosureGroupStyle<S: DisclosureGroupStyle>(_ style: S) -> some View  // macOS 13.0+")

                    HStack(alignment: .top, spacing: 24) {
                        DGSCard(title: ".automatic — collapsed", api: ".disclosureGroupStyle(.automatic)") {
                            sampleGroup($styleExpanded2).disclosureGroupStyle(.automatic)
                        }
                        DGSCard(title: ".automatic — expanded", api: ".disclosureGroupStyle(.automatic)") {
                            sampleGroup($styleExpanded1).disclosureGroupStyle(.automatic)
                        }
                    }

                    Text("Protocol surface")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    DGSCodeBlock(text:
                        """
                        @MainActor protocol DisclosureGroupStyle {
                            associatedtype Body : View
                            typealias Configuration = DisclosureGroupStyleConfiguration

                            @ViewBuilder @MainActor
                            func makeBody(configuration: Self.Configuration) -> Self.Body
                        }

                        struct DisclosureGroupStyleConfiguration {
                            @Binding var isExpanded: Bool
                            var label: Label          // type-erased title
                            var content: Content      // type-erased body
                        }
                        """)
                    Text("Public conformer types are private; .automatic is the only literal you reference.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
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
        .init(title: ".automatic is the only public DisclosureGroupStyle conformer.",
              detail: "Custom conformers exist via the protocol but Apple ships no .borderless / .indented / etc. literals. The Configuration exposes isExpanded as a Binding — that's how disclosure triangle clicks toggle the group.",
              symbol: "chevron.down.circle"),
        .init(title: "DisclosureGroupStyle requires macOS 13.0+; DisclosureGroup is macOS 11+.",
              detail: "DisclosureGroup landed on macOS 11. The styling protocol was retrofitted in macOS 13 — older OS just renders the default appearance without any style modifier.",
              symbol: "calendar")
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

    // MARK: Helper

    private func sampleGroup(_ binding: Binding<Bool>) -> some View {
        DisclosureGroup("Advanced", isExpanded: binding) {
            VStack(alignment: .leading, spacing: 4) {
                Toggle("Auto-update", isOn: .constant(true))
                Toggle("Send analytics", isOn: .constant(false))
                Toggle("Beta channel", isOn: .constant(false))
            }
        }
    }
}

// MARK: - Page-local demo helpers

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
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct DGSCard<Content: View>: View {
    let title: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .padding(12)
                .frame(width: 320, height: 200, alignment: .topLeading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
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
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }
}

private struct DGSCodeBlock: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.callout)
            .fontDesign(.monospaced)
            .textSelection(.enabled)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

#Preview {
    DisclosureGroupPage()
        .frame(width: 1200, height: 1200)
}
