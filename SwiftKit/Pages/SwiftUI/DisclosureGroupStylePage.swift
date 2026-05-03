import SwiftUI

// SwiftUI `View/disclosureGroupStyle(_:)` + `DisclosureGroupStyle` page.
// Source: Documentation/SwiftUI/view-styles/disclosuregroupstyle(_:).md, disclosuregroupstyle.md
// macOS 13.0+. Built-in style values: .automatic. (Apple ships only the
// automatic style publicly; the protocol exists for custom conformers.)

private let demoFrameWidth: CGFloat = 320
private let demoFrameHeight: CGFloat = 200

struct DisclosureGroupStylePage: View {
    @State private var expanded1: Bool = true
    @State private var expanded2: Bool = false

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
            Text("View/disclosureGroupStyle(_:) + DisclosureGroupStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for disclosure groups within this view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/disclosuregroupstyle(_:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DGSCard(title: ".automatic", api: ".disclosureGroupStyle(.automatic)") {
            sampleGroup($expanded1).disclosureGroupStyle(.automatic)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Apple ships .automatic publicly. The DisclosureGroupStyle protocol is the extension point for custom conformers — SwiftKit doesn't author them per project hard constraint.")
                .font(.callout)
                .foregroundStyle(.secondary)
            HStack(alignment: .top, spacing: 24) {
                DGSCard(title: ".automatic — collapsed", api: ".disclosureGroupStyle(.automatic)") {
                    sampleGroup($expanded2).disclosureGroupStyle(.automatic)
                }
                DGSCard(title: ".automatic — expanded", api: ".disclosureGroupStyle(.automatic)") {
                    sampleGroup($expanded1).disclosureGroupStyle(.automatic)
                }
            }
        }
    }

    private func sampleGroup(_ binding: Binding<Bool>) -> some View {
        DisclosureGroup("Advanced", isExpanded: binding) {
            VStack(alignment: .leading, spacing: 4) {
                Toggle("Auto-update", isOn: .constant(true))
                Toggle("Send analytics", isOn: .constant(false))
                Toggle("Beta channel", isOn: .constant(false))
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Protocol surface")
                .font(.headline)
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
                    var label: Label             // type-erased title
                    var content: Content         // type-erased body
                }
                """)
            Text("Public conformer types are private; .automatic is the only literal you reference.")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }

    private struct DGSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [DGSNote] = [
        .init(title: ".automatic is the only public conformer.",
              detail: "Custom conformers exist via the protocol but Apple ships no .borderless / .indented / etc. literals. Use the modifier to maintain forward-compatibility.",
              symbol: "chevron.down.circle"),
        .init(title: "macOS 13.0+ for the modifier; DisclosureGroup itself is macOS 11+.",
              detail: "DisclosureGroup landed on macOS 11. The styling protocol was retrofitted in macOS 13 — older OS just renders the default.",
              symbol: "calendar"),
        .init(title: "Configuration exposes isExpanded as a Binding.",
              detail: "Custom conformers can mutate isExpanded — that's how disclosure triangle clicks toggle the group. Don't gate on a separate state.",
              symbol: "arrow.up.arrow.down"),
        .init(title: "Often invisible — most apps use plain DisclosureGroup.",
              detail: "Most SwiftUI code never reaches for .disclosureGroupStyle(_:) because the default suits Mac form / inspector contexts. The modifier is here for advanced theming.",
              symbol: "info.circle")
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
                .frame(width: demoFrameWidth, height: demoFrameHeight, alignment: .topLeading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
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
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }
}

#Preview {
    DisclosureGroupStylePage()
        .frame(width: 1200, height: 1000)
}
